/* 
Started 9/13/2023


[ ] add something for editing text (like a double click)
[ ] find in CPRS
*/

 
; autoreplace

::.td::09/13/23
::.today::Sep 13,2023

::.jorge::Rivera,Jorge
::.lopor::Loporchio,Salvatore
::.rizz::Rizzuto,Philip R
::.bry::Bryan,Richard
::.note::OPHTHALMOLOGY/NOTE/SURGICAL
::.inj::OPHTHALMOLOGY  <H&P OPHTHALMOLOGY INJ
::.murph::Murphy,Marjorie

::.bar::*********************************************************************
::.esq::Esq-Sp-Ophth


:*:rtc::Return to clinic in 
:*:pfat::PFAT (preservative free artificial tears)
::os::OS
::od::OD
::ou::OU
::left::LEFT
::right::RIGHT
::optom::optometry
::neuro::neurology
::ttp::tenderness to palpation
::tapulse::good TA pulse, no cords nor tenderness
::phni::PHNI
::.at::artificial tears
::tid::3 times daily
::bid::2 times daily
::qid::4 times daily 
::oclock::o'clock

;'

::.odos::{
SendText "
(
`tOD:`nOS: 
)"
}



::.na:: --NOT ADDRESSED--
::.sooner:: {
	Send "or sooner PRN if new or worsening symptoms develop"
}

::.apr::{
	SendText "
	(
*********************************************************************
ASSESSMENT/PLAN
- 

RECOMMENDATIONS
- 
	)"
}

::.end::{

SendText "
	(
	*********************************************************************
	The patient was seen and examined and/or discussed with the attending
	physician Dr. Marjorie Murphy, who agrees with the management plan.
	 
	*********************************************************************
	PATIENT EDUCATION/COUNSELING:
	The disease process(es) and implications thoroughly discussed with the patient.
	After all the patients questions were answered, the patient voiced an
	understanding of and was in agreement with the management plan.
	 
	All ocular medications reconciled.

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




/*

Arrows!!!
i 	up
k 	down
j 	left
l 	right

u 	Home (beginning of line)
o 	End (end of line)
H   left one word
; 	right one word
bs  delete
*/



SetCapsLockState "AlwaysOff"
::CapsLockCapsLock:: 
	{
		SetCapsLockState !GetKeyState("CapsLock", "T")
	}
CapsLock & i::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Up}"
		else
			Send "+{Up}"
	}

CapsLock & k::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Down}"
		else
			Send "+{Down}"
	}

CapsLock & j::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Left}"
		else
			Send "+{Left}"
	}

CapsLock & l::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Right}"
		else
			Send "+{Right}"
	}

CapsLock & u::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Home}"
		else
			Send "+{Home}"
	}

CapsLock & o::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{End}"
		else
			Send "+{End}"
	}

CapsLock & H::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "^{Left}"
		else
			Send "+^{Left}"
	}

CapsLock & SC027::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "^{Right}"
		else
			Send "+^{Right}"
	}

CapsLock & BS::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Del}"
		else
			Send "+{Del}"
	}



CapsLock & 8::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelUp}"
		else
			Send "+{WheelUp}"
	}
CapsLock & 9::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelDown}"
		else
			Send "+{WheelDown}"
	}
CapsLock & 7::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelLeft}"
		else
			Send "+{WheelLeft}"
	}
CapsLock & 0::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelRight}"
		else
			Send "+^{WheelRight}"
	}

Capslock & Enter::
{
	Send "{Click 2}"
}

Capslock & F::
{
	Send "{Click 2}"
}



/*
Chief Complaint/Reason for Visit: 

Patient presents for a follow up to a problem specific exam. He presented last 
week for a hordeolum OS. Patient was prescribed Tobradex ung BID OS for 5-7 
days, frequent use of warm compresses OS, and artificial tears QID OU for 
comfort. Patient states that it has not gotten any better after following this 
regimen for almost 2 weeks. Patient first noted the bump 2 weeks ago. 
Patient denies any trauma/recent illness/exposure to individuals with red eye.
 
Review of Systems (other than noted in medical history): reviewed
 
 
Eyes:   [-]Redness              [-]Itching
        [-]Pain                 [-]Dryness
        [-]Flashes              [-]Light Sensitivity
        [-]Floaters             [-]Glare
        [-]Headaches            [-]Diplopia
        [ ]Other:
 
Past Ocular History:
 
Macula Degeneration     [ ]Yes  [x]No:
Surgery                 [ ]Yes  [x]No:
Trauma                  [ ]Yes  [x]No:
Blindness               [ ]Yes  [x]No:
Retinal Detachment      [ ]Yes  [x]No:
Other                   [ ]Yes  [x]No:
Glaucoma                [ ]Yes  [x]No:
 
 
Medical History:
(-) diabetes
(-) hypertension
(+) elevated cholesterol
 
 
Family Ocular History:
(-) glaucoma
(-) AMD
(-) blindness
 
Distance Visual Acuity: ( )sc (x)cc
 
     OD 20/20
     OS 20/20
 
Pupils:
 
        (x) Equal, round, reactive without afferent defect.
        ( ) Other:
 
Extraocular Muscle Motility:
 
        (x) Full, equal, smooth, accurate
        ( ) Other
 
Confrontation Fields:
 
        (x) Full to finger counting OD, OS
        ( ) Other
 
Biomicroscopy:
 
       Lids/Lashes:  OD (x) Normal
                        ( ) Other:
 
                     OS ( ) Normal
                        (x) Other: mild edema and erythema, upper lid internal
                                nodule with (+)pus point
 
       Conjunctiva:  OD (x) White and Quiet
                        ( ) Other:
 
                     OS ( ) White and Quiet
                        (x) Other: 1+ nasal/superior injection
 
       Cornea:       OD (x) Clear
                        ( ) Other:
 
                     OS (x) Clear
                        ( ) Other:
 
       Iris:         OD (x) Normal and flat without neovascularization
                        ( ) Other:
 
                     OS (x) Normal and flat without neovascularization
                        ( ) Other:
 
       Lens:         OD (x) Clear
                        ( ) Other:
 
                     OS (x) Clear
                        ( ) Other:
 
       Ant. Chamber: OD (x) Deep and quiet
                        ( ) Other:
 
                     OS (x) Deep and quiet, (-)cells/flare
                        ( ) Other:
 
       Angles:       OD (x) Open by Von Herrick
                        ( ) Other:
 
                     OS (x) Open by Von Herrick
                        ( ) Other:
 
************************************************************************
 
Impression:
1. Hordeolum OS
 
Plan:
1. Patient educated on condition and etiology. Prescribed Keflex BID and 
continue frequent use of warm compresses OS, and artificial tears QID OU
for comfort. Patient is scheduled with Oculoplastics (Dr. Rizzuto) next 
Wednesday, September 13th. Patient expressed understanding and agreed with 
treatment plan.
 






*/