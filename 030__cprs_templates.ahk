/*
requires the main file for the value
attending
*/



/*
--------------------------------------------------------------------------------
Components of note
--------------------------------------------------------------------------------
*/


/*
:*:.multiline::{
	Send "
	(
	{
	SendText `"
	(
	)`"
	}

	)"
}

*/

::.noshow::{
	SendText "
	(
`t`t`tCHART REVIEW


Patient canceled or did not show to appointment. The following notes are per 
chart review and are intended to be used in the next visit
	)"
}

::.consult::{
	SendText "
(
`t`t`tOPHTHALMOLOGY CONSULT

*********************************************************************
Unable to result consult through consult tab
********************************************************************* 
)"
}	

::.ora::{
SendText "
(
Intraocular Pressure: ORA  (IOPcc | CH | IOPg) 
        OD: 1. | . | 1.
        OS: 1. | . | 1.

Applanation @ : 
        OD: 1 mmHg
        OS: 1 mmHg
)"

}



::.myexams::{
	SendText "
	(
EXAMINATION:
 
VISUAL ACUITY: ()SC ()CC
	OD: 20/ PHNI
	OS: 20/ PHNI
 
Intraocular Pressure: tonopen 
	OD: 1 mmHg
	OS: 1 mmHg

Pupils: PERRLA
Confrontation Fields: full count fingers in 4 quadrants OU
Extraocular Motility: full, equal, smooth accurate OU 
Ishihara - 11/11 OU 


SLE:
	L/L: no bleph
	S,C: white and quiet 
	K: clear 
	I: no NVI 
	AC: deep & quiet
	L: ***2-3+ NS 
	AV: clear 
 
DFE OU:
	Vit: PVD***
	Disc: flat, pink, distinct
	C/D: 
		OD:  
		OS: 
	Macula: foveal reflex intact
	Vessels: no hemorrhages
	Periphery: no holes/tears
	)"
}	

/*
also could say without edema, lipid or heme
vasculature: normal caliber and appearance

*/


