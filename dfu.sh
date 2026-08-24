arm-none-eabi-objcopy -O binary ./obj/main/inav_MATEKF411TE.elf ./obj/inav25.bin
dfu-util -a 0 -D ./obj/inav25.bin -s 0x8000000:leave -R
