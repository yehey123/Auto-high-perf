; Automatic Power Plan Switcher with Input File
; v1.0 2019-06-21 Original source here: https://www.autohotkey.com/boards/viewtopic.php?t=63414
; v1.1 Revised by Greg Octa on 2024-03-08
 


;	Look at the program name in the task manager for the program you want to add.
;	then add it to the high_performance_apps.in.
;	Feel free to uncomment the msgboxes in order to debug the code.


#NoEnv
#Warn
#SingleInstance, force
#Persistent

; a1841308-3541-4fab-bc81-f71556f20b4a  Power Saver
; 381b4222-f694-41f0-9685-ff5bb260df2e  Balanced
; 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  High Performance

; Track High Performance plan status 

WindowExists(items){
	_enum := (items)._NewEnum()
	if IsObject(_enum){
		;MsgBox, "yehey"
		
		while _enum.Next(Key, Value)
		{
			;MsgBox, Value
			;MsgBox, % Value
			;MsgBox, % VerCompare(Value, "REAPER")
			hwnd := WinExist(Value)
			;MsgBox, % hwnd
			if hwnd {
				return hwnd
			}
		}
	}
	else
		;MsgBox, % "Enum is not an object."
	;MsgBox, "No high perf apps running."
	return 0
}
SetTitleMatchMode, 2
file := "high_performance_apps.in"
IsHighPerf := False
previous_content := ""
app_list := []







SetTimer, AutoPPS, 20
return



AutoPPS:
if FileExist(file){
	FileRead, LoadedText, *t %file% 
	if (LoadedText != previous_content){
		app_list := StrSplit(LoadedText, "`n")
	}
}
else {
	;MsgBox, % "file does not exist."
	app_list := []
}

id := WindowExists(app_list)
if id {
    ; Change to High Performance power plan if not already set
    if ( IsHighPerf = False ) {
        Run, powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c, , Hide
        IsHighPerf := True
    }
}
else {
    ; Change to Power Saver plan if not already set
    if ( IsHighPerf = True ) {
        Run, powercfg /s a1841308-3541-4fab-bc81-f71556f20b4a, , Hide
        IsHighPerf := False
    }
}
return