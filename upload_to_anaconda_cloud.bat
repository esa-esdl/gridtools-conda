@echo off

REM Build conda build command

SET BUILD=conda build --old-build-string -c conda-forge -c anaconda recipes\gridtools --output

REM Run bild and loop through results

FOR /F  "tokens=*" %%b in ('%BUILD%') DO (
    echo anaconda -v -t %1 upload %%b --force
)


