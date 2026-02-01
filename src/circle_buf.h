#ifndef CIRCLE_BUF
#define CIRCLE_BUF

#include <stdint.h>

typedef struct circle_buf {
    uint32_t r;
    uint32_t w;
    uint32_t max_len;
    uint8_t *buffer;
    int32_t (*put)(struct circle_buf *pcb, uint8_t v);
    int32_t (*get)(struct circle_buf *pcb, uint8_t *pv);
} circle_buf_t;

extern circle_buf_t g_rx_buf;
void circlebuf_init(void);

#endif // !CIRCLE_BUF
