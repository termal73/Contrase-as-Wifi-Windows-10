@echo off
cls
:start
set folder=wifi
set xml=*.xml
netsh wlan export profile key=clear>NUl
if exist %folder% (
    move %xml% ./%folder%>NUl
) else (
    mkdir %folder%>NUl
    move %xml% ./%folder%>NUl
)
cd %folder%
for %%f in (%xml%) do (
   echo %%f
)

:wi-fi
echo.
set /p wifi=Copy and paste the name of the wifi with the .xml extension that you want to see the password: 
if not exist %wifi% (
    echo The wifi point that you put it, doesn't exist.
    goto wi-fi
) else (
    cls
    findstr "<keyMaterial>" %wifi% > temp
    echo.
    echo.
    echo.
    echo The wifi password of %wifi% is:  
    echo.
    echo ------------------------------------------------------------------------------------------------------------------------
    type temp
    echo ------------------------------------------------------------------------------------------------------------------------
)
cd ..
echo.
echo.
:option
set /p deseo=Do you want to see another different wifi password? yes/no: 
if %deseo%==yes (
    cls
    goto start
)
if %deseo%==no (
    echo.
    echo.
    echo Thank you for use this program.
    rmdir /S /Q %folder%
    timeout /T 3 /NOBREAK>NUl
    exit
) else (
    echo You don't put the option correctly, put it again all the characters in lowercase.
    goto option
)