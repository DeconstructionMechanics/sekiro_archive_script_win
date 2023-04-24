@echo off 
title sekiro saving

:op
set /p op="Enter operation or 'h' for help:"

if %op% == h goto help
if %op% == s goto sname
if %op% == l goto lname

goto op

:help
    echo h help.
    echo s save.
    echo l load.
    goto op

:sname
    set /p name="Enter name:"
    if %name% == dir (
        echo please do not make name as 'dir'
        goto sname
    )
    echo save, %name%!
    md save_data_USR\%name%
    xcopy %CD%\76561199205081181 %CD%\save_data_USR\%name% /Y
    exit


:lname
    set /p name="Enter name or enter 'dir' to check what you have:"
    if %name% == dir (
        dir %CD%\save_data_USR/b
        goto lname
    )
    if exist save_data_USR\%name% (
        echo load, %name%!
        xcopy %CD%\save_data_USR\%name% %CD%\76561199205081181 /Y
        exit
    )
    echo file not exist
    goto lname

