#include "ImageSearch_Tool.au3"
#include "ImageSearch_UDF.au3"
#RequireAdmin

HotKeySet("{Esc}", "_Exit") ; Press ESC for exit
Func _Exit()
    Exit 0
EndFunc   ;==>_Exit

Global Const $Ask_On_Found = 0
Global Const $Mouse_Move_On_Found = 1
Global Const $Mouse_Click_On_Found = 1
Global Const $Timeout_Lower_Limit = 1000
Global Const $Timeout_Upper_Limit = 5000

Global $_Image_1 = @ScriptDir & "\reference.bmp"

; First, use this function to create a bmp file')
MsgBox(64 + 262144, 'ImageSearch', 'Select the area of which the program will look for and click.')
_ImageSearch_Create_BMP($_Image_1)

While 1
    ToolTip('(Press ESC for EXIT) Searching ...', 1, 1)
    Local $return = _ImageSearch($_Image_1)
    If $return[0] = 1 Then
        ConsoleWrite('- Image found:' & " X=" & $return[1] & " Y=" & $return[2] & @CRLF)
		Sleep(Random($Timeout_Lower_Limit, $Timeout_Upper_Limit, 1))
        If $Mouse_Move_On_Found Then MouseMove($return[1], $return[2])
        If $Mouse_Click_On_Found Then MouseClick("left", $return[1], $return[2])
	    MouseMove($return[1]+Random(-200, 200, 1), $return[2]+Random(-200, 200, 1))
        ToolTip('(Press ESC for EXIT) Image found:' & " X=" & $return[1] & " Y=" & $return[2], 1, 1)
        If $Ask_On_Found Then
            Local $ask = MsgBox(6 + 262144, 'Success', 'Image found:' & " X=" & $return[1] & " Y=" & $return[2])
			If $ask = 2 Or $ask = 3 Or $ask = 5 Or $ask = 7 Then Exit ;No, Abort, Cancel, and Ignore
            If $ask = 10 Then _ImageSearch_Create_BMP($_Image_1) ; Continue       ;Try Again
        EndIf
    EndIf
    Sleep(200)
WEnd