#Include "%A_ScriptDir%"
#INCLUDE "GuiCtlExt.ahk" ;https://github.com/TheArkive/GuiCtlExt_ahk2
#Include "010__clinic_chooser.ahk"
#Include "011__GUI_attending.ahk"
#Include "020__consent.ahk"
#Include "030__cprs_templates.ahk"
#Include "031___preop.ahk"
#Include "031___postop.ahk"
#Include "050__rightclickmenu.ahk"

;

/*
UPDATES
2023/09/20 
2023/09/23 -autocorrected
2023/10/03 - started developing consent
2023/10/04 - addded abbreviation list, dates, choosing encounter types
2023/10/05 - text wrapping (see below)
2023/10/07 - figure out how to do a hotstring/hotkey
2023/11/03 - add F2/F3  for sublime
2023/12/15 - 


[ ] clicking of injections
[ ] needs adding the attending expansion 
[x] re format text for indentation for text wrapping
[ ] shortcuts to see 
	[x] Hba1c specifically!
		- labs > worksheet > enter hgb a1c, enter. tab 6
	[ ] blood pressure Reports > CLinical Reports>  Vital Signs
	[ ] image reports> Radiology Imaging Local Only
	[ ] labs > labs > Cumaltive
	[ ] labs > graphing
[ ] re-route ctrl L, ctrl e, ctrl r 
[x] create a file to create a bunch of text files for pre-charting too hard
[ ] create a settings GUI. (tools?)
[ ] create help screen
[ ] ADD NONFORMULARY ON ORDERS
[ ] hotstring expander https://github.com/henrystern/hotstring_hints
[ ] auto processing optometry note



- format indent 6, 7 

2023/10/05
- install package control
	- https://packagecontrol.io/installation
	- ctrl + shift + p
	- type `install package control`, press `enter`
- install wrap plus (https://github.com/ehuss/Sublime-Wrap-Plus)
	- Bring up the Command Palette (CommandShiftP on OS X, CtrlShiftP on Linux/Windows).
	- Select `package control: install package`
	- type `wrap plus`
- restart sublime

- setting up on an individual file
	- View > Wordwrap
	- View > Wordwrap 80
	- highlight text
	- Alt + q 
- setting up word wrapping for all text files
	- make sure bottom write = "txt"
	- Preference > settings > syntax specific
	- insert the following and click save

		// These settings override both User and Default settings for the Plain text syntax
		{
		// Calculates indentation automatically when pressing enter
		"auto_indent": false,

	    // Disables horizontal scrolling if enabled.
	    // May be set to true, false, or "auto", where it will be disabled for
	    // source code, and otherwise enabled.
	    "word_wrap": "true",

		// Set to a value other than 0 to force wrapping at that column rather than
		// the window width. See "wrap_width_style" for extra options.
		"wrap_width": 80,
		// Columns in which to display vertical rulers. You can also pair the column
		// with a ruler style (See "ruler_style"), eg: [[80, "solid"]]
		"rulers": [[80, "solid"]],
		}
*/


/*
;autodictionary

simple replacement
	https://unicode-table.com/en/; ➝, 🠕 , 🠗,⭠, α,β,γ,
	https://www.arrowsymbol.com/triangle-arrows-symbols
	putting the star does an instant replace
	https://graphemica.com/unicode/characters/page/35
*/

::.r::{U+279D} 			;➝ {U+279D}
::.ra::➝				;➝
::.l::{U+2B60} 			;⭠ 
::.bi::{U+2B64}			;⭤
::.u::⭡					;⭡ {U+2B61} 
::.uu::⇈ 				;
::.incr::⇑	 			;⭡
::.d::⭣					;⭣ {U+2B63}
::.decr::⇓				;⭣ 
::.dd::⇊
::.primary::1°
::.secondary::2° 
::.tertiary::3° 
::.neutrophil::Nφ
::.macrophage::Mφ
::.none::🚫

:*:.event::{U+21D2} 	;⇒
:*:.leadsto::{U+21D2} 	;⇒
:*:.degC::{U+2103} 		;℃
:*:.degF::{U+2109} 		;℉
::.deg::{U+00B0} 		;° 
:*:.alpha::{U+03B1} 	;α
:*:.beta::{U+03B2} 		;β
:*:.gamma::{U+03B3} 	;γ
::.delta::{U+0394} 		;Δ
::.deltalower::{U+03B4} ;δ
::.pi::%>% 				;%>% 
::.um::μm 				;μm
::.ul::μl      			;μl
:*:.psi::φ				;φ
::.female::♀			;U+2640 ♀️ ○ U+25CB
::.male::♂  			;U+2642 ♂️△	U+25B3

