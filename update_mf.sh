#!/bin/bash

# if [ -e Makefile ]; then
# 	echo -e "\e[0;32mBacking up original Makefile...\e[0m"
# 	cp Makefile Makefile.orig
# fi

echo -e "\e[0;32mInstalling working linker script...\e[0m"
cp "./MFGEN/good_linkscript.ld" "./TrueSTUDIO/discovery4make Configuration/STM32F303VC_FLASH.ld"

echo -e "\e[0;32mGenerate Makefile...\e[0m"
./MFGEN/CubeMX2Makefile.py .

echo -e "\e[0;32mPatching Makefile...\e[0m"
#cp Makefile Makefile.patch-bak
patch Makefile MFGEN/fix_mf.patch

echo -e "\e[0;32mDone.\e[0m"



