
#if defined(STM32F1)

// mode is using only bits 6-2
#define IO_CONFIG(mode, speed) ((mode) | (speed))

#define IOCFG_OUT_PP         IO_CONFIG(GPIO_Mode_Out_PP,      GPIO_Speed_2MHz)
#define IOCFG_OUT_OD         IO_CONFIG(GPIO_Mode_Out_OD,      GPIO_Speed_2MHz)
#define IOCFG_AF_PP          IO_CONFIG(GPIO_Mode_AF_PP,       GPIO_Speed_2MHz)
#define IOCFG_AF_OD          IO_CONFIG(GPIO_Mode_AF_OD,       GPIO_Speed_2MHz)
#define IOCFG_IPD            IO_CONFIG(GPIO_Mode_IPD,         GPIO_Speed_2MHz)
#define IOCFG_IPU            IO_CONFIG(GPIO_Mode_IPU,         GPIO_Speed_2MHz)
#define IOCFG_IN_FLOATING    IO_CONFIG(GPIO_Mode_IN_FLOATING, GPIO_Speed_2MHz)

