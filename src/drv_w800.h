#ifndef DRV_W800_H
#define DRV_W800_H

#include <stdint.h>
#include "hal_data.h"
#include "circle_buf.h"

typedef enum {
    W800_STATE_IDLE,
    W800_STATE_WIFI_CONNECTING,
    W800_STATE_WIFI_CONNECTED,
    W800_STATE_TCP_CONNECTING,
    W800_STATE_TCP_CONNECTED,
    W800_STATE_ERROR
} W800State_t;

typedef struct W800Dev {
    char           *name;
    int            (*Init)(struct W800Dev *ptDev);
    int            (*ConnectWiFi)(struct W800Dev *ptDev, const char *ssid, const char *password);
    int            (*ConnectTCP)(struct W800Dev *ptDev, const char *ip, uint16_t port);
    int            (*Send)(struct W800Dev *ptDev, const uint8_t *data, uint16_t len);
    int            (*Receive)(struct W800Dev *ptDev, uint8_t *data, uint16_t maxLen);
    W800State_t    state;
    char           ip_addr[16];
    int            socket_fd;
} W800Dev, *PW800Dev;

struct W800Dev *W800GetDevice(void);
int W800_WaitResponse(const char *expected, uint32_t timeout_ms);

#endif
