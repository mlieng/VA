

;choice_attending_reverse := "ATTENDING"


;else if (choice_attending_reverse ~= "Paul|Murphy")
;	MsgBox("Paul or Murphy")





; https://www.autohotkey.com/docs/v2/howto/WriteHotkeys.htm
;#HotIf GetKeyState("Shift")
;Capslock & i:: ImagingGUI()


/*
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


;#Hotif FindVarString_Loose(WinGetTitle("A"), "Encounter Form for ESQ-SP-OPHTHALMO PROCEDRE 2")
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


#Hotif  FindVarString_Loose(WinGetTitle("A"), "Encounter Form")
	;global choice_attending_reverse
	^e::{
		if FindVarString_Loose(WinGetTitle("A"), "ESQ-SP-OPHTHALMOLOGY 2R ")
			Encounter2R(choice_attending_reverse)
	}
#Hotif

*/


click_ResTeachingModifier(){
	Send "{Click 636 47}" ; click unclick modifier
	Send "{Click 636 47}" ; 
	Send "{r}{i}"
	Send "{Click 576, 162}"
}

click_newPatient(){
	Send "{Click 70 73}" ; click new patient
	Send "{Click 196 94}" ;click med complex
	click_ResTeachingModifier()
}


#Hotif FindVarString_Loose(WinGetTitle("A"), "Encounter Form")

^r::click_ResTeachingModifier()
^n::click_newPatient()

