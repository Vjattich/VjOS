setlocal

if exist "%PROGRAMFILES%\Vivaldi\Application\vivaldi.exe" (
	if not "%~2"=="AME_UserHive_Default" (
		del "%~1\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Vivaldi.lnk" /q /f
		del "%~1\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Vivaldi (2).lnk" /q /f
		PowerShell -NoP -C "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%~1\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Vivaldi.lnk'); $S.TargetPath = '%HOMEDRIVE%\Program Files\Vivaldi\Application\vivaldi.exe'; $S.WorkingDirectory = 'C:\Program Files\Vivaldi'; $S.Save()"

		reg add "HKU\%~2\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "FavoritesResolve" /t REG_BINARY /d "3E0300004C0000000114020000000000C00000000000004683008000200000007602C7564A6CD901E489D0564A6CD9015CF4E1FBD161D801970100000000000001000000000000000000000000000000A4013A001F80C827341F105C1042AA032EE45287D668260001002600EFBE1200000061F6EE114A6CD9019C18BB564A6CD901C1B7CB564A6CD901140056003100000000008B565B3E11005461736B42617200400009000400EFBE8B565B3E8B565B3E2E0000005C8401000000010000000000000000000000000000003F8BF8005400610073006B00420061007200000016001201320097010000A754662A200046494C4545587E312E4C4E4B00007C0009000400EFBE8B565B3E8B565B3E2E0000005D840100000001000000000000000000520000000000A413A200460069006C00650020004500780070006C006F007200650072002E006C006E006B00000040007300680065006C006C00330032002E0064006C006C002C002D003200320030003600370000001C00260000001E00EFBE0200530079007300740065006D00500069006E006E006500640000001C00120000002B00EFBEE489D0564A6CD9011C00420000001D00EFBE02004D006900630072006F0073006F00660074002E00570069006E0064006F00770073002E004500780070006C006F0072006500720000001C000000A30000001C000000010000001C0000003400000000000000A200000018000000030000007CE9D8121000000057696E646F777300433A5C55736572735C61646D696E5C417070446174615C526F616D696E675C4D6963726F736F66745C496E7465726E6574204578706C6F7265725C517569636B204C61756E63685C557365722050696E6E65645C5461736B4261725C46696C65204578706C6F7265722E6C6E6B000060000000030000A0580000000000000077696E313100000000000000000000005ABF9BC8E67E4144A3684B930A4E935D51D949233DD8ED11BC7308002729B46F5ABF9BC8E67E4144A3684B930A4E935D51D949233DD8ED11BC7308002729B46F45000000090000A03900000031535053B1166D44AD8D7048A748402EA43D788C1D0000006800000000480000000430DCF9548308409E4212A2146C8348000000000000000000000000E60200004C0000000114020000000000C0000000000000468300800020000000996C5AC5E974D901173D5FC5E974D901D6374937E774D9015908000000000000010000000000000000000000000000004E013A001F80C827341F105C1042AA032EE45287D668260001002600EFBE1200000061F6EE114A6CD9019C18BB564A6CD9014DD55CC5E974D901140056003100000000009656893911005461736B42617200400009000400EFBE8B565B3E965689392E0000005C840100000001000000000000000000000000000000678883005400610073006B0042006100720000001600BC003200590800009656C0362000564956414C447E312E4C4E4B0000500009000400EFBE96568939965689392E000000F58B01000000060000000000000000000000000000002A3C1F0056006900760061006C006400690020002800320029002E006C006E006B0000001C00220000001E00EFBE02005500730065007200500069006E006E006500640000001C00120000002B00EFBE173D5FC5E974D9011C001C0000001D00EFBE020056006900760061006C006400690000001C000000A10000001C000000010000001C0000003400000000000000A000000018000000030000007CE9D8121000000057696E646F777300433A5C55736572735C61646D696E5C417070446174615C526F616D696E675C4D6963726F736F66745C496E7465726E6574204578706C6F7265725C517569636B204C61756E63685C557365722050696E6E65645C5461736B4261725C566976616C6469202832292E6C6E6B000060000000030000A0580000000000000077696E313100000000000000000000005ABF9BC8E67E4144A3684B930A4E935D503DDE5AE5E0ED11BC7A08002729B46F5ABF9BC8E67E4144A3684B930A4E935D503DDE5AE5E0ED11BC7A08002729B46F45000000090000A03900000031535053B1166D44AD8D7048A748402EA43D788C1D0000006800000000480000000430DCF9548308409E4212A2146C8348000000000000000000000000" /f

        reg add "HKU\%~2\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "00A40100003A001F80C827341F105C1042AA032EE45287D668260001002600EFBE1200000061F6EE114A6CD9019C18BB564A6CD901C1B7CB564A6CD901140056003100000000008B565B3E11005461736B42617200400009000400EFBE8B565B3E8B565B3E2E0000005C8401000000010000000000000000000000000000003F8BF8005400610073006B00420061007200000016001201320097010000A754662A200046494C4545587E312E4C4E4B00007C0009000400EFBE8B565B3E8B565B3E2E0000005D840100000001000000000000000000520000000000A413A200460069006C00650020004500780070006C006F007200650072002E006C006E006B00000040007300680065006C006C00330032002E0064006C006C002C002D003200320030003600370000001C00120000002B00EFBEE489D0564A6CD9011C00420000001D00EFBE02004D006900630072006F0073006F00660074002E00570069006E0064006F00770073002E004500780070006C006F0072006500720000001C00260000001E00EFBE0200530079007300740065006D00500069006E006E006500640000001C000000004E0100003A001F80C827341F105C1042AA032EE45287D668260001002600EFBE1200000061F6EE114A6CD9019C18BB564A6CD9014DD55CC5E974D901140056003100000000009656893911005461736B42617200400009000400EFBE8B565B3E965689392E0000005C840100000001000000000000000000000000000000678883005400610073006B0042006100720000001600BC003200590800009656C0362000564956414C447E312E4C4E4B0000500009000400EFBE96568939965689392E000000F58B01000000060000000000000000000000000000002A3C1F0056006900760061006C006400690020002800320029002E006C006E006B0000001C00220000001E00EFBE02005500730065007200500069006E006E006500640000001C00120000002B00EFBE173D5FC5E974D9011C001C0000001D00EFBE020056006900760061006C006400690000001C000000FF" /f
	)
)