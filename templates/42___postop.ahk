::.eer::{
  SendText "
  (
EXAMINATION:
 
VISUAL ACUITY: ()SC ()CC
  OD: 20/ PHNI
  OS: 20/ PHNI
 
Intraocular Pressure: tonopen 
  OD: 1 mmHg
  OS: 1 mmHg

ARx:
  OD:
  OS:

SLE:
  L/L: no bleph
  S,C: post-surgical changes OD, w&q OS
    K: DMF/microcystic edema OD, clear OS 
    I: no NVI 
   AC: tr@@@ cell OD, d&q OS
    L: PCIOL OD, @@@ OS
   AV: clear 
 
DFE OD:
        Vit: PVD@@@
       Disc: flat, pink, distinct
        C/D: 
     Macula: foveal reflex intact
    Vessels: no hemorrhages
  Periphery: no holes/tears
  )"
} 

::.ees::{
  SendText "
  (
EXAMINATION:
 
VISUAL ACUITY: ()SC ()CC
  OD: 20/ PHNI
  OS: 20/ PHNI
 
Intraocular Pressure: tonopen 
  OD: 1 mmHg
  OS: 1 mmHg

ARx:
  OD:
  OS:

SLE:
  L/L: no bleph
  S,C: w&q OD, post-surgical changes OS
    K: clear OD, DMF/microcystic edema OS
    I: no NVI 
   AC: d&q OD, tr@@@ cell OS
    L: @@@ OD, PCIOL OS
   AV: clear 
 
DFE OS:
        Vit: PVD@@@
       Disc: flat, pink, distinct
        C/D: 
     Macula: foveal reflex intact
    Vessels: no hemorrhages
  Periphery: no holes/tears
  )"
} 



::.pod1::{
	SendText "
(
#POD1 s/p CE /PCIOL O*  / /202 (Hogan/D. Rivera)
- excellent VA, IOP wnl
- Patient doing well, no signs of infection, wound seidel negative
- Dc brimonidine
- Start tapering all drops:
        - PF QID
        - Vigamox QID
        - Ketorolac QID
- Gave pt printed instructions for clarification of drops
- Space eye drops by at least 5 minutes
- avoid straining, physical excercise, or other activities for 1 week.
- continue eye shield protection at night for 1 week
- Return precaution were discussed with patient including but not limited to
  worsening pain, vision, floater or flashing light with instruction to call
  Eye Clinic during business hour or on call-physician through VA operator at
  273-7100 after business hour

- Follow up in 1 week for POW1 visit


)"
}	

::.pow1::{
	SendText "
(
#POW1 s/p CE /PCIOL O* //202 (Hogan/D. Rivera)
- Doing well
- excellent VA, IOP wnl
- No signs of infection
- Wounds seidel negative

- Start tapering all drops:
        - PF TID x 1 week, 
          PF BID x 1 week, 
          PF qday x 1 week
        - Decrease Ketorolac QID to BID until runs out
        - STOP vigamox
- Gave pt printed instructions for clarification of drops
- Space eye drops by at least 5 minutes

- Can return to normal activities
- STOP eye shield protection
- Return precaution were discussed with patient including but not limited to
  worsening pain, vision, floater or flashing light with instruction to call
  Eye Clinic during business hour or on call-physician through VA operator at
  273-7100 after business hour

- Follow up in 3 weeks for POM1 visit

 
)"
}	