^e::{


	WinMove ,, 766, 648, "A"
	
	; Visit Type
	; --------------------------------------------------------------------------

	Send "{Click 21 8}" 	;click 'Visit Type' tab

	;clicks "Not service connected"
	;---------------------------
	y_coords :=[250,270,290,310,330,350,370,390]
	for y in y_coords
		MouseClick "left", 477, y 	; goes through all checkboxes


	; add type of visit eye code
	;--------------------------
	; established patient
	Send "{Click 117 59}"
	;Send "{Click 196 77}" ;click low complex
	Send "{Click 196 94}" ;click med complex
	click_ResTeachingModifier()

	;add attending
	;-------------
	choice_attending_reverse2 := StrReplace(choice_attending_reverse, A_Space,"")
	Send "{Click 49 429}"	; clicks textbox for available providers

	if choice_attending_reverse="NAME"{
		MsgBox("default ATTENDING")
	} 
	else if choice_attending_reverse~="Paul,"{
		;MsgBox("paul")
		SendWait(choice_attending_reverse2)
		Send "{Tab}{Enter}"
		WinWait "Similar Providers"
		Send "{Down} {Tab} {Enter}"
		Sleep 500
		Send "{Click 400 466}"  ;clicks 'Add' to add provider
		Send "{Click 400 557}" ;clicks 'Primary' to make attending the primary provider


	}
	else if choice_attending_reverse~="Murphy"{
		;Msgbox("murphy")
		SendWait(choice_attending_reverse2)
		Send "{Tab}{Enter}"
		WinWait "Similar Providers"
		Send "{Tab 2} {Enter}"
		Sleep 500
		Send "{Click 400 466}"  ;clicks 'Add' to add provider
		Send "{Click 400 557}" ;clicks 'Primary' to make attending the primary provider
	}
	else {
		SendWait(choice_attending_reverse2)
		Sleep 500
		Send "{Click 400 466}"  ;clicks 'Add' to add provider
		Send "{Click 400 557}" ;clicks 'Primary' to make attending the primary provider
	}


	;encounter-type specific
	;---------------------------------------------------------------------------

	enc_title := StrUpper(WinGetTitle("A"))

	if enc_title~="OPHTHALMOLOGY 3"{

		Send "{Click 71 9}"  	; click 'Diagnoses'
		Send "{Click 84 174}"   ; click 'GLAUCOMA open angle'
		Send "{Click 365 188}"	; 	click mod right eye
		Send "{Click 365 207}"	; 	click mod left eye
		
		Send "{Click 168 9}" 	; click 'Procedures'
		Send "{Click 91 59}"    ; click 'Test-Glaucoma'
		Send "{Click 281 52}"   ; 	click 'OCT RNFL'
		Send "{Click 273 127}"  ; 	click "VF"

	}

	if enc_title~="GLAUCOMA"{

		Send "{Click 71 9}"  	; click 'Diagnoses'
		Send "{Click 84 174}"   ; click 'GLAUCOMA open angle'
		Send "{Click 365 188}"	; 	click mod right eye
		Send "{Click 365 207}"	; 	click mod left eye
		
		Send "{Click 168 9}" 	; click 'Procedures'
		Send "{Click 91 59}"    ; click 'Test-Glaucoma'
		Send "{Click 281 52}"   ; 	click 'OCT RNFL'
		Send "{Click 273 127}"  ; 	click "VF"

	}

	if enc_title~="BIOMETRY"{
		MouseClick "left", 168, 9	; click 'Procedures'
		MouseClick "left", 91, 46 ; click 'Image/Photos'
		MouseClick "left", 218, 82 ; click 'OCT Mac'

		MouseClick "left", 71, 9 	; click 'Diagnoses'
		MouseClick "left", 103, 153 ; click 'LENS/CORNEA/POSTOP'
		MouseClick "left", 266, 95 	; click "Cataract nuclear bilateral"

	}
	if enc_title~="PROCEDURE 2"{
		MouseClick "left", 168, 9	; click 'Procedures'
		MouseClick "left",  91, 125 ; click 'InjectionCodes'
		MouseClick "left", 216, 34 ; click 'Intravitreal Eye Injection'
		MouseClick "left", 91, 46 ; click 'Image/Photos'
		MouseClick "left", 218, 82 ; click 'OCT Mac'
		;MouseClick "left", 122, 136	; click 'Proc-inj vegf'

		; need to program in the different procedure injections
		;Sleep 5000

		MouseClick "left", 71, 9 	; click 'Diagnoses'
		MouseClick "left", 101, 217	; click 'Retina'
	}
	if enc_title~="PREOP|PRE-OP" and enc_title~="3" {

		MouseClick "left", 168, 9	; click 'Procedures'
		;MouseClick "left", 85, 46   ; click 'Image/Photos'
		MouseClick "left", 57, 84   ; click 'test-other'
		MouseClick "left", 216, 99  ; click "ophthalmic biometry"

		MouseClick "left", 71, 9 	; click 'Diagnoses'
		MouseClick "left", 103, 153 ; click 'LENS/CORNEA/POSTOP'
		MouseClick "left", 264, 244 ;   click 'combined form right eye'
		MouseClick "left", 267, 258 ;   click 'combined form left eye'

	}
	if enc_title~="POSTOP|POST-OP" and enc_title~="3"{
		MouseClick "left", 33, 8 	; click 'Visit Type'
		MouseClick "left", 30, 46 	; click 'Eye codes'
		MouseClick "left", 195, 111 ; click post-op follow-up visit 
		click_ResTeachingModifier()

		MouseClick "left", 71, 9 	; click 'Diagnoses'
		MouseClick "left", 103, 153 ; click 'LENS/CORNEA/POSTOP'
		MouseClick "left", 265, 340 ;   click 'post op form right eye'
		MouseClick "left", 267, 354 ;   click 'post op form left eye'
		}
	if enc_title~="OPHTHALMOLOGY 2"{
		MouseClick "left", 168, 9	; click 'Procedures'
		MouseClick "left", 61, 42   ; 	click 'Image/Photos'
		MouseClick "left", 216, 83  ; 	click 'OCT Mac'

		MouseClick "left", 71, 9 	; click 'Diagnoses'
		MouseClick "left", 101, 217	; 	click 'Retina-Macula'
	}



}




/*


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


Encounter2R(choice_attending_reverse)
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

	MouseClick "left", 168, 9	; click 'Procedures'
	MouseClick "left", 61, 42   ; 	click 'Image/Photos'
	MouseClick "left", 216, 83  ; 	click 'OCT Mac'

	MouseClick "left", 71, 9 	; click 'Diagnoses'
	MouseClick "left", 101, 217	; 	click 'Retina-Macula'

}


;T2 diabetes without complications 
; procedures: diabetic eye exam bilateral

*/





/*
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
	MouseClick "left", 91, 59   ; click 'Test-Glaucoma'
	MouseClick "left", 281, 52  ;	click 'OCT RNFL'
	MouseClick "left", 273, 127 ; 	click "VF"


}

*/
