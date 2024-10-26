#Requires AutoHotkey v2.0+
#Include "%A_ScriptDir%"
#INCLUDE "my_lib\GuiCtlExt.ahk" ;https://github.com/TheArkive/GuiCtlExt_ahk2
#Include "my_lib\010__clinic_chooser.ahk"
#Include "my_lib\011__GUI_attending.ahk"
#Include "my_lib\012__encounter.ahk"
#Include "my_lib\020__newnote.ahk"
#Include "my_lib\040__consent.ahk"
#Include "my_lib\050__rightclickmenu.ahk"

#Include "templates\00__phrases.ahk"
#Include "templates\30__cprs_templates.ahk"
#Include "templates\41___preop.ahk"
#Include "templates\42___postop.ahk"

#Include "my_lib\BETA\090_sign.ahk"
#Include "my_lib\BETA\060_keep_cprs_open.ahk"
;

/*
UPDATES

see docs/updats

*/


;stackoverflow question 45642727 ahk class window matching
#1::WinGetClass("A") 

#2::
{
	MsgBox "The active window's class is " WinGetClass("A")
	A_Clipboard := WinGetClass("A")
	return
}



Capslock & 2::
{
	MsgBox "The active window's class is " WinGetClass("A")
	A_Clipboard := WinGetClass("A")
	return
}


;TraySetIcon(A_WorkingDir . "\green_eye_magnif.ico")
TraySetIcon(A_WorkingDir . "\my_lib\icon_red_eye.ico")

/*


While True{
	WinWaitActive abc-def-123 ahk_class 32770
	Send y
}

While True{
	WinWaitActive ahk_class 
	Send y
}

*/




;an X makes it execute instead (to save space)
::.ts0:: 
	{
	    Send FormatTime(, "M/d/yy h:mm")  ; 'It will look like 10/4/23'
	}

:X:.ts::Send FormatTime(, "M/d/yy h:mm")  ; 'It will look like 10/4/23'

:X:.td::Send FormatTime(, "M/d/yy")  ; 'It will look like 10/4/23'
:X:.td2::Send FormatTime(, "yyyy/MM/dd")  ; 'It will look like 2023/10/04' 
:X:.today::Send FormatTime(, "MMM d,yyyy")  ; 'It will look like Oct 4,2023'

; https://stackoverflow.com/questions/54845832/add-to-date-or-time-in-autohotkey

dateTomorrow := DateAdd(A_Now, 1, "days")
:X:.to::Send FormatTime(dateTomorrow, "M/d/yy")  ; 'It will look like 10/4/23'
:X:.to2::Send FormatTime(dateTomorrow, "yyyy/MM/dd")  ; 'It will look like 2023/10/04' 
:X:.tomorrow::Send FormatTime(dateTomorrow, "MMM d,yyyy")  ; 'It will look like Oct 4,2023'

dateYesterday:= DateAdd(A_Now, -1, "days")
:X:.ye::Send FormatTime(dateYesterday, "M/d/yy")  ; 'It will look like 10/4/23'
:X:.ye2::Send FormatTime(dateYesterday, "yyyy/MM/dd")  ; 'It will look like 2023/10/04' 
:X:.tomorrow::Send FormatTime(dateYesterday, "MMM d,yyyy")  ; 'It will look like Oct 4,2023'


:X:.mysig:: Send Format(choice_resident ", " choice_attending)
:X:.sig:: Send Format(choice_attending ", " choice_resident)



;no space. J rivera, murphy, greenberg, brian 
; requires second choice: 

::.=::=============================================================================
::.bar::*********************************************************************
::.line::--------------------------------------------------------------------------------

::.cat::Crystal Zhang MD, David Rivera MD, Ezra Galler MD, Jorge Rivera MD, Noelle Pruzan MD
:*:.jriv::Rivera,Jorge
:*:.driv::Rivera,David
::.gal::Galler,Ezra
::.lop::Loporchio,Salvatore
::.riz::Rizzuto,Philip
::.bry::Bryan,Richard
::.jan::Janigian,Robert
::.mur::Murphy,Marjorie
::.zha::Zhang,Crystal
::.pru::Pruzan,Noelle
:*:.gre::Greenberg,Paul
::.pau::Paul,Alfred
::.sav::Savoie,Brian
::.nan::Nandakumar,Namrata 


::.esq::Esq-Sp-Ophth

