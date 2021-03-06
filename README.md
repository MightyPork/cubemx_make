# STM32 CubeMX / GCC project base

This is a template for developing STM32 code using the GCC ARM toolchain.

Sources & libraries are generated and updated using the Cube MX tool. To run it, use
`java -jar STM32CubeMX.exe` (not kidding, it's really just a renamed `.jar`).

The `.ioc` file is a CubeMX save file. It can be opened with CubeMX to change pin layout etc.


## Initialization

1. Open the `.ioc` file with CubeMX and generate the project for "TrueSTUDIO".
2. Run `update_mf.sh`.

Please remember than the `.gitignore` ignores all source folders, so change it accordingly.


## Project updating

- The drivers and init code can be updated using CubeMX (as "TrueStudio" project, details below).
- Take care not to overwrite your code: CubeMX can preserve stuff between special marker comments,
  make sure it's enabled in the project settings.
- **To build a Makefile, run `update_mf.sh`.**


## Changing processor

1. Configure CubeMX project and save it to this folder (Or somewhere else and copy the files).
2. Generate a "TrueSTUDIO" project from it.
3. Check the linker script in `TrueSTUDIO/cubemx_make Configuration/STM32F303VC_FLASH.ld`. If it's empty, see below.
4. If CubeMX generated correct LD file, then comment out the LD replacement in `update_mf.sh`.
5. Run `update_mf.sh`

### Broken linker script

Due to a CubeMX bug, your TrueStudio project may have empty linker script.

1. To fix that, export it as WS4STM project and use linker script from there.
2. Move the correct linker script into `MFGEN/good_linkscript.ld`.


## Makefile patching

Some changes to the Makefile can be done by editing the template in `MFGEN/CubeMX2Makefile.tpl`.

However, some errors have to be fixed using a patch.

Making a patch:

1. Comment out the patch application in `update_mf.sh` and run it to generate clean Makefile.
2. Copy it, fix changes and generate a patch:<br>
   `diff -Nau Makefile Makefile_fixed > ./MFGEN/fix_mf.patch`

The patch is applied by `update_mf.sh`.
