#Include "%A_ScriptDir%"
#INCLUDE "GuiCtlExt.ahk" ;https://github.com/TheArkive/GuiCtlExt_ahk2
#Include "010__clinic_chooser.ahk"
#Include "011__GUI_attending.ahk"
#Include "012__encounter.ahk"
#Include "020__newnote.ahk"
#Include "040__consent.ahk"
#Include "050__rightclickmenu.ahk"
#Include "templates\00__phrases.ahk"
#Include "templates\30__cprs_templates.ahk"
#Include "templates\41___preop.ahk"
#Include "templates\42___postop.ahk"
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
:X:.to::Send FormatTime(dateTomorrow, "yyyy/MM/dd")  ; 'It will look like 2023/10/04' 
:X:.tomorrow::Send FormatTime(dateTomorrow, "MMM d,yyyy")  ; 'It will look like Oct 4,2023'


;no space. J rivera, murphy, greenberg, brian 
; requires second choice: 

::.=::=============================================================================
::.bar::*********************************************************************
::.line::--------------------------------------------------------------------------------


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
!+SC027::Send "+^{Right}"

!i::Send "{Up}"
!k::Send "{Down}"
!j::Send "{Left}"
!l::Send "{Right}"
!u::Send "{Home}"
!o::Send "{End}"
!h::Send "^{Left}"
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
}

