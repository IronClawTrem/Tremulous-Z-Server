rm -rf build
cd src/tools/asm
make -j
cd ..
cd lcc
make -j
make -j
cd .. && cd .. && cd ..
mkdir build
mkdir build/release-linux-x86_64
mkdir build/release-linux-x86_64/tools
mv src/tools/asm/q3asm build/release-linux-x86_64/tools
mv src/tools/lcc/build--/q3cpp build/release-linux-x86_64/tools
mv src/tools/lcc/build--/q3lcc build/release-linux-x86_64/tools
mv src/tools/lcc/build--/q3rcc build/release-linux-x86_64/tools
rm -rf src/tools/lcc/build--
make -j BUILD_GAME_SO=1
zip -r gfx.pk3 gfx
mv gfx.pk3 build/release-linux-x86_64/base
zip -r zicons.pk3 icons
mv zicons.pk3 build/release-linux-x86_64/base
zip -r zmodels.pk3 models
mv zmodels.pk3 build/release-linux-x86_64/base
zip -r zoverrides.pk3 overrides
mv zoverrides.pk3 build/release-linux-x86_64/base
zip -r zscripts.pk3 scripts
mv zscripts.pk3 build/release-linux-x86_64/base
zip -r zsound.pk3 sound
mv zsound.pk3 build/release-linux-x86_64/base
zip -r zui.pk3 ui
mv zui.pk3 build/release-linux-x86_64/base
cd build/release-linux-x86_64/base
rm vm/game.qvm
zip -r zvms.pk3 vm
rm -rf cgame && rm -rf game && rm -rf qcommon && rm -rf ui && rm -rf vm && rm -rf uix86_64.so
cd ..
mv base zombie
rm -rf client && rm -rf clientsmp && rm -rf ded && rm -rf tools
