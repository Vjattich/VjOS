# Extract strings from %SystemRoot%\System32\shell32.dll using its' number
	$Signature = @{
		Namespace        = "WinAPI"
		Name             = "GetStr"
		Language         = "CSharp"
		UsingNamespace   = "System.Text"
		MemberDefinition = @"
[DllImport("kernel32.dll", CharSet = CharSet.Auto)]
public static extern IntPtr GetModuleHandle(string lpModuleName);

[DllImport("user32.dll", CharSet = CharSet.Auto)]
internal static extern int LoadString(IntPtr hInstance, uint uID, StringBuilder lpBuffer, int nBufferMax);

public static string GetString(uint strId)
{
	IntPtr intPtr = GetModuleHandle("shell32.dll");
	StringBuilder sb = new StringBuilder(255);
	LoadString(intPtr, strId, sb, sb.Capacity);
	return sb.ToString();
}
"@
	}
	if (-not ("WinAPI.GetStr" -as [type]))
	{
		Add-Type @Signature
	}
echo "$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
echo "$([WinAPI.GetStr]::GetString(5387))"
# Call the shortcut context menu item
cd "$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"

$Shell = (New-Object -ComObject Shell.Application).NameSpace("$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar")
$Shortcut = $Shell.ParseName("Microsoft Edge.lnk")
# Extract the localized "Unpin from taskbar" string from shell32.dll
$Shortcut.Verbs() | Where-Object -FilterScript {$_.Name -eq "$([WinAPI.GetStr]::GetString(5387))"} | ForEach-Object -Process {$_.DoIt()}
$Shortcut.Verbs() | Where-Object -FilterScript {$_.Name -eq "Unpin from taskbar"} | ForEach-Object -Process {$_.DoIt()}