;Capslock & g::ShowStart("Week Calculator", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://dqydj.com/week-calculator/")
;^g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")
Capslock & b::ShowStart("VitalSource Bookshelf: The Wills Eye Manual", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://bookshelf.vitalsource.com/#/")
Capslock & k::ShowStart("Title page", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=file:///C:/Users/VHAPROLiengM/OneDrive%20-%20Department%20of%20Veterans%20Affairs/Kanski%E2%80%99s%20Clinical%20Ophthalmology.%20A%20Systematic%20Approach%20by%20John%20F.%20Salmon%20(z-lib.org).pdf")
Capslock & s::OpenExcelCalendar()
Capslock & g::ShowStart("Ophthalmology - Surgery", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe  --app=https://dvagov.sharepoint.com/sites/VHAPROSur/eye/Lists/AnetaSurgery/calendar.aspx?login_hint=Monica.Lieng%40va.gov")

Capslock & v::ShowStart("VistA CPRS", "\\V01.med.va.gov\Apps\VA_Shortcuts\PRO\CPRSChart PRO.exe")
; s=vista.providence.med.va.gov p=19218 SHOWRPCS SHOWCERTS
;C:\Program Files\CZM\FORUM Viewer\FORUM Viewer.exe
;C:\ProgramData\Microsoft\Windows\Start Menu\Programs\FORUM from ZEISS\FORUM Viewer.exe

;C:\Program Files (x86)\Microsoft Office\root\Office16\onenote.exe


Capslock & n::
#n::ShowStart("Dragon Medical One", "C:\Program Files (x86)\Microsoft Office\root\Office16\onenote.exe")

#d::ShowStart("OneNote", "C:\Program Files (x86)\Nuance\Dragon Medical One\SoD.exe")


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
	;return
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




;********************************************************************* 
; programming gui interaction with cprs 
;*********************************************************************

^+r::
Capslock & r::
	/* 
	FOR RETURN TO CLINIC

	CTRL + O, opens orders
	r, then clicks return to clinic
	 - will automatically highlight the clinic
	tab, will go to the return to clinic date

	*/
	{
	Send "^o"
	Sleep 5 ;wait to be processed
	MouseClick "left", 50, 400
	Send "r"
	;MsgBox "The active window is '" WinGetTitle("A") "'."
	;WinActivate "Return To Clinic"	
	Send "{tab}"
	  MouseClick "left", 353, 135
	  MouseClick "left", 353, 135
	}
^+a::
Capslock & a::AddNewOrder()
^+m::
Capslock & m::AddNewMedicine()

^+4::
^+t::
Capslock & 4::
Capslock & t::AddTextOrder()

#Hotif FindVarString_Loose(WinGetTitle("A"), "Order Menu")
	a::
		{
		ClickAnesthesia()
		Sleep 50
		EnterAnesthesiaOrderDetails()
		}
	c:: ClickCardsConsult()
	e:: ClickEKG()
	i::
		{
		ClickImaging()
		WinWait "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
		ImagingGUI()
		}
	o::
		{
		ClickImaging()
		WinWait "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
		ClickOct()
		EnterImageOrderDetails()
		}
	j::ClickInjection()
	n::ClickNonFormulary()

	d:: ExitOrderMenu()
	x:: ExitOrderMenu()
	Backspace:: MouseClick "left", 14, 12 ;goes to previous


#Hotif FindVarString_Loose(WinGetTitle("A"), "Order a Procedure")
	;Capslock & e:: EnterEKGOrderDetails()
#Hotif FindVarString_Loose(WinGetTitle("A"), "Order a Consult")
	Capslock & f:: 
	{
		MouseClick "left", 414, 60
		Send FormatTime(, "M/d/yy")  ; 'It will look like 10/4/23'
		MouseClick "left", 604, 403
		;MouseClick "left", 574, 401
	}
#Hotif FindVarString_Loose(WinGetTitle("A"), "Reason for Request: ANESTHESIA E-CONSULT INPT")
	::cat:: 
	{
		WinActive(WinGetTitle("A"))
		EnterAnesthesiaOrderDetails2()
	}

#Hotif



/*
IMAGING orders
opens new window 'Order Menu'
42 - internal
34 surgical
optometry/ophthalmology imaging services Outpt
opens new window : 'Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT'

55, 182 	1. visual fields by Zeiss visual field
55, 202 	2. posterior OCT by Zeiss stratus
55, 220 	3. posterior OCT by Heidleberg HRA-OCT Spectralis
55, 239 	4. fluorescein angiography by Heidleberg HRA-OCT Spectralis
55, 260 	5. fundus photography by topcon 50 ex fundus camera
55, 280 	6. IOL calculation by Zeiss IOL Master
55, 295		7. Cornea Topography by Zeiss Altas 993 Topopgrapher
55, 315		8. A/B Ultrasound by AVISO Ultrasound
55, 335		9. Anterior Segment Photography by Haag-Streit Slitlamp camera
55, 355		10. Anterior Segment OCT Visante (Zeiss)


*/


ImagingOptions := Array(
	{x:55, y:182, abbr:"1.VF", 			name:"1. Visual Fields by Zeiss Visual Field"},
	{x:55, y:202, abbr:"2.OCT (Zeiss)", name:"2. posterior OCT by Zeiss stratus"},
	{x:55, y:220, abbr:"3.OCT", 		name:"3. posterior OCT by Heidleberg HRA-OCT Spectralis"},
	{x:55, y:239, abbr:"4.FA", 			name:"4. fluorescein angiography by Heidleberg HRA-OCT Spectralis"},
	{x:55, y:260, abbr:"5.Fundus", 		name:"5. fundus photography by topcon 50 ex fundus camera"},
	{x:55, y:280, abbr:"6.IOL Calc", 	name:"6. IOL calculation by Zeiss IOL Master"},
	{x:55, y:295, abbr:"7.Topo", 		name:"7. Cornea Topography by Zeiss Altas 993 Topopgrapher"},
	{x:55, y:315, abbr:"8.U/S", 		name:"8. A/B Ultrasound by AVISO Ultrasound"},
	{x:55, y:335, abbr:"9.Ant Seg Photo", name:"9. Anterior Segment Photography by Haag-Streit Slitlamp camera"},
	{x:55, y:355, abbr:"10.Ant Seg OCT", name:"10. Anterior segment OCT Visante (Zeiss)"}	 
	)

ImagingOptionsNames := GetNames(ImagingOptions)

ExitOrderMenu()
	{ ;"TfrmOMNavA"
		if WinExist("Order Menu") ;
			WinActivate 
		MouseClick "left", 841, 10 ;exits
	}

AddTextOrder()
	{
		Send "^o"
		Sleep 10 ;wait to be processed
		MouseClick "left", 10, 400
		Send "t"
		WinWait "Word Processing Order" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600

			SendText "
			(
			For cataract surgery -  eye - on :
			 Pre-op: 
				)"
		Sleep 10 ;wait to be processed\
		MouseClick "left", 333, 40
		Sleep 100 ;wait to be processed\
		;Send "{tab 2}"
		;Send "{.4b}{space}"

	}

AddNewOrder()
	{
		Send "^o"
		Sleep 20 ;wait to be processed
		MouseClick "left", 10, 400
		Send "a"
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600	
	}
AddNewMedicine()
	{
		Send "^o"
		Sleep 10 ;wait to be processed
		MouseClick "left", 10, 400
		Send "m"	
	}

ClickImaging()
	{	
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		Send "{Click 735 30}" ;clicks 42 local consults/requests
		MouseClick "left", 510, 302 ; clicks 34 surgical consult
		MouseClick "left", 421, 339 ; clicks optometry/ophthalmology imaging services Outpt
	}
ClickEKG()
	{	
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		Send "{Click 735 30}" 	; clicks 42 local consults/requests
		Send "{Click 78 367}"	; clicks 14 medical  consult
		Send "{Click 71 79}"	; clicks CARDIOLOGY
		Send "{Click 525 144}" 	; clicks 8 EKG w/rhythm strip


		;enter EKG order details
		WinWait "Order a Procedure" 
		Send "Preop EKG for anesthesia; for cataract surgery"
		Send "{Click 251 88}"	; clicks date
		Send FormatTime(, "M/d/yy")
		Sleep 50
		Send "{Tab 4}" 	; moves to location selection
		Send "{Down 2}"	; clicks 'outpatient'
		Send "{Tab 3}" 	; MOVES TO 'accept order'
	}

ClickCardsConsult()
	{
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600

		Send "{Click 735 30}" 	; clicks 42 local consults/requests
		Send "{Click 78 367}"	; clicks 14 medical  consult
		Send "{Click 71 79}"	; clicks CARDIOLOGY

		;Send "{Click 174 316}" ;clicks cards econsult
		Send "{Click 181 433}" ;clicks cardiology preop consult

		;MouseClick "left", 165, 87 ; clicks 'CARDIOLOGY CONSULTATION'
		;MouseClick "left", 160, 290 ; clicks 'Cardiology eConsult'

		;WinWait "Reason for Request: CARDIOLOGY E-CONSULT OUTPT"
		;WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(1000/2),783,755
		
		;MouseClick "left", 11, 39 ; clicks [ ] for 'Chart Review'
		;Send "{tab}"
		;Send "Cataract surgery, pacemaker"

		;KeyWait "Tab"
		;Mouseclick "left", 676, 700 ;clicks OK

		;same as capslock & f

		;WinWait "Order a Consult"
		;WinMove ,, 650, 450
		;MouseClick "left", 414, 60
		;Send FormatTime(, "M/d/yy")  ; 'It will look like 10/4/23'
		;MouseClick "left", 604, 403



	}

ClickAnesthesia()
	{	WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600

		Send "{Click 735 30}" 	; clicks 42 local consults/requests
		Send "{Click 536 302}"	; clicks 34 surgical consult
		Send "{Click 152 112}"	 ; clicks 'Anesthesia E consult'
	}

EnterAnesthesiaOrderDetails2()
	{	Send "{Backspace 3}"
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),1069,893
		Send "{Click 170 251}" ;clicks procedure
		Send "{Tab}" ; moves to dx planned procedure
		Sleep 50
		Send "Age related cataract"
		Sleep 50
		Send "{Tab}" ; moves to type of anesthesia
		Sleep 50
		Send "MAC/Topical"
		Sleep 50
		Send "{Click 21 706}" ;clicks acknowledge
		Send "{PgDn 2}"
		Send "{Click 25 538}" ;clicks not GLp1
		Send "{Click 15 622}" ;clicks not glp1
		Send "{Click 27 730}" ;clicks not glp1
		Send "{PgUp 2}"
		Sleep 50
		Send "{Click 170 251}" ;clicks procedure
		Sleep 50
		Send "Cataract Extraction and intraocular lens placement,  eye"

	}

EnterAnesthesiaOrderDetails()
	{	WinWait "Anesthesia E-CONSULT" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),1069,893

		Send "{Click 170 251}" ;clicks procedure
		Send "{Tab}" ; moves to planned procedure
		Sleep 50
		Send "Age related cataract"
		Sleep 50
		Send "{Tab}" ; moves to type of anesthesia
		Sleep 50
		Send "MAC/Topical"
		Sleep 50
		Send "{Click 21 706}" ;clicks acknowledge
		Send "{PgDn 2}"
		Send "{Click 25 538}" ;clicks not GLp1
		Send "{Click 15 622}" ;clicks not glp1
		Send Send "{Click 27 730}" ;clicks not glp1
		Send "{PgUp 2}"
		Sleep 50
		Send "{Click 170 251}" ;clicks procedure
		Sleep 50
		Send "Cataract Extraction and intraocular lens placement,  eye"

		/*
			MouseClick "left", 102, 319 ;clicks diagnosis
			Sleep 50
			WinWait "ANESTHESIA E" 
			Send "Age related cataract"
			Send "{Tab}"
			Send "MAC"
			Sleep 50
			MouseClick "left", 239, 92 ; clicks date
			Sleep 50
			Send "Cataract Extraction and intraocular lens placement,  eye"
			Send "{Left 4}"
		*/


	}
/*
 EnterEKGOrderDetails()
	{
			Send "Preop EKG for anesthesia; for cataract surgery"
			MouseClick "left", 239, 92 ; clicks date
			Send FormatTime(, "M/d/yy")
			Sleep 50
			Send "{Tab 4}"
			Send "{Down 2}"	
	}
*/



ClickNonFormulary()
	{	
		MsgBox "clicked N"
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		MouseClick "left", 683, 37 ; clicks 42 local consults/requests
		MouseClick "left", 513, 185 ;clicks 23 pharmacy consult
		MouseClick "left", 72, 197 ;clicks NFDR EConsult Outpatient
		Send "{Tab 2}" ;PLACES CURSOR FOR MEDICATION NAME
	}


ClickOct()
	{
		WinWait "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
		WinMove 100,100, 785,490
		MouseClick "left", 55, 220 ; clicks OCT
		;Send "{Enter}" ;clicks 'Preview'
		
		Send "{Click 694 436}" ;clicks  'ok'
		;WinWaitClose "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"

	}	

EnterImageOrderDetails()
{
			
		WinWait "Order a Consult"
		WinMove 430,200, 640, 414
		Send "{Click 374 69}"
		Send FormatTime(, "M/d/yy")  	; 'It will look like 10/4/23'
		Send "{tab 6}"
		Send "{enter}" ; closes window

}


; need to add multiline text/all the options

ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("Text",, " Choose imaging modality. `n Can insert multiple separated by commas, examples:`n '1,3,5' `n 'oct'")
	MyGui.Add("ComboBox", "r11 w350 vImageChoice", ImagingOptionsNames) ;r11 means 11 tall
	MyGui.Add("Text",, " Accepted abbreviations include the [number], vf, octz, octh, fund, fundus `n OCT defaults to Heidleberg")

	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)
	MyGui.Show()
	ProcessUserInput(*)
	{
		if WinExist("Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT")
			WinActivate 
		MyText :="You entered:"
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    ;MsgBox("You entered:`n '" Saved.ImageChoice "'")
	    if Saved.ImageChoice  = 1 
			AppendClick(MyText, ImagingOptions[1])
	    if Saved.ImageChoice ~= "1,|vf|VF"
			AppendClick(MyText, ImagingOptions[1])
	    if Saved.ImageChoice ~= "2|oct zeiss|OCT zeiss|OCT z|octz"
			AppendClick(MyText, ImagingOptions[2])
	    if Saved.ImageChoice ~= "3|oct|OCT|oct h|OCT H|octh"
			AppendClick(MyText, ImagingOptions[3])
	    if Saved.ImageChoice ~= "4|fa|FA"
			AppendClick(MyText, ImagingOptions[4])
	    if Saved.ImageChoice ~= "5|fund|fundus"
			AppendClick(MyText, ImagingOptions[5])
	    if Saved.ImageChoice ~= "6|iol|IOL"
			AppendClick(MyText, ImagingOptions[6])
		if Saved.ImageChoice ~= "7|topo|cornea topography|cornea"
			AppendClick(MyText, ImagingOptions[7])
		if Saved.ImageChoice ~= "8|ultrasound|bscan|b-scan"
			AppendClick(MyText, ImagingOptions[8])
		if Saved.ImageChoice ~= "9"
			AppendClick(MyText, ImagingOptions[9])
	    if Saved.ImageChoice ~= "10"
			AppendClick(MyText, ImagingOptions[10])

		number_chosen := StrSplit(Saved.ImageChoice,",")
		number_chosen := number_chosen.Length

		if number_chosen = 1
			{
				Send "{Enter}"
				WinWaitActive "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
				WinMove 100,100, 785,490
				Send "{Click 702 431}"	;clicks  ok 
				;WinWaitClose "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"

				EnterImageOrderDetails()
			}
	}	
}

