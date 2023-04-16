echo "move ahk scripts"
if exist "ahk-scripts\clipboard.ahk" (
	echo move /y "ahk-scripts\clipboard.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\clipboard.ahk"
	move /y "ahk-scripts\clipboard.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\clipboard.ahk"
)
if exist "ahk-scripts\three_finger_drag.ahk" (
	echo move /y "ahk-scripts\three_finger_drag.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\three_finger_drag.ahk"
	move /y "ahk-scripts\three_finger_drag.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\three_finger_drag.ahk"
)
if exist "ahk-scripts\lang_switch.ahk" (
	echo move /y "ahk-scripts\lang_switch.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\lang_switch.ahk"
	move /y "ahk-scripts\lang_switch.ahk" "%HOMEDRIVE%%HOMEPATH%\Start Menu\Programs\Startup\lang_switch.ahk"
)
echo "Done"