::.exams::{
		SendText "
		(
	EXAMINATION:
	 
	`tVISUAL ACUITY: ()SC ()CC
	`tOD: 20/ PHNI
	OS: 20/ PHNI
		)"
		Send "{enter}{backspace}{enter}"
		SendText "
		(	
	Intraocular Pressure: tonopen 
	`tOD: 1 mmHg
	OS: 1 mmHg
		)"
		Send "{enter}{backspace 2}{enter}"
		SendText "
		(
	`tConfrontation Fields: full count fingers in 4 quadrants OU
	Extraocular Motility: full, equal, smooth accurate OU 
	Ishihara - 11/11 OU 
		)"
		Send "{enter}{backspace 2}{enter}"
		SendText "
		(
	`n`tSLE:
	`tL/L: no bleph
	S,C: white and quiet 
	K: clear 
	I: no NVI 
	AC: deep & quiet
	L: ***2-3+ NS 
	AV: clear 
		)"
		Send "{enter}{backspace 2}{enter}"
		SendText "
		(	 
	`tDFE OU:
	`tVit: PVD***
	Disc: flat, pink
	C/D: OD:  OS: 
	Macula: foveal reflex intact
	Vessels: no hemorrhages
	Periphery: no holes/tears
		)"
}	


::.cc::{
	SendText "
	(
CHIEF COMPLAINT

********************************************************************* 
PAST OCULAR HX

OCULAR MEDS
********************************************************************* 

	)"
}	


::.ap::{
	SendText "
	(
	********************************************************************* 
	ASSESSMENT/PLAN
	)"
}	


::.ar::{
	SendText "
	(
	********************************************************************* 
	ASSESSMENT
	- 

	RECOMMENDATIONS
	-
	)"
}	


::.na::{
	SendText "
	(
	----NOT ADDRESSED---- 
	)"
}	


::.end1::{

	SendText "
(

The patient was seen and examined and/or discussed with the attending
physician Dr. Richard Bryan, who agrees with the management plan.
 
*********************************************************************
PATIENT EDUCATION/COUNSELING:
The disease process(es) and implications thoroughly discussed with the 
patient. After all the patients questions were answered, the patient voiced 
an understanding of and was in agreement with the management plan.
 
All ocular medications reconciled.

)"
	}

::.end::{

SendText "
(
The patient was seen and examined and/or discussed with the attending
physician
)"
Send A_space attending
SendText "
(
, who agrees with the management plan.
 
*********************************************************************
PATIENT EDUCATION/COUNSELING:
The disease process(es) and implications thoroughly discussed with the 
patient. After all the patients questions were answered, the patient voiced 
an understanding of and was in agreement with the management plan.

All ocular medications reconciled.

)"
	}

::.endp::{

SendText "
(
The patient was seen and examined and/or discussed with the attending
physician
)"
Send A_space attending
SendText "
(
, who agrees with the management plan.
 
*********************************************************************
PATIENT EDUCATION/COUNSELING:
  The risks, benefits and alternatives of the injection procedure were
reviewed with patient at length. All the patient's questions were answered
and the patient voiced an understanding of the above. The patient elected to
proceed with the planned injection and written informed consent was obtained.

All ocular medications reconciled.

)"
	}

/*
--------------------------------------------------------------------------------
DISEASE SPECIFIC
--------------------------------------------------------------------------------
*/


::.glaucoma::{
	SendText "
(
#Glaucoma:
  Risk factors: 
  Tmax:
  Tgoal:
  Treatments:
  Tests:
    Last DFE:
    Fundus photos:
    RNFL OCT:
    Visual fields:
    Gonioscopy:
    Pachymetry:
  Drance heme?
  VF defect:
)"
}	

::.des::{
SendText '
(
#Dry eye syndrome OU
- first noted on 
)'
Send A_space FormatTime(, "M/d/yy") A_space
SendText '
(

- teary eyes, PEE on exam, MGD OU
- last educated patient on
)'
Send A_space FormatTime(, "M/d/yy") A_space
SendText '
(
on lid hygiene, warm compresses
- preservative free artificial tears 4-6x daily
)'
}

/*
--------------------------------------------------------------------------------
FULL NOTE TEMPLATES
--------------------------------------------------------------------------------
*/


::.biom::
::.biometry::{
SendText "
	(
BIOMETRY PRE OP


CHIEF COMPLAINT: Cataracts OU
 
*********************************************************************
HISTORY OF PRESENT ILLNESS:
 
Patient is a *** yo referred for cataract referral OU. Patient reports
blurred vision OU and difficulty with glare and night driving.

- Heart stent? Pacemaker?	[ ]No [ ] Yes:
- Difficulty lying flat>30min		[ ]No [ ] Yes:
- Issues with surgery before		[ ]No [ ] Yes:
- Eye surgery history 		[ ]No [ ] Yes:
- Eye trauma history (IFIS)	[ ]No [ ] Yes:	
- On alpha-blocker? 		[ ]No [ ] Yes:
- Oral steroids 		[ ]No [ ] Yes:

 
********************************************************************
PAST OCULAR HISTORY:
#visually significant cataracts
*********************************************************************
CURRENT EYE MEDICATIONS:
None
*********************************************************************

EXAMINATION:
 
	VISUAL ACUITY: ()SC ()CC
		OD: 20/ PHNI
		OS: 20/ PHNI
	 
	Intraocular Pressure: tonopen  
		OD: 1 mmHg
		OS: 1 mmHg

	SLE:
		L/L: no bleph
		S,C: white and quiet 
		K: clear, no guttae
		I: no NVI 
		AC: deep & quiet
		L: ***4+ NS 
		AV: clear 
	 
	DFE OU:
		vit: *** PVD
		Disc: flat s/p/f
		CD: 
			OD:  
			OS: 
		Macula: foveal reflex intact
		Vessels: no hemorrhages
		Periphery: no holes/tears

*********************************************************************
Mac OCT
	OD: foveal contour intact, no IRF/SRF
	OS: foveal contour intact, no IRF/SRF 
 
*********************************************************************
IMPRESSION/PLAN: 

#Cataract OU
- visually significant
- motivated to pursue surgery
- plan for OD > OS***; plan for plano (distance vision)

- last EKG:
- order for EKG placed
- no significant cardiac history, no cardiology referral indicated
- given history of *** cardiac referral placed
 
The patient was informed that cataract surgery is elective surgery and that
if cataract surgery was not performed, the visual acuity in the eye would
continue to gradually decrease from progression of the cataract. The patient
was reassured this was a reversible form of visual loss and that cataract
surgery could always be done later at a time of the patient's choosing.
 
The cataract surgical procedure was explained to the patient, including
anesthesia options. The risks and benefits of and alternatives to cataract
surgery were reviewed at length with the patient, including but not limited
to infection [endophthalmitis]; cystoid macular edema; retinal detachment;
bullous keratopathy; zonular/posterior capsular rupture; vitreous loss,
vitreous hemorrhage; suprachoroidal hemorrhage; iris trauma; retained lens
fragments; ptosis, and need for additional surgery. It was explained that
many of these and other complications may develop during surgery, weeks or
even years later, and could result in poor vision, loss of vision, or loss
of eye, and that risks are greater with prior eye injury or surgery. The
patient was informed that certain comorbidities and high-risk characteristics
present may influence or alter the expected surgical techniques and/or
outcomes of the procedure. The patient was informed that while surgery
often reduces the need for glasses, most patients use glasses for some or
all activities.
 
It was explained to the patient that an ophthalmology resident would be
participating in the cataract surgery under the close supervision of the
attending physician. The patient voiced an understanding of this and was
in agreement with this plan. The patient was also informed of the need to
understand and respond to instructions and communicate with the team as
necessary during the cataract surgery.
 
Any patient barriers to learning were identified and considered during the
discussion. The patient voiced an understanding of the procedure, risks and
benefits discussed above and all the patient's questions were addressed by
the provider. The patient elected to proceed with cataract surgery.



	)"
}


::.consult2::{
	SendText "
(

*********************************************************************
CHIEF COMPLAINT:
 
*********************************************************************
HISTORY OF PRESENT ILLNESS:
 
Patient is a 
 
********************************************************************
PAST OCULAR HISTORY:
 
*********************************************************************
CURRENT EYE MEDICATIONS:
 
*********************************************************************
EXAMINATION:

	VISUAL ACUITY: ()SC ()CC
		OD: 20/ PHNI
		OS: 20/ PHNI

	Intraocular Pressure: tonopen @ : am
		OD: 1 mmHg
		OS: 1 mmHg

	Confrontation Fields: full count fingers in 4 quadrants OU
	Extraocular Motility: full, equal, smooth accurate OU
	Ishihara - 11/11 OU


	SLE:
		L/L: no bleph
		S,C: white and quiet
		K: clear
		I: no NVI
		AC: deep & quiet
		L: ***2-3+ NS
		AV: clear
		
	DFE OU:
		Vit: PVD***
		Disc: flat, pink, distinct
			C/D:
				OD:
				OS:
		Macula: foveal reflex intact
		Vessels: no hemorrhages
		Periphery: no holes/tears


*********************************************************************
ASSESSMENT
-

RECOMMENDATIONS
-

)"
}	




::.in1::{

	SendText "
(

Lot number: *** EXP ***
 
Surgeons: Lieng, Loporchio

 
Prep: 5% Povidone-iodine (PI) to conjunctival cul-de-sac and ocular surface
 
Anesthesia: Topical (0.5%) proparacaine hydrochloride solution
 
Complications: none
 
Disposition: stable
 
 
The procedure was performed under controlled aseptic conditions with sterile
gloves. The Veteran and all staff wore masks. We prepped the Veteran's eye
with 0.5% proparacaine and 5% PI. Next, we held the eyelids open with an
eyelid speculum. Then we placed 1-2 drops of 5% PI in the eye. After 30-60
seconds, we used a caliper to mark the injection site. We placed an additional
drop of 5% PI on the injection site and then performed the intravitreal
injection (30g needle). We verified that the Veteran's vision was at least
counting fingers and/or there was adequate perfusion of the optic nerve head
(via indirect ophthalmoscopy). The Veteran tolerated the procedure well. We
reviewed and confirmed that the Veteran understood the post-operative
instructions, including the importance of contacting the
ophthalmology service for significant pain, decrease in vision or new
flashes/floaters, and the 24/7 contact information for the ophthalmology
service.
 
Follow up plan:
see H&P note

)"
	}


::.inbi::{

	SendText "
(

Lot number: *** (EXP ***)

Post-operative diagnosis: Same

Surgeons: Loporchio, Lieng

 
Prep: 5% Povidone-iodine (PI) to conjunctival cul-de-sac and ocular surface
 
Anesthesia: Topical (0.5%) proparacaine hydrochloride solution
 
Complications: none
 
Disposition: stable

Bilateral Injections:
Each eye was treated independently: separate sterile instruments and
medications were utilized for each injection as described below.
 
The procedure was performed under controlled aseptic conditions with sterile
gloves. The Veteran and all staff wore masks. We prepped the Veteran's eye
with 0.5% proparacaine and 5% PI. Next, we held the eyelids open with an
eyelid speculum. Then we placed 1-2 drops of 5% PI in the eye. After 30-60
seconds, we used a caliper to mark the injection site. We placed an additional
drop of 5% PI on the injection site and then performed the intravitreal
injection (30g needle). We verified that the Veteran's vision was at least
counting fingers and/or there was adequate perfusion of the optic nerve head
(via indirect ophthalmoscopy). The Veteran tolerated the procedure well. We
reviewed and confirmed that the Veteran understood the post-operative
instructions, including the importance of contacting the
ophthalmology service for significant pain, decrease in vision or new
flashes/floaters, and the 24/7 contact information for the ophthalmology
service.
 
Follow up plan:
see H&P note

)"
	}



::.in::{

	SendText "
(

Lot number: *** (EXP ***)

Post-operative diagnosis: Same

Surgeons: Loporchio, Lieng

 
Prep: 5% Povidone-iodine (PI) to conjunctival cul-de-sac and ocular surface
 
Anesthesia: Topical (0.5%) proparacaine hydrochloride solution
 
Complications: none
 
Disposition: stable
 
 
The procedure was performed under controlled aseptic conditions with sterile
gloves. The Veteran and all staff wore masks. We prepped the Veteran's eye
with 0.5% proparacaine and 5% PI. Next, we held the eyelids open with an
eyelid speculum. Then we placed 1-2 drops of 5% PI in the eye. After 30-60
seconds, we used a caliper to mark the injection site. We placed an additional
drop of 5% PI on the injection site and then performed the intravitreal
injection (30g needle). We verified that the Veteran's vision was at least
counting fingers and/or there was adequate perfusion of the optic nerve head
(via indirect ophthalmoscopy). The Veteran tolerated the procedure well. We
reviewed and confirmed that the Veteran understood the post-operative
instructions, including the importance of contacting the
ophthalmology service for significant pain, decrease in vision or new
flashes/floaters, and the 24/7 contact information for the ophthalmology
service.
 
Follow up plan:
see H&P note

)"
	}


