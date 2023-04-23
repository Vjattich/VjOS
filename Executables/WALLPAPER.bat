
NSudoLC -U:T -P:E -M:S -Priority:RealTime -UseCurrentConsole -Wait icacls "%WINDIR%\Resources\Themes\aero.theme" /reset /t
PowerShell -NoP -C "$Content = (Get-Content '%WINDIR%\Resources\Themes\aero.theme'); $Content = $Content -replace 'Wallpaper=%%SystemRoot%%.*', 'Wallpaper=%%SystemRoot%%\web\wallpaper\Windows\clouds.bmp'; $Content = $Content -replace 'SystemMode=.*', 'SystemMode=Dark'; $Content -replace 'AppMode=.*', 'AppMode=Light' | Set-Content '%WINDIR%\Resources\Themes\aero.theme'"

@echo OFF

if exist "pics\clouds.bmp" (
	echo move /y "pics\clouds.bmp" "%WINDIR%\Web\Wallpaper\Windows"
	move /y "pics\clouds.bmp" "%WINDIR%\Web\Wallpaper\Windows"
	echo icacls "%WINDIR%\Web\Wallpaper\Windows\clouds.bmp" /reset
	icacls "%WINDIR%\Web\Wallpaper\Windows\clouds.bmp" /reset
)

set "RunEC=10"
for /f "usebackq tokens=2 delims=\" %%A in (`reg query "HKEY_USERS" ^| findstr /r /x /c:"HKEY_USERS\\S-.*" /c:"HKEY_USERS\\AME_UserHive_[^_]*"`) do (
	if "%%A"=="AME_UserHive_Default" (
		call :WALLRUN "%%A" "%SYSTEMDRIVE%\Users\Default"
			IF errorlevel 5 set "RunEC=5"
			IF errorlevel 4 set "RunEC=4"
			IF errorlevel 3 set "RunEC=3"
			IF errorlevel 2 set "RunEC=2"
			IF errorlevel 1 set "RunEC=1"
			IF errorlevel 0 set "RunEC=0"
	) else (
		for /f "usebackq tokens=2* delims= " %%B in (`reg query "HKU\%%A\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "AppData" 2^>^&1 ^| findstr /R /X /C:".*AppData[ ]*REG_SZ[ ].*"`) do (
			call :WALLRUN "%%A" "%%C"
				IF errorlevel 5 set "RunEC=5"
				IF errorlevel 4 set "RunEC=4"
				IF errorlevel 3 set "RunEC=3"
				IF errorlevel 2 set "RunEC=2"
				IF errorlevel 1 set "RunEC=1"
				IF errorlevel 0 set "RunEC=0"
		)
	)
)

exit /b %RunEC%

:WALLRUN

if not exist "%WINDIR%\Web\Wallpaper\Windows" echo mkdir "%WINDIR%\Web\Wallpaper\Windows" & mkdir "%WINDIR%\Web\Wallpaper\Windows"
if exist "%~2\Microsoft\Windows\Themes\Transcoded_000" set "wallChanged=true" & goto lockScreen

echo PowerShell -NoP -C "Add-Type -AssemblyName System.Drawing; $img = New-Object System.Drawing.Bitmap '%~2\Microsoft\Windows\Themes\TranscodedWallpaper'; if ($img.Flags -ne 77840) {exit 1}; if ($img.HorizontalResolution -ne 96) {exit 1}; if ($img.VerticalResolution -ne 96) {exit 1}; if ($img.PropertyIdList -notcontains 40961) {exit 1}; if ($img.PropertyIdList -notcontains 20624) {exit 1}; if ($img.PropertyIdList -notcontains 20625) {exit 1}"
PowerShell -NoP -C "Add-Type -AssemblyName System.Drawing; $img = New-Object System.Drawing.Bitmap '%~2\Microsoft\Windows\Themes\TranscodedWallpaper'; if ($img.Flags -ne 77840) {exit 1}; if ($img.HorizontalResolution -ne 96) {exit 1}; if ($img.VerticalResolution -ne 96) {exit 1}; if ($img.PropertyIdList -notcontains 40961) {exit 1}; if ($img.PropertyIdList -notcontains 20624) {exit 1}; if ($img.PropertyIdList -notcontains 20625) {exit 1}"
	if %errorlevel% NEQ 0 set "wallChanged=true" & goto lockScreen

if exist "pics\img0_*" (
	echo takeown /f "%WINDIR%\Web\4K\Wallpaper\Windows\*.jpg"
	takeown /f "%WINDIR%\Web\4K\Wallpaper\Windows\*.jpg"
	echo icacls "%WINDIR%\Web\4K\Wallpaper\Windows\*.jpg" /reset
	icacls "%WINDIR%\Web\4K\Wallpaper\Windows\*.jpg" /reset
	echo move /y pics\img0_*.jpg "%WINDIR%\Web\4K\Wallpaper\Windows"
	move /y pics\img0_*.jpg "%WINDIR%\Web\4K\Wallpaper\Windows"
)

if exist "pics\img0.jpg" (
	echo takeown /f "%WINDIR%\Web\Wallpaper\Windows\img0.jpg"
	takeown /f "%WINDIR%\Web\Wallpaper\Windows\img0.jpg"
	echo icacls "%WINDIR%\Web\Wallpaper\Windows\img0.jpg" /reset
	icacls "%WINDIR%\Web\Wallpaper\Windows\img0.jpg" /reset
	echo move /y "pics\img0.jpg" "%WINDIR%\Web\Wallpaper\Windows\img0.jpg"
	move /y "pics\img0.jpg" "%WINDIR%\Web\Wallpaper\Windows\img0.jpg"
)

