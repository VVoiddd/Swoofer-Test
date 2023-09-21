
@echo off
REM Check if MSBuild is in PATH
where MSBuild >nul 2>&1
if %errorlevel% neq 0 (
    echo MSBuild not found in PATH. Trying default path for Visual Studio 2022 Community Edition.
    set MSBUILD_PATH="C:\Program Files (x86)\Microsoft Visual Studio2\Community\MSBuild\Current\Bin\MSBuild.exe"
) else (
    set MSBUILD_PATH=MSBuild
)

%MSBUILD_PATH% "Hwid Spoofer\Loader Base.vcxproj" /t:Build /p:Configuration=Release

if %errorlevel% neq 0 (
    echo Build failed!
    exit /b %errorlevel%
) else (
    echo Build succeeded!
)

pause
