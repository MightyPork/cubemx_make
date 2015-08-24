STM32 CubeMX / GCC project base
===============================

This is a template for developing STM32 code using the GCC ARM toolchain.

Sources, libraries etc. are generated and updated using the Cube MX too, which is a cross-platform Java application (despite being named `.exe`). You can run it using `java -jar`.

The `.ioc` file is a CubeMX save file, currently configured for STM32DiscoveryF3.

Set up your project in CubeMX, save it and copy the `.ioc` file here (or save *into this folder*, if that works).

Then run `update_mf.sh`. Please remember than the `.gitignore` ignores all source folders, so change it accordingly.

Project updating
----------------

- The drivers and init code can be updated using CubeMX. Care must be taken not to overwrite user code.
- When exporting, set the IDE to "TrueStudio".
- The `MFGEN` folder contains utils for building a Makefile.

Since the TrueStudio project contains an empty LinkerScript (CubeMX bug?),
a correct one from a WS4 project is used instead - it's stored in `MFGEN`.

The linker script (Memory regions in particular) will be different for different chip: **If you changed the processor**, then you must export for WS4 IDE and copy the linker script from there into `MFGEN/good_linkscript.ld`. Blame STM.

*If CubeMX generates correct linker script, then you should comment out the LD replacement from `update_mf.sh`.

**To build a Makefile, run `update_mf.sh`.**

Makefile patching
-----------------

Some changes to the Makefile can be done by editing the template in `MFGEN`.

However, some errors have to be fixed using a patch:

    diff -Nau Makefile Makefile_fixed > ./MFGEN/fix_mf.patch

The patch is applied by `update_mf.sh`.