#HotIf FindVarString_Loose(WinGetTitle("A"), "Return To Clinic")
	:*C:esq::
	{
		clinic_chooser()
	}

	:*C:Esq::Esq Sp O
	:*:or::Pro-Amb Surg Or Non-Count
	::pro::Pro-Amb Surg Or Non-Count
	:*:corn::Esq Sp Opht Cornea
	:*:biom::Esq Sp Opht Biometry
	:*:gla::Esq Sp Opht Glaucoma
	:*:sgla::Esq Sp Ophth Surgical Glaucoma
	:*:post::Esq Sp Ophthalm Postop 3
	:*:pre::Esq Sp Ophthalmo Preop 3
	:*:proc2::Esq Sp Ophthalmo Procedure 2
	:*:2p::Esq Sp Ophthalmo Procedure 2
	:*:op1::Esq Sp Ophthalmology 1n
	:*:1n::Esq Sp Ophthalmology 1n
	:*:op2::Esq Sp Ophthalmology 2r
	:*:2r::Esq Sp Ophthalmology 2r
	:*:op3::Esq Sp Ophthalmology 3
	:*:las::Esq Sp Ophthalmology Laser
	:*:pla::Esq Sp Ophthalmology Plast I
	:*:ppro::Esq Sp Oph Plastics Procedures
	:*:uv::Esq Sp Ophthalmology Uveitis
	:*:ref:: Esq Sp Optometry Refraction
	:*:optom:: Esq Sp Optometry General 1
	:*:optom:: Esq Sp Optometry General 1


#HotIf FindVarString_Loose(WinGetTitle("A"), "Patient Selection")
/*
if in the 'patient selection window'
*/

	^s::
		{
		WinMove ,, 800, 600, "A"
		MouseClick "left", 774, 269
		;WinActivate "Save Patient List Settings"
		Sleep 500
		MouseClick "left", 62, 120
		Send "{tab}"
		}

	:*C:esq::
		{
		WinMove ,, 800, 600, "A"
		clinic_chooser()
		}
	^o::
	{
		WinMove ,, 800, 600, "A"
		MouseClick "left", 35, 124
		clinic_chooser()
	}

	:*C:Esq::Esq Sp O
	:*:or::Pro-Amb Surg Or Non-Count
	::pro::Pro-Amb Surg Or Non-Count
	:*:corn::Esq Sp Opht Cornea
	:*:biom::Esq Sp Opht Biometry
	:*:gla::Esq Sp Opht Glaucoma
	:*:sgla::Esq Sp Ophth Surgical Glaucoma
	:*:post::Esq Sp Ophthalm Postop 3
	:*:pre::Esq Sp Ophthalmo Preop 3
	:*:proc2::Esq Sp Ophthalmo Procedure 2
	:*:2p::Esq Sp Ophthalmo Procedure 2
	:*:op1::Esq Sp Ophthalmology 1n
	:*:1n::Esq Sp Ophthalmology 1n
	:*:op2::Esq Sp Ophthalmology 2r
	:*:2r::Esq Sp Ophthalmology 2r
	:*:op3::Esq Sp Ophthalmology 3
	:*:las::Esq Sp Ophthalmology Laser
	:*:pla::Esq Sp Ophthalmology Plast I
	:*:ppro::Esq Sp Oph Plastics Procedures
	:*:uv::Esq Sp Ophthalmology Uveitis



#HotIf


Capslock & 1::F1

#Hotif FindVarString_Loose(WinGetTitle("A"), "Sublime")
	Capslock & F::F3
#Hotif FindVarString_Loose(WinGetTitle("A"), "Epic")
	Capslock & F::F2
	F3::F2
