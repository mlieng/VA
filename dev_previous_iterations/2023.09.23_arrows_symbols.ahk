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
::ou::OU
::od::OD
::os::OS
::left::LEFT
::right::RIGHT
::crao::CRAO
::brao::BRAO
::crvo::CRVO
::brvo::BRVO
::wamd::wAMD
::damd::dAMD
::iva::IVA
::ive::IVE
::ivl::IVL
::iso::in the setting of
::onh::ONH (optic nerve head)
::phni::PHNI
::.at::artificial tears
::tid::3 times daily
::bid::2 times daily
::qid::4 times daily 
::oclock::o'clock
;'
::ttp::tenderness to palpation
::tapulse::good TA pulse, no cords nor tenderness


::.td::09/27/23
::.today::Sep 13,2023

::.jorge::Rivera,Jorge
::.lopor::Loporchio,Salvatore
::.rizz::Rizzuto,Philip R
::.bry::Bryan,Richard
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
	*********************************************************************
	The patient was seen and examined and/or discussed with the attending
	physician Dr. Rizzuto, who agrees with the management plan.
	 
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