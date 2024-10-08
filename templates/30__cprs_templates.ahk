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

::.consult2::{
	SendText "
(
`t`t`tOPHTHALMOLOGY CONSULT

*********************************************************************
Unable to result consult through consult tab
********************************************************************* 
)"
}	

::.ora1::{
SendText "
(
        Intraocular Pressure: 
            ORA  (IOPcc / CH / IOPg) 
                OD: 1. / . / 1. (WS )
                OS: 1. / . / 1. (WS )

      Applanation @ : 
                OD: 1 mmHg
                OS: 1 mmHg
)"

}

::.ora::{
SendText "
(
        ORA
	   	OD  IOPcc  - CH  - IOPg   (WS )
		OS  IOPcc  - CH  - IOPg   (WS )

         Goldmann
                OD  mmHg
                OS  mmHg
 
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



::.ee::{
SendText "
(

EYE EXAMINATION
         Lids, lashes:
                OD: wnl
                OS: wnl
 
         Conjunctiva:
                OD: W&q
                OS: w&q
         Cornea:
                OD: clear
                OS: clear
         AC:
                OD: d&q
                OS: d&q
         Iris:
                OD: -NVI
                OS: -NVI
         Lens:
                OD: PCIOL
                OS: PCIOL
 
 
FUNDUS EXAMINATION (78D and 20D lenses):
 
         Vitreous:
                OD: clear
                OS: PVD
         C/D Ratio:
                OD: 0.5
                OS: 0.6
         Disc Appearance:
                OD: p/s/f
                OS: p/s/f
         Macula:
                OD: flat no heme
                OS: flat no heme
         Vessels:
                OD: normal caliber
                OS: normal caliber
         Periphery:
                OD: no rt/rd
                OS: no rt/rd
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

::.end::{ ; in one function
end_text := Format(
"
(
	
The patient was seen and examined and/or discussed with the attending
physician Dr. {1}, who agrees with the management plan.
 
*********************************************************************
PATIENT EDUCATION/COUNSELING:
The disease process(es) and implications thoroughly discussed with the 
patient. After all the patients questions were answered, the patient voiced 
an understanding of and was in agreement with the management plan.
 
All ocular medications reconciled.
)", 
        choice_attending)

Send end_text

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

::.end2::{

SendText "
(
The patient was seen and examined and/or discussed with the attending
physician
)"
Send A_space choice_attending
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


;MyKey := "Shift"
;Send "{" MyKey " down}"  


write_end_text(){
end_text := Format(
"
(
The patient was seen and examined and/or discussed with the attending
physician Dr. {1}, who agrees with the management plan.
 
*********************************************************************
PATIENT EDUCATION/COUNSELING:
The disease process(es) and implications thoroughly discussed with the 
patient. After all the patients questions were answered, the patient voiced 
an understanding of and was in agreement with the management plan.
 
All ocular medications reconciled.
)", 
        choice_attending)

Return end_text	
}

::.end3:: { ; in a callable function
end_text := write_end_text()
Send end_text
}

:X:.end4:: Send write_end_text() 

::.end5::{ ; in one function
end_text := Format(
"
(
The patient was seen and examined and/or discussed with the attending
physician Dr. {1}, who agrees with the management plan.
 
*********************************************************************
PATIENT EDUCATION/COUNSELING:
The disease process(es) and implications thoroughly discussed with the 
patient. After all the patients questions were answered, the patient voiced 
an understanding of and was in agreement with the management plan.
 
All ocular medications reconciled.
)", 
        choice_attending)

Send end_text

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
	-Last DFE: 
    	-Fundus photos: 
    	-RNFL OCT: (see results section)
    	-Visual fields: (see results section)
    	-Gonioscopy: 
    	-Pachymetry: 
  Drance heme, ever? No
  VF defect: No
)"
}	

::.des::{
SendText Format('
(
#Dry eye syndrome OU
- first noted on {1}
- teary eyes, PEE on exam, MGD OU
- last educated patient on {1} on lid hygiene, warm compresses
- preservative free artificial tears 4-6x daily
)',
FormatTime(, "M/d/yy")
)
}

::.des1::{
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

;********************************************************************* 
::.octm::{
	SendText Format("
(
OCT Mac ({1}):
  OD: FC intact, (-) IRF/SRF
  OS: FC intact, (-) IRF/SRF

 FC = foveal contour, GA = geographic atrophy, 
 IRF = intraretinal fluid, SRF = subretinal fluid

)", 
	FormatTime(, "M/d/yy"))
Send "{up 2}{End}"
}	

::.octr::{
	SendText  Format("
(
OCT RNFL ({1}):
  OD: G, no thinning
  OS: G, no thinning

)", 
	FormatTime(, "M/d/yy"))
Send "{up 2}{Home}{right 5}"	
}	
	

::.hvf::
::.hvf::{
	SendText  Format("
(
HVF 24-2 ({1}):
  OD: reliability, FP %, no defects 
  OS: reliability, FP %, no defects

)", 
FormatTime(, "M/d/yy"))
Send "{up 2}{Home}{right 3}"
}	
	
::.hvf3::{
	SendText  Format("
(
HVF 30-2 ({1}) :
  OD: reliability, FP %, no defects 
  OS: reliability, FP %, no defects

)", 
FormatTime(, "M/d/yy"))
Send "{up 2}{Home}{right 3}"
}	
	
;********************************************************************* 

/*
::.blank::SendRaw {
	SendText "
(

)"
}
*/


/*
--------------------------------------------------------------------------------
FULL NOTE TEMPLATES
--------------------------------------------------------------------------------
*/

/*
Decreased quality of visual function that interferes with desired activities
of living, 
Bothersome glare that interferes with desired activities, 
Inability to drive, 
Symptomatic anisometropia, 
Diminished peripheral vision, 
Lens dislocation into anterior chamber, 
Obscured view of fundus impeding diagnosis/treatment of other eye disease:
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

- Heart stent? Pacemaker?		[ ]No [ ] Yes:
- Difficulty lying flat>30min		[ ]No [ ] Yes:
- Issues with surgery before		[ ]No [ ] Yes:
- Eye surgery history 			[ ]No [ ] Yes:
- H/o of refractive surgery? 	[ ]No [ ] Yes: 
	(PRK/RK/LASIK) 
- Eye trauma history (IFIS)		[ ]No [ ] Yes:	
- On alpha-blocker? 			[ ]No [ ] Yes:
- Oral steroids 			[ ]No [ ] Yes:
- Measured pupil size 	[ ]No [ ] Yes:
	(Malyugin Ring/Hooks?)
 
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

	PAM:
		OD: 
		OS:
	 
	Last MRx (date):
		OD:
		OS: 

	Intraocular Pressure: tonopen  
		OD: 1 mmHg
		OS: 1 mmHg

	SLE:
		L/L: no bleph
		S,C: white and quiet OU
		K: clear, no guttae OU
		I: flat OU, dilates to: 
		AC: deep & quiet
		L: ***4+ NS 
			OD:
			OS:
		AV: clear 
	 
	DFE OU:
		vit: *** PVD
		Disc: flat s/p/f
		CD: 
			OD:  
			OS: 
		Macula: foveal reflex intact
		Vessels: no hemorrhages OU
		Periphery: no holes/tears OU

*********************************************************************
OCT Mac (9/6/24):
  OD: FC intact, (-) IRF/SRF
  OS: FC intact, (-) IRF/SRF

FC = foveal contour, GA = geographic atrophy,
IRF = intraretinal fluid, SRF = subretinal fluid
 
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
- no h/o diabetes, not on GLP-1
- has diabetes, not on GLP-1

Other eye issues
----------------

********************************************************************* 
 
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

*********************************************************************

PATIENT EDUCATION/COUNSELING:

The disease process(es) and implications thoroughly discussed with the patient.
After all the patients questions were answered, the patient voiced an
understanding of and was in agreement with the management plan.

All ocular medications reconciled.

	)"
}

::.biom0::{ 

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
- H/o refractive surgery? 	[ ]No [ ] Yes: 
	(PRK/RK/LASIK) 
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

	PAM:
		OD: 
		OS:

	Intraocular Pressure: tonopen  
		OD: 1 mmHg
		OS: 1 mmHg

	SLE:
		L/L: no bleph
		S,C: white and quiet OU
		K: clear, no guttae OU
		I: flat OU, dilates to: 
		AC: deep & quiet
		L:  
			OD:
			OS:
		AV: clear 
	 
	DFE OU:
		vit: *** PVD
		Disc: flat s/p/f
		CD: 
			OD:  
			OS: 
		Macula: foveal reflex intact
		Vessels: no hemorrhages OU
		Periphery: no holes/tears OU
	 
	Last MRx (date):
		OD:
		OS: 

*********************************************************************
OCT Mac (***):
  OD: FC intact, (-) IRF/SRF
  OS: FC intact, (-) IRF/SRF

FC = foveal contour, GA = geographic atrophy,
IRF = intraretinal fluid, SRF = subretinal fluid
 
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
- no h/o diabetes, not on GLP-1
- has diabetes, not on GLP-1

Other eye issues
----------------

********************************************************************* 
 
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

*********************************************************************

PATIENT EDUCATION/COUNSELING:

The disease process(es) and implications thoroughly discussed with the patient.
After all the patients questions were answered, the patient voiced an
understanding of and was in agreement with the management plan.

All ocular medications reconciled.

	)"
}


::.consult::{
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


