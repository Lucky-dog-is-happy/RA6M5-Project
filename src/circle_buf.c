#include "circle_buf.h"

static uint8_t rx_buf[64];
circle_buf_t g_rx_buf;

static int32_t circlebuf_put(struct circle_buf *pcb, uint8_t v);
static int32_t circlebuf_get(struct circle_buf *pcb, uint8_t *pv);

void circlebuf_init(void)
{
    g_rx_buf.r = g_rx_buf.w = 0;
    g_rx_buf.max_len = sizeof(rx_buf);
    g_rx_buf.buffer = rx_buf;
    g_rx_buf.put = circlebuf_put;
    g_rx_buf.get = circlebuf_get;
}   

static int32_t circlebuf_put(struct circle_buf *pcb, uint8_t v)
{
    uint32_t next_w;

    // 将要写的位置的下一位
    next_w = pcb->w + 1;
    // 如果越界设置为0, 回环
    if(next_w == pcb->max_len)
        next_w = 0;

    // 判断buffer没满
    if(next_w != pcb->r)
    {
        pcb->buffer[pcb->w] = v;

        pcb->w = next_w;
        return 0;
    }
    
    // 满了
    return -1;
}

static int32_t circlebuf_get(struct circle_buf *pcb, uint8_t *pv)
{
    // 判断buffer没满
    if(pcb->w != pcb->r)
    {
        *pv = pcb->buffer[pcb->r];

        pcb->r++;
        // 如果越界设置为0
        if(pcb->r == pcb->max_len)
            pcb->r = 0;

        return 0;
    }

    // 满了
    return -1;
}
