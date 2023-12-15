;

/*
UPDATES
2023/09/20 
2023/09/23 -autocorrected

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
::neuro::neurology
::fluoro::fluorescein
::rapd::RAPD
::oct::OCT
:*:ou::OU
:*:od::OD
:*:os::OS
::left::LEFT
::right::RIGHT
::crao::CRAO
::brao::BRAO
::crvo::CRVO
::brvo::BRVO
::wamd::wAMD
::damd::dAMD
::npdr::NPDR
::pdr::PDR
::cme::CME
;::iva::IVA
;::ive::IVE
;::ivl::IVL
::iso::in the setting of
::onh::ONH (optic nerve head)
::phni::PHNI
::.at::artificial tears
::pfat::preservative free artificial tears
::.mrd::MRD1: mm, MRD2: mm
::tid::3 times daily
::bid::2 times daily
::qid::4 times daily 
::oclock::o'clock
;'

::cnv::CNV (choroidal neovascular membranes)
::rbaic::R/B/A outlined, informed consent obtained
::ttp::tenderness to palpation
::tapulse::good TA pulse, no cords nor tenderness


::.td::09/27/23
::.today::Sep 27,2023

::.jorge::Rivera,Jorge
::.lopor::Loporchio,Salvatore
::.rizz::Rizzuto,Philip
::.bry::Bryan,Richard
::.mur::Murphy,Marj
:*:.note::OPHTHALMOLOGY/NOTE/SURGICAL
::.inj::OPHTHALMOLOGY  <H&P OPHTHALMOLOGY INJ
::.murph::Murphy,Marjorie

:*:.inj::OPHTHALMOLOGY  <H&P OPHTHALMOLOGY INJ
::.bar::*********************************************************************
::.esq::Esq-Sp-Ophth

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
!+o::Send "+^{End}"
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

Capslock & g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")
;^g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")



; VA phrases
; --------------------------------------------------------------------

::.end::{

	SendText "
(

The patient was seen and examined and/or discussed with the attending
physician Dr. Salvatore Loporchio, who agrees with the management plan.
 
*********************************************************************
PATIENT EDUCATION/COUNSELING:
The disease process(es) and implications thoroughly discussed with the patient.
After all the patients questions were answered, the patient voiced an
understanding of and was in agreement with the management plan.
 
All ocular medications reconciled.

)"
	}


::.na::{
	SendText "
	(
	----NOT ADDRESSED---- 
	)"
}	

::.myexam::{
SendText "
(
 
*********************************************************************
EXAM:

  VISUAL ACUITY: ( )sc (x)cc
 
     OD  20/30+2 PH NI
     OS  20/30   PH 20/30+1

  TONOMETRY: Applanation, Time
	OD:
	OS:

  PUPILS:
 	Equal, round and reactive to light.
 	Pupil Diameter (room light):
	 OD:
	 OS:
	Pupil Diameter (dim light):
	 OD:
	 OS:

	Afferent Pupillary Defect: None


 CONFRONTATION FIELDS:
	OD: full count fingers 4 quadrants
	OS: full count fingers 4 quadrants

 EXTRAOCULAR MOTILITY: full, equal, smooth accurate

 ISHIHARA - 11/11 OU


SLIT-LAMP BIOMICROSCOPY:

  Lids/Lashes:	
	OD: no blepharitis
	OS: no blepharitis
  Conjunctiva:
	OD: white and quiet
	OS: white and quiet
  Cornea:
	OD: clear
	OS: clear
  AC:
	OD: deep and quiet
	OS: deep and quiet
  Iris:
	OD: no NVI
	OS: no NVI
  Lens:
	OD: trace NSC
	OS: trace NSC

  Ant Vit:
	OD: clear
	OS: clear

DFE
  Vitreous:
	OD: clear
	OS: clear
  Disc:
	OD: distinct, pink, flat
	OS: distinct, pink, flat
  C/D Ratio 
	OD:
	OS: 
  Vessels:
 	OD: unremarkable
 	OS: unremarkable
  Periphery:
	OD: no holes or tears
	OS: no holes or tears
)"
}	


::.myexams::{
	SendText "
	(
EXAMINATION:
 
VISUAL ACUITY: SC CC
		OD: 20/30 -1 PHNI
		OS: 20/400 PHNI
 
Intraocular Pressure: tonopen @ : am 
		OD: 14 mmHg
		OS: 11 mmHg
SLE:
        L/L: no bleph
        S,C: white and quiet 
        K: clear OD/OS
        I: no NVI 
        AC: deep & quiet
        L: ***4+ NS 
        AV: clear 
 
DFE OU:
		Vit: PVD
        Disc: flat s/p/f 
        	CD: OD  OS 
        Macula: foveal reflex intact
        Vessels: no hemorrhages
        Periphery: no holes/tears
	)"
}	


::.glaucoma::{
	SendText "
	(
	Glaucoma:
	 type:
	 tmax:
	 goal:
	 treatments:
	 fundus photos:
	 RNFL OCT:
	 visual fields:
	 - defects: none
	 gonioscopy
	 pachymetry:
	)"
}	


::.ap::{
SendText "
	(
	*********************************************************************
	ASSESSMENT/PLAN

	)"
}

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
Capslock & a::
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

/*
capslock & r: return to clinic
capslock & o: add new order 
caplock & i: add imaging order
shift + capslock + i: bring up imaging order GUI
*/


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
;MouseClick "left", 157, 136 time sensitive