#HotIf FindVarString_Loose(WinGetTitle("A"), "H&P OPHTHALMOLOGY")
	:*:nad::{
	SendText "
(
NAD
`t NCAT
`t CTAB
`t normal rate, RR
`t soft, bowel sounds present
`t moving spontaneously
)"
}	

#Hotif WinActive("Login")
;WinGetTitle("A") "Login"
:*:doctor::
:*:user::{
	Send "user"
	Sleep 250
	Send "{Tab}"
    Sleep 250
	Send "zeiss2019"
    Sleep 50
	Send "{Tab}"
	Send "{Enter}"

}

#Hotif

 
/*
--------------------------------------------------------------------------------
other utilities
--------------------------------------------------------------------------------
*/


:*:/*::
	{SendText "
		(
	/*

	*/

		)"
	Send "{Up 2}"
	}
	;"

:*:.title::
	{SendText "
		(
	/*
	--------------------------------------------------------------------------------

	--------------------------------------------------------------------------------
	*/

		)"
	Send "{Up 3}"
	}

:*:.titleo::
	{SendText "
		(
	/*
	********************************************************************************
	
	********************************************************************************
	*/

		)"
	Send "{Up 3}"
	}


:*:.orange::
	{SendText "
		(
	;*******************************************************************************
	;
	;*******************************************************************************

		)"
	Send "{Up 2}"
	}

:*:.mouse::{ ;takes coordinates from mouse capslock c & pastes after 'Mouseclick "left"'
	SendText "
	(
	MouseClick "left", 
	)"
	Send A_Space A_Clipboard
	} 


/*

I am working on this script to convert using the tab key to using the alt key instead.
Hopefully this will cause less strain on my pinky finger, especially when doing extensive excel in put.


Modifier key guide:
#		Windows logo key
!		Alt
^		Ctrl
+		Shift
&		(use between any two keys to combine into a custom hotkey)
<		left key of pair (ex <! left alt
						 	 >! right alt, aka AltGr)
Capslock 


*/


; ARROWS
; --------------------------------------------------------------------
/*
Replacing arrows with ijkl

# For some reason, using just alt and the previous GetKeyState didn't work for pressing through Shift, So had to force it through
*/

!+i::Send "+{Up}"
!+k::Send "+{Down}"
!+j::Send "+{Left}"
!+l::Send "+{Right}"
!+u::Send "+{Home}"
!+o::Send "+{End}"
!+h::Send "+^{Left}"
!+y::Send "+^{Left}"
!+SC027::Send "+^{Right}"

!i::Send "{Up}"
!k::Send "{Down}"
!j::Send "{Left}"
!l::Send "{Right}"
!u::Send "{Home}"
!o::Send "{End}"
!h::Send "^{Left}"
!y::Send "^{Left}"
!SC027::Send "^{Right}" ; SC027 is the same as a ; 
!BS::Send "{Del}"

!F::Send "{Click 2}"


/* assigning wheel up/down/left right 
	theoretically SHIFT + wheel up is the same as wheel right
*/

!n::Send "{WheelUp}"
!m::Send "{WheelDown}"
!+n::Send "{WheelLeft}"
!+m::Send "{WheelRight}"



!8::Send "{WheelUp}"
!9::Send "{WheelDown}"
!7::Send "{WheelLeft}"
!0::Send "{WheelRight}"
!+8::Send "+{WheelUp}"
!+9::Send "+{WheelDown}"

;CapsLock & Enter::Send "!{Enter}"
^Enter::Send "!{Enter}"
+Enter::Send "!{Enter}"
;!Enter::Send "!{Enter}"

; Showstart 
; --------------------------------------------------------------------

;https://www.autohotkey.com/docs/v2/lib/Win.htm

ShowStart(title, exe)
{
if WinExist(title)
	if WinActive(title)
		WinMinimize ; minimize if already showing
	else
    	WinActivate ; Use the window found by WinExist.
else
	Run exe
return
}

;Capslock & g::ShowStart("Week Calculator", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://dqydj.com/week-calculator/")
;^g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")
Capslock & b::ShowStart("VitalSource Bookshelf: The Wills Eye Manual", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://bookshelf.vitalsource.com/#/")
Capslock & k::ShowStart("Title page", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=file:///C:/Users/VHAPROLiengM/OneDrive%20-%20Department%20of%20Veterans%20Affairs/Kanski%E2%80%99s%20Clinical%20Ophthalmology.%20A%20Systematic%20Approach%20by%20John%20F.%20Salmon%20(z-lib.org).pdf")
Capslock & s::OpenExcelCalendar()
Capslock & g::ShowStart("Ophthalmology - Surgery", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe  --app=https://dvagov.sharepoint.com/sites/VHAPROSur/eye/Lists/AnetaSurgery/calendar.aspx?login_hint=Monica.Lieng%40va.gov")

Capslock & v::ShowStart("VistA CPRS", "\\V01.med.va.gov\Apps\VA_Shortcuts\PRO\CPRSChart PRO")
; s=vista.providence.med.va.gov p=19218 SHOWRPCS SHOWCERTS
;C:\Program Files\CZM\FORUM Viewer\FORUM Viewer.exe
;C:\ProgramData\Microsoft\Windows\Start Menu\Programs\FORUM from ZEISS\FORUM Viewer.exe

;C:\Program Files (x86)\Microsoft Office\root\Office16\onenote.exe


Capslock & d::
#d::ShowStart("Dragon Medical One", "C:\Program Files (x86)\Nuance\Dragon Medical One\SoD.exe")

capslock & n::
#n::ShowStart("OneNote", "C:\Program Files (x86)\Microsoft Office\root\Office16\onenote.exe")


OpenExcelCalendar(){
ShowStart("Surgical calendar", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe  --app=https://dvagov.sharepoint.com/:x:/r/sites/VHAPROSur/eye/_layouts/15/Doc.aspx?sourcedoc=%7B441E4889-1731-449A-ACCF-CB5492E0C46E%7D&file=Surgical%20calendar.xlsx&action=default&mobileredirect=true")
}


; keep window on top
; ********************************************************************* 

; with notifications
#Space::
^+SPACE::
{
WinSetAlwaysOnTop -1, "A"
}



;********************************************************************* 
; general commands
;********************************************************************* 

#HotIf GetKeyState("Shift")
; get window coordinates
^+C::
Capslock & c::
{
	;https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
	A_Clipboard := "" ; empties clipboard
	MouseGetPos &xpos, &ypos 
	MsgBox "The cursor is at X" xpos " Y" ypos
	;A_Clipboard := xpos ", " ypos
	A_Clipboard :=Format("Send `"{Click {1} {2}}`"", xpos, ypos)
	;A_Clipboard := "Send `"{ Click" xpos " " ypos "}"""
	;A_Clipboard := Format("Send ""{Click {1} {2}}""", xpos, ypos)
	;MsgBox "The cursor is at " A_Clipboard
	return
}