if not exist "%WINDIR%\Web\Wallpaper\Windows\clouds.bmp" set "wallFail=true" & goto lockScreen

echo reg add "HKEY_USERS\%~1\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "%WINDIR%\Web\Wallpaper\Windows\clouds.bmp" /f
reg add "HKEY_USERS\%~1\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "%WINDIR%\Web\Wallpaper\Windows\clouds.bmp" /f
	if %errorlevel% NEQ 0 set "wallFail=true" & goto lockScreen

del /q /f "%~2\Microsoft\Windows\Themes\TranscodedWallpaper"
rmdir /q /s "%~2\Microsoft\Windows\Themes\CachedFiles"

:lockScreen

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Creative\%~1" /v "RotatingLockScreen*" > NUL 2>&1
	if %errorlevel% NEQ 0 (
		echo "%~1" | findstr /c:"S-" > NUL
			if not errorlevel 1 (
				echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Creative\%~1" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f
				reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Creative\%~1" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f
			)
		echo reg add "HKU\%~1\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f
		reg add "HKU\%~1\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f

		if exist "pics\img100.jpg" (
			echo takeown /f "%WINDIR%\Web\Screen\img100.jpg"
			takeown /f "%WINDIR%\Web\Screen\img100.jpg"
			echo icacls "%WINDIR%\Web\Screen\img100.jpg" /reset
			icacls "%WINDIR%\Web\Screen\img100.jpg" /reset
			echo copy "pics\img100.jpg" "%WINDIR%\Web\Screen\img100.jpg" /Y
			copy "pics\img100.jpg" "%WINDIR%\Web\Screen\img100.jpg" /Y
		)

		if exist "pics\img103.png" (
			echo takeown /f "%WINDIR%\Web\Screen\img103.png"
			takeown /f "%WINDIR%\Web\Screen\img103.png"
			echo icacls "%WINDIR%\Web\Screen\img103.png" /reset
			icacls "%WINDIR%\Web\Screen\img103.png" /reset
			echo copy "pics\img103.png" "%WINDIR%\Web\Screen\img103.png" /Y
			copy "pics\img103.png" "%WINDIR%\Web\Screen\img103.png" /Y
		)

		if exist "pics\img0.jpg" (
			echo takeown /f "%WINDIR%\Web\Wallpaper\Windows\img0.jpg"
			takeown /f "%WINDIR%\Web\Wallpaper\Windows\img0.jpg"
			echo icacls "%WINDIR%\Web\Wallpaper\Windows\img0.jpg" /reset
			icacls "%WINDIR%\Web\Wallpaper\Windows\img0.jpg" /reset
			echo copy "pics\img0.jpg" "%WINDIR%\Web\Wallpaper\Windows\img0.jpg" /Y
			copy "pics\img0.jpg" "%WINDIR%\Web\Wallpaper\Windows\img0.jpg" /Y
		)

		REM Clear cache
		echo takeown /R /D Y /F "%PROGRAMDATA%\Microsoft\Windows\SystemData"
		takeown /R /D Y /F "%PROGRAMDATA%\Microsoft\Windows\SystemData"
		echo icacls "%PROGRAMDATA%\Microsoft\Windows\SystemData" /reset /t
		icacls "%PROGRAMDATA%\Microsoft\Windows\SystemData" /reset /t
		for /d %%A in ("%PROGRAMDATA%\Microsoft\Windows\SystemData\*") do (
			for /d %%B in ("%%A\ReadOnly\LockScreen_*") do echo rmdir /q /s "%%B" & rmdir /q /s "%%B"
		)
		if "%wallChanged%"=="true" exit /b 1
		if "%wallFail%"=="true" exit /b 4
	) else (
		if "%wallChanged%"=="true" exit /b 3
		if "%wallFail%"=="true" exit /b 5
		exit /b 2
	)

exit /b 0


:: Navigate to the folder containing the item you want to unpin
cd "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"

:: Unpin the item using the command-line version of the ShellExecute function
:: (note: this method may not work for all types of shortcuts)
:: The /unpin argument specifies that the item should be unpinned rather than pinned
:: The %CD%\[filename] argument specifies the path to the shortcut
:: The ::{20D04FE0-3AEA-1069-A2D8-08002B30309D} argument specifies the CLSID for the Desktop folder
cmd /c explorer.exe shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D} /unpin %CD%\Microsoft Edge.lnk

:: Alternatively, you could use the command-line version of the IContextMenu interface
:: (note: this method may not work for all versions of Windows or all types of shortcuts)
:: The /q argument specifies that the command should not display any user interface elements
:: The %CD%\[filename] argument specifies the path to the shortcut
:: The "unpin from taskbar" verb ID is different for different versions of Windows, so you may need to use a different number
:: (for example, the ID for "unpin from taskbar" on Windows 10 is usually 5386 instead of 5387)
cmd /c start /q rundll32.exe user32.dll, LockWorkStation && "cmd /c start /q rundll32.exe user32.dll,ExitWindowsEx 0" && cmd /c start /q rundll32.exe shell32.dll,SHInvokeCommandAsUserW 5387 "%CD%\Microsoft Edge.lnk"