::aka::AKA

::optom::optometry
::ophtho::ophthalmology
::neur::neurology
::fluoro::fluorescein
::rapd::RAPD
::oct::OCT
::ou::OU
::od::OD
::os::OS
;::left::LEFT
;::right::RIGHT
::crao::CRAO
::brao::BRAO
::crvo::CRVO
::brvo::BRVO
::wamd::wAMD
::damd::dAMD
::npdr::NPDR
::pdr::PDR

::amd::AMD
::cme::CME
::cidme::CI-DME 
::.cc::CHIEF COMPLAINT: 
::.hpi::HISTORY OF PRESENT ILLNESS: 
;::iva::IVA
;::ive::IVE
;::ivl::IVL
:C:iso::in the setting of
:C:onh::ONH (optic nerve head)
::.noh:: No past macular degeneration, surgery, trauma, blindess, RD, glaucoma
::.nfh::No blindness, AMD, glaucooma
:C:pt::patient
::phni::PHNI
:C:pvd::PVD
::.at::artificial tears
::pfat::preservative free artificial tears
::.mrd::MRD1: mm, MRD2: mm
::rtc::RTC


; the C makes it caps lock sensitive

:C:tid::3 times daily
:C:bid::2 times daily
:C:qid::4 times daily 
::oclock::o'clock
;'


:C:cnv::CNV (choroidal neovascular membranes)
::rbaic::R/B/A outlined, informed consent obtained
:C:ttp::tenderness to palpation
:C:tapulse::good TA pulse, no cords nor tenderness


;an X makes it escecute instead
::.ts0:: 
	{
	    Send FormatTime(, "M/d/yy h:mm")  ; 'It will look like 10/4/23'
	}

:X:.ts::Send FormatTime(, "M/d/yy h:mm")  ; 'It will look like 10/4/23'

:X:.td::Send FormatTime(, "M/d/yy")  ; 'It will look like 10/4/23'
:X:.td2::Send FormatTime(, "yyyy/MM/dd")  ; 'It will look like 2023/10/04' 
:X:.today::Send FormatTime(, "MMM d,yyyy")  ; 'It will look like Oct 4,2023'


;attending := "Dr. Alfred Paul MD"
;attending := "Dr. Salvatore Loporchio MD"
;attending := "Dr. Robert Janigian MD"
;attending := "Dr. Noelle Pruzan MD"
;attending := "Dr. Crystal Zhang MD"
;attending := "Dr. Brian Savoie, MD"


;no space. J rivera
;murphy, greenberg, brian 
::.cat::Crystal Zhang MD, David Rivera MD, Ezra Galler MD, Jorge Rivera MD, Noelle Pruzan MD
::.jriv::Rivera,Jorge
::.driv::Rivera,David
::.gal::Galler,Ezra
::.lop::Loporchio,Salvatore
::.riz::Rizzuto,Philip
::.bry::Bryan,Richard
::.jan::Janigian,Robert
::.mur::Murphy,Marjorie
::.zha::Zhang,Crystal
::.pru::Pruzan,Noelle
::.gre::Greenberg,Paul
::.pau::Paul,Alfred
::.sav::Savoie,Brian

::.mar::Marchand,Nicole
::.ort::Ortiz,Pete

#HotIf FindVarString_Loose(WinGetTitle("A"), "Progress Note Properties")
:*:.note::OPHTHALMOLOGY/NOTE/SURGICAL
:*:.inj::OPHTHALMOLOGY  <H&P OPHTHALMOLOGY INJ
:*:.int::BRIEF OPERATIVE (INTRAOCULAR INJECTION)/OPHTH/SURG
:*:.binj::BRIEF OPERATIVE (INTRAOCULAR INJECTION)/OPHTH/SURG
:*:.bri::BRIEF OPERATIVE NOTE/OPHTHALMOLOGY/SURGICAL
#Hotif