; supporting function for above
AppendClick(MyText, ImageOption)
	{
	MyText := ImageOption.name
	MouseClick "left", ImageOption.x, ImageOption.y 
	}

;********************************************************************* 
; injections
;*********************************************************************

ClickInjection()
	{
		WinActivate "Order Menu"	
		MouseClick "left", 313, 509 ; clicks clinic orders
		WinActivate "Order Menu"
		MouseClick "left", 132, 138 ; eagle square
	}

InjectionOptions := Array(
	{x:55, y:182, abbr:"l31", 	name:"Lucentis 0.3mg (once)"},
	{x:55, y:182, abbr:"l3", 	name:"Lucentis 0.3mg (continuous)"},

	{x:55, y:182, abbr:"l51", 	name:"Lucentis 0.5mg (once)"},
	{x:55, y:182, abbr:"l5", 	name:"Lucentis 0.5mg (continuous"},

	{x:55, y:182, abbr:"a1", 	name:"Avastin 1.25mg (once)"},
	{x:55, y:182, abbr:"a", 	name:"Avastin 1.25 (continuous)"},

	{x:55, y:182, abbr:"e1",	name:"Eylea 2mg (once)"},
	{x:55, y:182, abbr:"e", 	name:"Eylea 2mg (continuous"},

	{x:55, y:182, abbr:"o", 	name:"other"}
	)

InjectionOptionsGUI()
{
}

ClickCoordsFromObject(coords)
	{
	MouseClick "left", coords.x, coords.y 
	}
/*
Capslock & s::
{
	NewArray := []
	MyText := ""
	for line in InjectionOptions
	{
		index_val := A_Index
		for k,v in line.OwnProps()
			if k="name"
				{
	    		;NewArray.Push(v)
	    		MyText .= index_val
	    		MyText .= k "=" v "`n"
	    		NewArray[index_val] := v
	    		}
	    	}
	MsgBox MyText
	loop parse, NewArray
	{
	   MsgBox "Color number " A_Index " is " A_LoopField
	}
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


