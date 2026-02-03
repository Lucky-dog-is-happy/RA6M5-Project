#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#define WINDOW_WIDTH 1000
#define WINDOW_HEIGHT 700
#define ANIMATION_DELAY_MS 300
#define MAX_POINTS 2000  // 增大数组避免溢出
typedef struct {
    int x, y;
    int d;
    int step;
} CircleState;
typedef struct { 
    int x, y; 
} Point;
// 颜色定义
SDL_Color COLOR_BG = {20, 20, 30, 255};
SDL_Color COLOR_GRID = {50, 50, 60, 255};
SDL_Color COLOR_AXIS = {100, 100, 120, 255};
SDL_Color COLOR_CIRCLE = {0, 255, 0, 255};
SDL_Color COLOR_CURRENT = {255, 255, 0, 255};
SDL_Color COLOR_HIGHLIGHT = {255, 100, 100, 255};
SDL_Color COLOR_TEXT = {255, 255, 255, 255};
SDL_Color COLOR_INFO = {150, 200, 255, 255};
// 坐标转换：数学坐标 -> 屏幕坐标
void toScreen(int cx, int cy, int mx, int my, int *sx, int *sy) {
    *sx = cx + mx;
    *sy = cy - my;
}
// 画网格
void drawGrid(SDL_Renderer *r, int cx, int cy) {
    SDL_SetRenderDrawColor(r, COLOR_GRID.r, COLOR_GRID.g, COLOR_GRID.b, 255);
    
    // 垂直线
    for (int x = cx % 20; x < WINDOW_WIDTH; x += 20) {
        SDL_RenderDrawLine(r, x, 0, x, WINDOW_HEIGHT);
    }
    // 水平线
    for (int y = cy % 20; y < WINDOW_HEIGHT; y += 20) {
        SDL_RenderDrawLine(r, 0, y, WINDOW_WIDTH, y);
    }
    
    // 坐标轴
    SDL_SetRenderDrawColor(r, COLOR_AXIS.r, COLOR_AXIS.g, COLOR_AXIS.b, 255);
    SDL_RenderDrawLine(r, cx, 0, cx, WINDOW_HEIGHT);
    SDL_RenderDrawLine(r, 0, cy, WINDOW_WIDTH, cy);
}
// 画一个点（带发光效果）
void drawPoint(SDL_Renderer *r, int x, int y, SDL_Color c, int size) {
    SDL_SetRenderDrawColor(r, c.r, c.g, c.b, 255);
    for (int dy = -size; dy <= size; dy++) {
        for (int dx = -size; dx <= size; dx++) {
            if (dx*dx + dy*dy <= size*size) {
                SDL_RenderDrawPoint(r, x + dx, y + dy);
            }
        }
    }
}
// 画圆心
void drawCenter(SDL_Renderer *r, int cx, int cy) {
    drawPoint(r, cx, cy, (SDL_Color){255, 0, 0, 255}, 4);
    
    SDL_SetRenderDrawColor(r, 255, 0, 0, 255);
    SDL_RenderDrawLine(r, cx-8, cy, cx+8, cy);
    SDL_RenderDrawLine(r, cx, cy-8, cx, cy+8);
}
// 保存当前8个对称点到数组
int saveCirclePoints(Point *points, int *count, int cx, int cy, int x, int y, int maxCount) {
    int coords[8][2] = {
        {x, y}, {-x, y}, {x, -y}, {-x, -y},
        {y, x}, {-y, x}, {y, -x}, {-y, -x}
    };
    
    int added = 0;
    for (int i = 0; i < 8 && *count < maxCount; i++) {
        // 检查是否已存在（避免x=y或x=0时的重复）
        bool exists = false;
        for (int j = 0; j < *count; j++) {
            int sx, sy;
            toScreen(cx, cy, coords[i][0], coords[i][1], &sx, &sy);
            if (points[j].x == sx && points[j].y == sy) {
                exists = true;
                break;
            }
        }
        
        if (!exists) {
            toScreen(cx, cy, coords[i][0], coords[i][1], &points[*count].x, &points[*count].y);
            (*count)++;
            added++;
        }
    }
    return added;
}
// 显示算法状态信息
void drawInfo(SDL_Renderer *r, CircleState *state, int radius, bool autoPlay, int totalPoints) {
    // 背景面板
    SDL_SetRenderDrawColor(r, 30, 30, 40, 200);
    SDL_Rect panel = {10, 10, 300, 180};
    SDL_RenderFillRect(r, &panel);
    
    SDL_SetRenderDrawColor(r, COLOR_INFO.r, COLOR_INFO.g, COLOR_INFO.b, 255);
    SDL_Rect statusRect = {20, 20, 10, 10};
    SDL_RenderFillRect(r, &statusRect);
    
    // 输出到控制台
    printf("\rStep: %d | x: %d, y: %d | d: %d | Points: %d | %s    ", 
           state->step, state->x, state->y, state->d, totalPoints,
           autoPlay ? "AUTO" : "MANUAL");
    fflush(stdout);
}
// 可视化画圆的一步
void drawCircleStep(SDL_Renderer *r, int cx, int cy, CircleState *state, int radius) {
    int x = state->x;
    int y = state->y;
    
    int sx[8], sy[8];
    toScreen(cx, cy, x, y, &sx[0], &sy[0]);
    toScreen(cx, cy, -x, y, &sx[1], &sy[1]);
    toScreen(cx, cy, x, -y, &sx[2], &sy[2]);
    toScreen(cx, cy, -x, -y, &sx[3], &sy[3]);
    toScreen(cx, cy, y, x, &sx[4], &sy[4]);
    toScreen(cx, cy, -y, x, &sx[5], &sy[5]);
    toScreen(cx, cy, y, -x, &sx[6], &sy[6]);
    toScreen(cx, cy, -y, -x, &sx[7], &sy[7]);
    
    // 画8个对称点（当前步骤用高亮色）
    for (int i = 0; i < 8; i++) {
        if (sx[i] >= 0 && sx[i] < WINDOW_WIDTH && 
            sy[i] >= 0 && sy[i] < WINDOW_HEIGHT) {
            drawPoint(r, sx[i], sy[i], COLOR_CURRENT, 4);
        }
    }
    
    // 画从圆心到第一象限当前点的线（帮助理解）
    if (x <= y) {
        SDL_SetRenderDrawColor(r, 255, 200, 0, 255);
        SDL_RenderDrawLine(r, cx, cy, sx[0], sy[0]);
    }
}
// 执行一步算法
bool stepCircle(CircleState *state) {
    if (state->x > state->y) return false;
    
    state->x++;
    if (state->d > 0) {
        state->y--;
        state->d = state->d + 4 * (state->x - state->y) + 10;
    } else {
        state->d = state->d + 4 * state->x + 6;
    }
    state->step++;
    
    return state->x <= state->y;
}
int main(int argc, char *argv[]) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "SDL初始化失败: %s\n", SDL_GetError());
        return 1;
    }
    
    SDL_Window *window = SDL_CreateWindow(
        "中点画圆算法可视化 - [空格]单步 [回车]自动 [R]重置 [ESC]退出",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
    
    if (!window) {
        fprintf(stderr, "窗口创建失败\n");
        SDL_Quit();
        return 1;
    }
    
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 
        SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (!renderer) {
        fprintf(stderr, "渲染器创建失败\n");
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 1;
    }
    
    // 设置圆心和半径
    int centerX = WINDOW_WIDTH / 2;
    int centerY = WINDOW_HEIGHT / 2;
    int radius = 200;
    
    // 初始化算法状态
    CircleState state = {
        .x = 0,
        .y = radius,
        .d = 3 - 2 * radius,
        .step = 0
    };
    
    // 保存已画的点（扩大到2000）
    Point drawnPoints[MAX_POINTS];
    int numDrawn = 0;
    
    // 立即保存初始点(0, r)的8个对称点！
    saveCirclePoints(drawnPoints, &numDrawn, centerX, centerY, state.x, state.y, MAX_POINTS);
    
    bool running = true;
    bool autoPlay = false;
    Uint32 lastStepTime = 0;
    bool needSave = false;  // 标记是否需要保存当前点
    
    printf("\n=== 中点画圆算法可视化 ===\n");
    printf("圆心: (%d, %d), 半径: %d\n", centerX, centerY, radius);
    printf("初始: x=0, y=r=%d, d=3-2r=%d\n", radius, state.d);
    printf("数组容量: %d 点\n\n", MAX_POINTS);
    printf("控制键:\n");
    printf("  [空格] - 单步执行\n");
    printf("  [回车] - 切换自动/手动模式\n");
    printf("  [R]    - 重置\n");
    printf("  [ESC]  - 退出\n\n");
    
    while (running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            switch (event.type) {
                case SDL_QUIT:
                    running = false;
                    break;
                    
                case SDL_KEYDOWN:
                    switch (event.key.keysym.sym) {
                        case SDLK_SPACE:
                            if (state.x <= state.y) {
                                needSave = true;
                                stepCircle(&state);
                            }
                            autoPlay = false;
                            break;
                            
                        case SDLK_RETURN:
                            autoPlay = !autoPlay;
                            printf("\n模式切换到: %s\n", autoPlay ? "自动播放" : "手动单步");
                            break;
                            
                        case SDLK_r:
                            // 重置
                            state.x = 0;
                            state.y = radius;
                            state.d = 3 - 2 * radius;
                            state.step = 0;
                            numDrawn = 0;
                            autoPlay = false;
                            // 保存初始点
                            saveCirclePoints(drawnPoints, &numDrawn, centerX, centerY, 
                                           state.x, state.y, MAX_POINTS);
                            printf("\n=== 已重置 ===\n");
                            break;
                            
                        case SDLK_ESCAPE:
                            running = false;
                            break;
                    }
                    break;
            }
        }
        
        // 自动播放模式
        if (autoPlay && state.x <= state.y) {
            Uint32 now = SDL_GetTicks();
            if (now - lastStepTime > ANIMATION_DELAY_MS) {
                needSave = true;
                stepCircle(&state);
                lastStepTime = now;
            }
        }
        
        // 如果有需要保存的点
        if (needSave && numDrawn < MAX_POINTS) {
            // 保存上一步的点（注意：stepCircle已经更新了state，所以这里保存的是新x,y对应的点）
            // 实际上我们需要保存的是step之前的点...
            // 修正：在step之前保存，或者计算前一个状态
            int prevX = state.x;
            int prevY = state.y;
            
            // 如果d是更新后的，需要倒推判断y是否变化了
            // 简单方法：直接保存当前8个点（会包含一些重复，但去重函数会处理）
            int added = saveCirclePoints(drawnPoints, &numDrawn, centerX, centerY, 
                                        prevX, prevY, MAX_POINTS);
            
            needSave = false;
        }
        
        // 渲染
        SDL_SetRenderDrawColor(renderer, COLOR_BG.r, COLOR_BG.g, COLOR_BG.b, 255);
        SDL_RenderClear(renderer);
        
        // 画网格
        drawGrid(renderer, centerX, centerY);
        
        // 画圆心
        drawCenter(renderer, centerX, centerY);
        
        // 画已完成的点（绿色）
        for (int i = 0; i < numDrawn; i++) {
            drawPoint(renderer, drawnPoints[i].x, drawnPoints[i].y, COLOR_CIRCLE, 2);
        }
        
        // 画当前步骤（如果还没完成）
        if (state.x <= state.y) {
            drawCircleStep(renderer, centerX, centerY, &state, radius);
        }
        
        // 画半径圆（虚线参考）
        SDL_SetRenderDrawColor(renderer, 80, 80, 100, 255);
        for (int i = 0; i < 360; i += 5) {
            double rad = i * M_PI / 180;
            int rx = centerX + radius * cos(rad);
            int ry = centerY - radius * sin(rad);
            SDL_RenderDrawPoint(renderer, rx, ry);
        }
        
        // 显示信息
        drawInfo(renderer, &state, radius, autoPlay, numDrawn);
        
        // 画帮助框
        SDL_SetRenderDrawColor(renderer, 200, 200, 200, 255);
        SDL_Rect helpBox = {WINDOW_WIDTH - 250, 10, 240, 100};
        SDL_RenderDrawRect(renderer, &helpBox);
        
        SDL_RenderPresent(renderer);
        SDL_Delay(16);
    }
    
    printf("\n\n总共绘制了 %d 个点\n", numDrawn);
    printf("程序结束\n");
    
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    
    return 0;
}