::.bar::*********************************************************************
::.line::--------------------------------------------------------------------------------
::.esq::Esq-Sp-Ophth

#HotIf FindVarString_Loose(WinGetTitle("A"), "Return To Clinic")
	:*:es::
	{
		clinic_chooser()
	}

#HotIf FindVarString_Loose(WinGetTitle("A"), "Patient Selection")
/*
if in the 'patient selection window'
*/

	^s::
		{
		MouseClick "left", 774, 269
		;WinActivate "Save Patient List Settings"
		Sleep 500
		MouseClick "left", 62, 120
		Send "{tab}"
		}

	:*:esq::
		{
		clinic_chooser()
		}
	^o::
	{
		MouseClick "left", 35, 124
		clinic_chooser()
	}
	:*:pro::Pro-Amb Surg Or Non-Count

#HotIf

#Hotif FindVarString_Loose(WinGetTitle("A"), "Sublime")
	Capslock & F::F3
#Hotif FindVarString_Loose(WinGetTitle("A"), "Epic")
	Capslock & F::F2
	F3::F2
#HotIf FindVarString_Loose(WinGetTitle("A"), "H&P OPHTHALMOLOGY CATARACT")
	:*:nad::{
	SendText "
(
no acute distress 
`t normocephalic atraumatic
`t clear to auscultation bilaterally
`t normal rate, regular rhythm
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
}

#Hotif


/*
	:*:nad::{
	SendText "
(
no acute distress 
`t NCAT (normocephalic atraumatic)
`t CTAB (clear to auscultation bilaterally)
`t normal rate RR (regular rhythm)
`t soft bowel sounds present
`t moving spontaneously
)"
}	
*/

 
/*
--------------------------------------------------------------------------------
other utilities
--------------------------------------------------------------------------------
*/


:*:/*::
	{
	SendText "
		(
	/*

	*/

		)"
	Send "{Up 2}"
	}
	;"

:*:.title::
	{
	SendText "
		(
	/*
	--------------------------------------------------------------------------------
99+++++++++++
	--------------------------------------------------------------------------------
	*/

		)"
	Send "{Up 3}"
	}

:*:.titleo::
	{
	SendText "
		(
	/*
	********************************************************************************
	
	********************************************************************************
	*/

		)"
	Send "{Up 3}"
	}


