#ifndef DRV_GPIO
#define DRV_GPIO

#include "hal_data.h"

typedef enum{
    LowLevel,
    HighLevel,
    ErrLevel = -1
} IODevState_t;

typedef struct IODev {
    char        *name;
    int         (*Init)(struct IODev *ptDev);
    int         (*Write)(struct IODev *ptDev, IODevState_t level);
    IODevState_t (*Read)(struct IODev *ptdev);
}IODev, *PIODev;

struct IODev *IOGetDevice(const char *name);

#endif