; GET ACTIVE WINDOW NAME
Capslock & w::
{
	MsgBox "The active window is '" WinGetTitle("A") "'."
	A_Clipboard := WinGetTitle("A")
	return
}

Capslock & e::
{
	;https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
	A_Clipboard := "" ; empties clipboard
	WinGetPos &X, &Y, &W, &H, "A"
	MsgBox "The active window is at " X "," Y "`n and its size is " W "x" H
	;A_Clipboard :=  W ", " H 
	A_Clipboard := "Winmove ,, " W ", " H ", `"A`""
	return
}
#HotIf

Capslock & w::
{
	MsgBox "The active window is '" WinGetTitle("A") "'."
	A_Clipboard := WinGetTitle("A")
	return
}



/*
Capslock & c::
{
CoordMode, "Mouse", "Window"
MouseGetPos &xpos, &ypos 
MsgBox "The cursor is at X" xpos " Y" ypos
}
*/





/*
--------------------------------------------------------------------------------
 LABS
CAPSLOCK DOESN'T WORK AS WELL
--------------------------------------------------------------------------------
*/

:*:lh::
{
	if A_ThisHotkey=":*:lh" && GetKeyState("LShift")
		MsgBox "Hgba1c"
	else
		Send "lh"
	return
}


#HotIf FindVarString_Loose(WinGetTitle("A"), "VistA CPRS")
^+h::
Capslock & h:: ShowLabHgbA1c()
;^+c::
^+e::
Capslock & e:: updateNotetime()

#HotIf

ShowLabHgbA1c()
	{
		Send "^l"
		Sleep 5 ;wait to be processed
		MouseClick "left", 71, 164
		Send "Hgb a1c"
		Send "{Enter}"
		Send "{tab 6}"
		Send "{Enter}"

		MouseClick "left", 738, 137
		return
	}


/*

- Hba1c specifically!
	- labs > worksheet > enter hgb a1c, enter. tab 6
- blood pressure Reports > CLinical Reports>  Vital Signs
- image reports> Radiology Imaging Local Only
- labs > labs > Cumulative
- labs > graphing

/*
--------------------------------------------------------------------------------
UPDATE note time
updateNotetime(){
	WinMove ,, 1074, 1040, "A"
	Send "{Click 1019, 133}" 
	WinWait "Progress Note Properties"
	Send "{Click 278, 332}"	; click date/time
	Send "{n}" 				; types 'n' for now
	Send "{Click 641, 19}"		; click 
}
--------------------------------------------------------------------------------
*/


updateNotetime(){ ; eliminates need for choosing where to click
	;Send "{^+c}"
	Send "{Ctrl down}{Shift down}{c}{CTRL up}{Shift up}"
	WinWait "Progress Note Properties"
	Sleep 10
	Send "{tab 3}"	; click date/time
	Send "{n}" 				; types 'n' for now
	Sleep 10
	Send "{tab 5}{Enter}"		; clicks ok
	return
}






/*
********************************************************************* 
 used for testing!!!
********************************************************************* 



Capslock & Q::
	{
		;if WinExist("Encounter Form for ESQ-SP-OPHT-BIOMETRY")
		;	{
		;	WinActivate
		;	MsgBox "Found the window!"
		;	}
		if WinExist("VistA CPRS")
			;MsgBox "True"
			WinActivate
		else 
			MsgBox "False"
	}