:*:.orange::
	{
	SendText "
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

Capslock & g::ShowStart("Week Calculator", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://dqydj.com/week-calculator/")
;^g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")
Capslock & b::ShowStart("VitalSource Bookshelf: The Wills Eye Manual", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://bookshelf.vitalsource.com/#/")
Capslock & k::ShowStart("Title page", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=file:///C:/Users/VHAPROLiengM/OneDrive%20-%20Department%20of%20Veterans%20Affairs/Kanski%E2%80%99s%20Clinical%20Ophthalmology.%20A%20Systematic%20Approach%20by%20John%20F.%20Salmon%20(z-lib.org).pdf")

Capslock & v::ShowStart("VistA CPRS", "\\v01.med.va.gov\apps\GUI\Clinical\CPRS\Production\CPRS32Cv515_2\CPRSChart.exe ")
; s=vista.providence.med.va.gov p=19218 SHOWRPCS SHOWCERTS

Capslock & d::ShowStart("Dragon Medical One", "C:\Program Files (x86)\Nuance\Dragon Medical One\SoD.exe")
; keep window on top
; ********************************************************************* 

; with notifications
^+SPACE::
{
WinSetAlwaysOnTop -1, "A"
}


; VA phrases
; --------------------------------------------------------------------

::.eomi::{
SendText "
	(
	Prism cover testing sc: 
        Primary gaze: ortho
        RIGHT gaze: ortho
        LEFT gaze: ortho
        RIGHT head tilt: ortho
        LEFT head tilt: ortho
	)"
}

::odos::{
SendText "
	(
	  OD:
	  OS:
	)"
}

::.odos1::{
SendText "
	(
	`tOD:
	`tOS:
	)"
}

::.odos2::{
SendText "
	(
	`t`tOD:
	`t`tOS:
	)"
}

::.odos::{
SendText "
	(
	`t`t`tOD:
	`t`t`tOS:
	)"
}



;********************************************************************* 
; general commands
;********************************************************************* 

; get window coordinates
Capslock & c::
{
	;https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
	A_Clipboard := "" ; empties clipboard
	MouseGetPos &xpos, &ypos 
	MsgBox "The cursor is at X" xpos " Y" ypos
	A_Clipboard := xpos ", " ypos
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
	A_Clipboard := W ", " H
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
Capslock & a::AddNewOrder()
Capslock & m::AddNewMedicine()

#Hotif FindVarString_Loose(WinGetTitle("A"), "Order Menu")
	a::
		{
		ClickAnesthesia()
		Sleep 1000
		EnterAnesthesiaOrderDetails()
		}
	c:: ClickCardsConsult()
	e:: ClickEKG()
	i::
		{
		ClickImaging()
		ImagingGUI()
		}

	j::ClickInjection()
	n::ClickNonFormulary()

	d:: MouseClick "left", 841, 10 ;exits
	x:: MouseClick "left", 841, 10 ;exits
	Backspace:: MouseClick "left", 14, 12 ;goes to previous


#Hotif FindVarString_Loose(WinGetTitle("A"), "Order a Procedure")
	Capslock & e:: EnterEKGOrderDetails()
#Hotif FindVarString_Loose(WinGetTitle("A"), "Order a Consult")
	Capslock & f:: 
	{
		MouseClick "left", 414, 60
		Send FormatTime(, "M/d/yy")  ; 'It will look like 10/4/23'
		MouseClick "left", 604, 403
		;MouseClick "left", 574, 401
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

AddNewOrder()
	{
		Send "^o"
		Sleep 10 ;wait to be processed
		MouseClick "left", 50, 400
		Send "a"	
	}
AddNewMedicine()
	{
		Send "^o"
		Sleep 10 ;wait to be processed
		MouseClick "left", 50, 400
		Send "m"	
	}

ClickImaging()
	{	WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		MouseClick "left", 683, 37 ; clicks 42 local consults/requests
		MouseClick "left", 510, 302 ; clicks 34 surgical consult
		MouseClick "left", 421, 339 ; clicks optometry/ophthalmology imaging services Outpt
	}
ClickEKG()
	{	WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		MouseClick "left", 683, 37 ; clicks 42 local consults/requests
		MouseClick "left", 90, 368 ; clicks 14 medical  consult
		MouseClick "left", 102, 83 ; clicks CARDIOLOGY
		MouseClick "left", 551, 149 ; clicks EKG w/rhythm strip

	}

ClickCardsConsult()
	{
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		MouseClick "left", 683, 37 ; clicks 42 local consults/requests
		MouseClick "left", 181, 376 ; clicks 14 Medical Service

		MouseClick "left", 165, 87 ; clicks 'CARDIOLOGY CONSULTATION'
		MouseClick "left", 160, 290 ; clicks 'Cardiology eConsult'

		WinWait "Reason for Request: CARDIOLOGY E-CONSULT OUTPT"
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(1000/2),783,755
		MouseClick "left", 11, 39 ; clicks [ ] for 'Chart Review'
		Send "{tab}"
		Send "Cataract surgery, pacemaker"

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
		MouseClick "left", 683, 37 ; clicks 42 local consults/requests
		MouseClick "left", 510, 302 ; clicks 34 surgical consult
		MouseClick "left", 414, 85 ; clicks 'Anesthesia E consult'

	}
EnterAnesthesiaOrderDetails()
	{
			MouseClick "left", 102, 319 ;clicks diagnosis
			Sleep 50
			Send "Age related cataract"
			Send "{Tab}"
			Send "MAC"
			MouseClick "left", 239, 92 ; clicks date
			Sleep 50
			Send "Cataract Extraction and intraocular lens placement,  eye"
			Send "{Left 4}"
	}
	
EnterEKGOrderDetails()
	{
			Send "Preop EKG for anesthesia; for cataract surgery"
			MouseClick "left", 239, 92 ; clicks date
			Send FormatTime(, "M/d/yy")
			Sleep 50
			Send "{Tab 4}"
			Send "{Down 2}"	
	}

ClickNonFormulary()
	{
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(4003/2),900,600
		MouseClick "left", 741, 31 ;clicks 42 local consults/requests
		;Send "{Tab 2}"
		;Send "{Enter}"
		MouseClick "left", 537, 185 ;clicks 23 pharmacy consult
		;Send "{Tab 1}"
		;Send "{Down 9}"
		;Send "{Enter}"
		MouseClick "left", 141, 198 ;clicks NFDR EConsult Outpatient
		;Send "{Down 10}"
		;Send "{Enter}"
		Send "{Tab 2}"
	}

; https://www.autohotkey.com/docs/v2/howto/WriteHotkeys.htm
#HotIf GetKeyState("Shift")
Capslock & i:: ImagingGUI()
Capslock & e:: 
	{
	if FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHT-BIOMETRY")
		EncounterBiometry("Zhang")
	if FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMO PROCEDRE 2")
		EncounterProc2("Loporchio")
	if FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMO PRE-OP 3")
		EncounterPreop("Pruzan")
	if FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMO POST-OP 3")
		EncounterPostOp("Pruzan")
	}


#Hotif FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMO PROCEDRE 2")
	^e::EncounterProc2("Loporchio,S")		

#Hotif FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHT-BIOMETRY")
	^e::EncounterBiometry(choice_attending_reverse)

#Hotif FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMO PRE-OP 3")
	^e::EncounterPreOp("Pruzan")

#Hotif  FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMO POST-OP 3")
	^e::EncounterPostOp("Pruzan")

#Hotif  FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMOLOGY 3 ")
	;global choice_attending_reverse
	^e::EncounterOp3(choice_attending_reverse)
#Hotif

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
				MouseClick "left", 657, 431	;clicks  ok 
				;WinWaitClose "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
				
				
				;if WinExist("Order a Consult")
				;	WinActivate 
				; enter date in in "order a consult"
				;WinActivate "Order a Consult"
				;WinWaitActive "Order a Consult"

				WinWaitActive "Order a Consult"
				WinMove ,, 640, 414
				;Send "{CapsLock down}{f down}{CapsLock up}{f up}"
				MouseClick "left", 422, 71		;clicks in date area
				Send FormatTime(, "M/d/yy")  	; 'It will look like 10/4/23'
				Send "{tab 7}"
				Send "{enter}"
				;MouseClick "left", 626, 402	;closes the window
				WinWaitClose "Order a Consult"
				;Sleep 500
				;if WinExist("Order Menu")
				;	{
				;	WinActivate 
				;	WinWaitActive
				;	MouseClick "left", 841, 10						
				;	}
				WinActivate "Order Menu"
				MouseClick "left", 841, 10					
			}
	    ;MsgBox MyText
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
		MouseClick "left", 83, 138 ; eagle square
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





; encounter form
; ********************************************************************* 


EncounterBiometry(choice_attending_reverse)
{	
	choice_attending_reverse := StrReplace(choice_attending_reverse, A_Space,"")
	MouseClick "left", 40, 13 	; click 'Visit Type'
	MouseClick "left", 30, 46 	; click 'Eye codes'
	MouseClick "left", 195, 46	; click option 'intermediate exam established'
	MouseClick "left", 476, 268 ; clicks 'not service connected'
	MouseClick "left", 63, 428  ; clicks in textbox for available providers
	SendWait(choice_attending_reverse)
	Sleep 500
	MouseClick "left", 140, 450 ; clicks 'Add' to add provider
	MouseClick "left", 359, 559 ; clicks 'Primary' to make attending the primary provider

	MouseClick "left", 168, 9	; click 'Procedures'
	MouseClick "left", 91, 46 ; click 'Image/Photos'
	MouseClick "left", 218, 82 ; click 'OCT Mac'

	MouseClick "left", 71, 9 	; click 'Diagnoses'
	MouseClick "left", 103, 153 ; click 'LENS/CORNEA/POSTOP'
	MouseClick "left", 266, 95 	; click "Cataract nuclear bilateral"

	;will need to enter both, l, or r

}

EncounterProc2(choice_attending_reverse)
{
	MouseClick "left", 40, 13 	; click 'Visit Type'
	MouseClick "left", 30, 46 	; click 'Eye codes'
	MouseClick "left", 195, 46	; click option 'intermediate exam established'
	MouseClick "left", 477, 249 ; clicks 'not service connected'
	MouseClick "left", 47, 465  ; clicks in textbox for available providers
	SendWait(choice_attending_reverse)
	Sleep 500

	Send "{Tab}" ;add
	Send "{Enter}"

	Send "{Tab 2}" ;make attending primary provider
	Send "{Enter}"

	;MouseClick "left", 388, 454 ; clicks 'Add' to add provider
	;MouseClick "left", 359, 559 ; clicks 'Primary' to make attending the primary provider

	MouseClick "left", 168, 9	; click 'Procedures'
	MouseClick "left",  91, 125 ; click 'InjectionCodes'
	MouseClick "left", 216, 34 ; click 'Intravitreal Eye Injection'
	MouseClick "left", 91, 46 ; click 'Image/Photos'
	MouseClick "left", 218, 82 ; click 'OCT Mac'
	;MouseClick "left", 122, 136	; click 'Proc-inj vegf'

	; need to program in the different procedure injectionis
	;Sleep 5000

	MouseClick "left", 71, 9 	; click 'Diagnoses'
	MouseClick "left", 101, 217	; click 'Retina'


}

EncounterPreOp(choice_attending_reverse)
{
	
	MouseClick "left", 40, 13 	; click 'Visit Type'
	MouseClick "left", 30, 46 	; click 'Eye codes'
	MouseClick "left", 195, 46	; click option 'intermediate exam established'
	MouseClick "left", 477, 249 ; clicks 'not service connected'
	MouseClick "left", 63, 428  ; clicks in textbox for available providers
	SendWait(choice_attending_reverse)
	Sleep 500
	MouseClick "left", 388, 454 ; clicks 'Add' to add provider
	MouseClick "left", 359, 559 ; clicks 'Primary' to make attending the primary provider

	MouseClick "left", 168, 9	; click 'Procedures'
	;MouseClick "left", 85, 46   ; click 'Image/Photos'
	MouseClick "left", 57, 84   ; click 'test-other'
	MouseClick "left", 216, 99  ; click "ophthalmic biometry"

	MouseClick "left", 71, 9 	; click 'Diagnoses'
	MouseClick "left", 103, 153 ; click 'LENS/CORNEA/POSTOP'

	MouseClick "left", 264, 244  ; click 'combined form right eye'
	MouseClick "left", 267, 258  ; click 'combined form left eye'
}


EncounterPostOp(choice_attending_reverse)
{
	
	MouseClick "left", 40, 13 	; click 'Visit Type'
	MouseClick "left", 30, 46 	; click 'Eye codes'
	MouseClick "left", 195, 46	; click option 'intermediate exam established'
	MouseClick "left", 477, 249 ; clicks 'not service connected'
	MouseClick "left", 63, 428  ; clicks in textbox for available providers
	SendWait(choice_attending_reverse)
	Sleep 500
	MouseClick "left", 388, 454 ; clicks 'Add' to add provider
	MouseClick "left", 359, 559 ; clicks 'Primary' to make attending the primary provider

	MouseClick "left", 71, 9 	; click 'Diagnoses'
	MouseClick "left", 103, 153 ; click 'LENS/CORNEA/POSTOP'

	MouseClick "left", 265, 340  ; click 'post op form right eye'
	MouseClick "left", 267, 354  ; click 'post op form left eye'


}

EncounterOp3(choice_attending_reverse)
{
	WinMove ,, 766, 648, "A"
	;choice_attending_reverse := StrReplace(choice_attending_reverse, A_Space,"")
	MouseClick "left", 40, 13 	; click 'Visit Type'
	MouseClick "left", 30, 46 	; click 'Eye codes'
	MouseClick "left", 195, 46	; click option 'intermediate exam established'
	MouseClick "left", 477, 249 ; clicks 'not service connected'
	MouseClick "left", 63, 428  ; clicks in textbox for available providers
	SendWait(choice_attending_reverse)
	Sleep 500
	MouseClick "left", 388, 454 ; clicks 'Add' to add provider
	MouseClick "left", 359, 559 ; clicks 'Primary' to make attending the primary provider

	MouseClick "left", 71, 9 	; click 'Diagnoses'
	MouseClick "left", 84, 174  ; click 'GLAUCOMA open angle'

	MouseClick "left", 168, 9	; click 'Procedures'
	MouseClick "left", 91, 59 ; click 'Image/Photos'
	MouseClick "left", 281, 52 ; click 'OCT Mac'
	MouseClick "left", 273, 127 ; click "VF"


}




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
Capslock & h:: ShowLabHgbA1c()
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


