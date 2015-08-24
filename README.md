STM32 CubeMX / GCC project base
===============================

This is a template for developing STM32 code using the GCC ARM toolchain.

Sources, libraries etc. are generated and updated using the Cube MX too, which is a cross-platform Java application (despite being named `.exe`). You can run it using `java -jar`.

Open the `.ioc` file with CubeMX, set up your processor and export "for TrueStudio".

Then run `update_mf.sh`.

Project updating
----------------

- The drivers and init code can be updated using CubeMX. Care must be taken not to overwrite user code.
- When exporting, set the IDE to "TrueStudio".
- The `MFGEN` folder contains utils for building a Makefile.

Since the TrueStudio project contains an empty LinkerScript (CubeMX bug?),
a correct one from a WS4 project is used instead - it's stored in `MFGEN`.

**To build a Makefile, run `update_mf.sh`.**

Makefile patching
-----------------

Some changes to the Makefile can be done by editing the template in `MFGEN`.

However, some errors have to be fixed using a patch:

    diff -Nau Makefile Makefile_fixed > ./MFGEN/fix_mf.patch

The patch is applied by `update_mf.sh`.
