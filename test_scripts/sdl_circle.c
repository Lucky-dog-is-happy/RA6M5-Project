#include <SDL2/SDL.h>
#include <stdbool.h>
#include <stdio.h>
// RGB565和RGB888的颜色结构
typedef struct {
  uint8_t r;
  uint8_t g;
  uint8_t b;
} Color888;
typedef uint16_t Color565;
// RGB888转RGB565
Color565 RGB888to565(uint8_t r, uint8_t g, uint8_t b) {
  return ((r >> 3) << 11) | ((g >> 2) << 5) | (b >> 3);
}
// 方法1：扫描线填充法（类似你的原始代码）
void drawFilledCircle_Scalar(SDL_Renderer *renderer, int centerX, int centerY,
                             int radius, Color888 color) {
  SDL_SetRenderDrawColor(renderer, color.r, color.g, color.b, 255);

  for (int y = -radius; y <= radius; y++) {
    for (int x = -radius; x <= radius; x++) {
      if (x * x + y * y <= radius * radius) {
        SDL_RenderDrawPoint(renderer, centerX + x, centerY + y);
      }
    }
  }
}
// 方法2：中点圆算法（更高效，利用对称性）
void drawFilledCircle_Midpoint(SDL_Renderer *renderer, int centerX, int centerY,
                               int radius, Color888 color) {
  SDL_SetRenderDrawColor(renderer, color.r, color.g, color.b, 255);

  for (int y = -radius; y <= radius; y++) {
    int x = (int)sqrt(radius * radius - y * y);
    SDL_RenderDrawLine(renderer, centerX - x, centerY + y, centerX + x,
                       centerY + y);
  }
}
// 画空心圆（轮廓）
void drawCircle_Outline(SDL_Renderer *renderer, int centerX, int centerY,
                        int radius, Color888 color) {
  SDL_SetRenderDrawColor(renderer, color.r, color.g, color.b, 255);

  int x = 0;
  int y = radius;
  int d = 3 - 2 * radius;

  while (y >= x) {
    // 利用8路对称性画8个点
    SDL_RenderDrawPoint(renderer, centerX + x, centerY + y);
    SDL_RenderDrawPoint(renderer, centerX - x, centerY + y);
    SDL_RenderDrawPoint(renderer, centerX + x, centerY - y);
    SDL_RenderDrawPoint(renderer, centerX - x, centerY - y);
    SDL_RenderDrawPoint(renderer, centerX + y, centerY + x);
    SDL_RenderDrawPoint(renderer, centerX - y, centerY + x);
    SDL_RenderDrawPoint(renderer, centerX + y, centerY - x);
    SDL_RenderDrawPoint(renderer, centerX - y, centerY - x);

    x++;
    if (d > 0) {
      y--;
      d = d + 4 * (x - y) + 10;
    } else {
      d = d + 4 * x + 6;
    }
  }
}
int main(int argc, char *argv[]) {
  // 初始化SDL
  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
    fprintf(stderr, "SDL初始化失败: %s\n", SDL_GetError());
    return 1;
  }

  // 创建窗口
  int windowWidth = 800;
  int windowHeight = 600;
  SDL_Window *window = SDL_CreateWindow("SDL2 画圆示例", SDL_WINDOWPOS_CENTERED,
                                        SDL_WINDOWPOS_CENTERED, windowWidth,
                                        windowHeight, SDL_WINDOW_SHOWN);

  if (!window) {
    fprintf(stderr, "窗口创建失败: %s\n", SDL_GetError());
    SDL_Quit();
    return 1;
  }

  // 创建渲染器
  SDL_Renderer *renderer =
      SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
  if (!renderer) {
    fprintf(stderr, "渲染器创建失败: %s\n", SDL_GetError());
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 1;
  }

  bool running = true;
  SDL_Event event;

  // 定义颜色
  Color888 green = {0, 255, 0};
  Color888 red = {255, 0, 0};
  Color888 blue = {0, 0, 255};
  Color888 yellow = {255, 255, 0};

  while (running) {
    // 处理事件
    while (SDL_PollEvent(&event)) {
      if (event.type == SDL_QUIT) {
        running = false;
      }
    }

    // 清空屏幕（黑色背景）
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);

    // 画圆
    // 1. 扫描线法实心圆 - 左侧
    drawFilledCircle_Scalar(renderer, windowWidth / 4, windowHeight / 3, 100,
                            green);

    // 2. 中点算法实心圆 - 右侧
    drawFilledCircle_Midpoint(renderer, windowWidth * 3 / 4, windowHeight / 3,
                              100, red);

    // 3. 空心圆 - 下方中间
    drawCircle_Outline(renderer, windowWidth / 2, windowHeight * 2 / 3, 80,
                       yellow);

    // 在空心圆内部画一个小实心圆
    drawFilledCircle_Midpoint(renderer, windowWidth / 2, windowHeight * 2 / 3,
                              40, blue);

    // 显示到屏幕
    SDL_RenderPresent(renderer);

    SDL_Delay(16); // 约60FPS
  }

  // 清理资源
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit();

  return 0;
}