Capslock & o::
{
	Send "^o"
	Sleep 5 ;wait to be processed
	MouseClick "left", 50, 400
	Send "a"
}


/*
IMAGING orders
opens new window 'Order Menu'
42 - internal
34 surgical
optometry/ophthalmology imaging services Outpt
opens new window : 'Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT'

1. visual fields by Zeiss visual field
2. posterior OCT by Zeiss stratus
3. posterior OCT by Heidleberg HRA-OCT Spectralis
4. fluorescein angiography by Heidleberg HRA-OCT Spectralis
5. fundus photography by topcon 50 ex fundus camera
6. IOL calculation by Zeiss IOL Master
7. Cornea Topography by Zeiss Altas 993 Topopgrapher
8. A/B Ultrasound by AVISO Ultrasound
9. Anterior Segment PHotography by Haag-Streit Slitlamp camera
10. Anterior segment OCT Visante (Zeiss)


55, 182 	1. visual fields by Zeiss visual field
55, 202 	2. posterior OCT by Zeiss stratus
55, 220 	3. posterior OCT by Heidleberg HRA-OCT Spectralis
55, 239 	4. fluorescein angiography by Heidleberg HRA-OCT Spectralis
55, 260 	5. fundus photography by topcon 50 ex fundus camera
55, 280 	6. IOL calculation by Zeiss IOL Master
55, 295		7. Cornea Topography by Zeiss Altas 993 Topopgrapher
55, 315		8. A/B Ultrasound by AVISO Ultrasound
55, 335		9. Anterior Segment PHotography by Haag-Streit Slitlamp camera
55, 355		10. Anterior segment OCT Visante (Zeiss)


*/

Capslock & i::
{
	/*
	Send "^o"
	Sleep 5 ;wait to be processed
	MouseClick "left", 50, 400
	Send "a"
	if WinExist("Add New Orders")
			WinActivate 
	else
		Send "a"
		*/
	MouseClick "left", 683, 37 ; clicks internal
	MouseClick "left", 510, 302 ; clicks surgical consult
	MouseClick "left", 421, 339 ; clicks optometry/ophthalmology imaging services Outpt
	ImagingGUI
}



/*
Trying to get modifier with capslock. Not working
{
if GetKeyState("CapsLock", "T")
	MsgBox "pressed capslock+shift+i"
else
	MsgBox "pressed shift +i "
}
*/

; https://www.autohotkey.com/docs/v2/howto/WriteHotkeys.htm
#HotIf GetKeyState("Shift")
Capslock & i:: ImagingGUI


; need to add multiline text

ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("Text",, " Choose imaging modality. Common options include: `n1.VF `n3.OCT `n5.fundus")
	MyGui.Add("ComboBox", "r11 vImageChoice", ["1.VF","2.OCT Zeiss","3.OCT Heidleberg"]) ;r11 means 11 tall
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
	    	{
	    	MyText .= "1.VF"
	    	MouseClick "left", 55, 182
	    	}
	    if Saved.ImageChoice ~= "1,|vf|VF"
	    	{
	    	MyText .= "`n1.VF"
	    	MouseClick "left", 55, 182
	    	}
	    if Saved.ImageChoice ~= "2|oct zeiss|OCT zeiss|OCT z|octz"
	    	{
	    	MyText .= "`n2.zeiss"
	    	MouseClick "left", 55, 202 
	    	}
	    if Saved.ImageChoice ~= "3|oct|OCT|oct h|OCT H|octh"
	    	{
	    	MyText .= "`n3.OCT Heidleberg"
	    	MouseClick "left", 55, 220
	    	}
 
	    if Saved.ImageChoice ~= "5|fund|fundus"
	    	{
	    	MyText .= "`n5.fundus photos"
	    	MouseClick "left", 55, 260
	    	}
	    ;MsgBox MyText
	}	
}


Capslock & q::
{
	MyGui := Gui()
	Tab := MyGui.Add("Tab3",, ["First Tab","Second Tab","Third Tab"])
	MyGui.Add("CheckBox", "vMyCheckBox", "Sample checkbox") 
	Tab.UseTab(2)
	MyGui.Add("Radio", "vMyRadio", "Sample radio1")
	MyGui.Add("Radio",, "Sample radio2")
	Tab.UseTab(3)
	MyGui.Add("Edit", "vMyEdit r5")  ; r5 means 5 rows tall.
	Tab.UseTab()  ; i.e. subsequently-added controls will not belong to the tab control.
	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)
	MyGui.Show()

	ProcessUserInput(*)
	{
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    MsgBox("You entered:`n" Saved.MyCheckBox "`n" Saved.MyRadio "`n" Saved.MyEdit)
	}	
}




