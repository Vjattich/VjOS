@echo off

set "Signature=/namespace:WinAPI /name:GetStr /language:CSharp /usings:System.Text /memberdefinition:"^
[DllImport(\"kernel32.dll\", CharSet = CharSet.Auto)]^
public static extern IntPtr GetModuleHandle(string lpModuleName);^
[DllImport(\"user32.dll\", CharSet = CharSet.Auto)]^
internal static extern int LoadString(IntPtr hInstance, uint uID, StringBuilder lpBuffer, int nBufferMax);^
public static string GetString(uint strId)^
{^
    IntPtr intPtr = GetModuleHandle(\"shell32.dll\");^
    StringBuilder sb = new StringBuilder(255);^
    LoadString(intPtr, strId, sb, sb.Capacity);^
    return sb.ToString();^
}"^

if not exist "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" (
    exit /b 1
)

echo "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
echo "%~[WinAPI.GetStr]::GetString(5387)%"

powershell -Command "& {Add-Type %Signature% ; [string]$command = '%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar'; [Environment]::CurrentDirectory = $command; $Shell = (New-Object -ComObject Shell.Application).NameSpace($command); $Shortcut = $Shell.ParseName('Microsoft Edge.lnk'); $Shortcut.Verbs() | Where-Object { $_.Name -eq (%~[WinAPI.GetStr]::GetString(5387)) } | ForEach-Object { $_.DoIt() }; $Shortcut.Verbs() | Where-Object { $_.Name -eq 'Unpin from taskbar' } | ForEach-Object { $_.DoIt() } }"
