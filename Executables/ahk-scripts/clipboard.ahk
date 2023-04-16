#SingleInstance force

!g::OpenHighlighted()
return

OpenHighlighted()
{
	MyClipboard := "" ; Clears variable

	Send, {ctrl down}c{ctrl up} ; More secure way to Copy things
	ClipWait ; Delay
	MyClipboard := RegexReplace( clipboard, "^\s+|\s+$" ) ; Trim additional spaces and line return
	ClipWait
	MyStripped := StrReplace(MyClipboard, " ", "") ; Removes every spaces in the string.

	StringLeft, OutputVarUrl, MyStripped, 8 ; Takes the 8 firsts characters
	StringLeft, OutputVarLocal, MyStripped, 3 ; Takes the 3 first characters
	ClipWait

	if (OutputVarUrl == "http://" || OutputVarUrl == "https://")
		Desc := "URL", Target := MyStripped
	else if (OutputVarLocal == "C:/" || OutputVarLocal == "C:\" || OutputVarLocal == "Z:/" || OutputVarLocal == "Z:\" || OutputVarLocal == "R:/" || OutputVarLocal == "R:\" ||)
		Desc := "Windows", Target := MyClipboard
	else
		Desc := "GoogleSearch", Target := "http://www.google.com/search?q=" MyClipboard

	ClipWait
	Run, %Target%
	Return
}