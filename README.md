# URTool
URTool Extract and Repack android images from 5-8.1 (BIN,IMG,DAT-BR) Under Windows environment

This Fork of URTool is for unpacking the OEM Folder of Chinese BMW Android 8.1.0 OTA Update files for further editing !


# Usage
```
Just put a PX6.zip Android OTA File into main file directory where the unpack_oem.bat is
start unpack_oem.bat
When successfully finished a "oem" folder is created with all the files.

# Functions
```

unpack_oem.bat function:

Unpacks oem.new.bat.br file automatically.

URtool.bat function:

Unpack vendor.img/.dat.br, system.img/.dat.br, payload.bin automatically.
Repack vendor.img/.dat.br, system.img/.dat.br,  exception for payload.bin but this tool deliver to you system.img ext4 for flashing purposes.
URTool deliver to you original system permissions and symlinks
```


# Credits
```
See credits.txt for binary authors
```

# Tests
```
*Not working on android 9 roms yet, make_ext4fs binary is not present in Pie repository*
```


