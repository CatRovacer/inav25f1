#
# F1 Make file include
#

ifeq ($(OPBL),yes)
LD_SCRIPT = $(LINKER_DIR)/stm32_flash_f103_$(FLASH_SIZE)k_opbl.ld
endif

TARGET_FLASH   := 128
MCU_COMMON_SRC  = startup_stm32f10x_md_gcc.S
#MCU_COMMON_SRC  = startup_stm32f10x_md.s

STDPERIPH_DIR   = $(ROOT)/lib/main/STM32F1/Drivers/STM32F10x_StdPeriph_Driver
STDPERIPH_SRC   = $(notdir $(wildcard $(STDPERIPH_DIR)/src/*.c))
EXCLUDES        = stm32f10x_crc.c \
                  stm32f10x_can.c
STARTUP_SRC     = startup_stm32f10x_md_gcc.S
#STARTUP_SRC     = startup_stm32f10x_md.s

STDPERIPH_SRC   := $(filter-out ${EXCLUDES}, $(STDPERIPH_SRC))
DEVICE_STDPERIPH_SRC = $(STDPERIPH_SRC)

VPATH           := $(VPATH):$(CMSIS_DIR)/Core/Include
CMSIS_SRC       = $(notdir $(wildcard $(ROOT)/lib/main/STM32F1/Drivers/CMSIS/Device/ST/STM32F10x/*.c))

INCLUDE_DIRS    := $(INCLUDE_DIRS) \
                   $(STDPERIPH_DIR)/inc \
                   $(CMSIS_DIR)/Core/Include \
                   $(ROOT)/lib/main/STM32F1/Drivers/CMSIS/Device/ST/STM32F10x


LD_SCRIPT       = $(LINKER_DIR)/stm32_flash_f103_$(FLASH_SIZE)k.ld

#ARCH_FLAGS      = -mthumb -mcpu=cortex-m3 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fsingle-precision-constant -Wdouble-promotion
ARCH_FLAGS      = -mthumb -mcpu=cortex-m3 
DEVICE_FLAGS    = -DSTM32F10X -DSTM32F10X_MD

#            target/system_stm32f10x.c \

MCU_COMMON_SRC = \
            startup_stm32f10x_md_gcc.S \
            drivers/accgyro/accgyro.c \
            drivers/adc_stm32f10x.c \
            drivers/bus_i2c_stm32f10x.c \
            drivers/dma_stm32f1xx.c \
            drivers/serial_uart_stm32f10x.c \
            drivers/system_stm32f10x.c \
            drivers/timer_impl_stdperiph.c \
            drivers/timer_stm32f10x.c

#DSP_LIB := $(ROOT)/lib/main/CMSIS/DSP
#DEVICE_FLAGS += -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -D__FPU_PRESENT=1 -DUNALIGNED_SUPPORT_DISABLE -DARM_MATH_CM4
