echo "move ahk scripts"
if exist "ahk-scripts\clipboard.ahk" (
	echo move /y "ahk-scripts\clipboard.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\clipboard.ahk"
	move /y "ahk-scripts\clipboard.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\clipboard.ahk"
)
if exist "ahk-scripts\three_finger_drag.ahk" (
	echo move /y "ahk-scripts\clipboard.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\three_finger_drag.ahk"
	move /y "ahk-scripts\clipboard.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\three_finger_drag.ahk"
)
echo "Done"