#ifndef DRV_I2C
#define DRV_I2C

#include "hal_data.h"

typedef struct I2CDev {
  char *name;
  int (*Init)(struct I2CDev *ptDev);
  int (*Write)(struct I2CDev *ptDev, unsigned char ucAddr,
               unsigned char const *wBuf, unsigned int dwSize);
  int (*Read)(struct I2CDev *ptDev, unsigned char ucAddr, unsigned char *rBuf,
              unsigned int dwSize);
} I2CDev, *PI2CDev;

struct I2CDev *EEPROMGetDevice(void);

#endif /* DRV_I2C_H_ */
