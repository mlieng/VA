

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
	Send "{Click 482 81}"	; click unclick modifier to highlight area
	Send "{Click 482 81}" 	; 
	Send "{r}{i}"			; types 'r i to get right underneath resident teaching service'
	Send "{up}"				; highlights GC/resident teaching
	Send "{Click 452 236}" 	;clicks resident teaching
}

click_newPatient(){
	Send "{Click 70 73}" ; click new patient
	Send "{Click 196 94}" ;click med complex
	click_ResTeachingModifier()
}

click_addPrimary(){
	Send "{tab}" 	; highlights 'Add' to add provider
	Send "{enter}"
	Send "{tab 2}" 	;highlights 'Primary' to make attending the primary provider
	Send "{enter}"		
	;the equivalent
	;Send "{Click 369 490}"  ;clicks 'Add' to add provider
	;Send "{Click 369 565}" ;clicks 'Primary' to make attending the primary provider
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
	Send "{Click 88 55}" ; click established patient
	;Send "{Click 222 69}" ;click low complex
	Send "{Click 182 86}"	;click med complex
	;Send "{Click 196 94}" 	;click high complex
	click_ResTeachingModifier()

	;add attending
	;-------------
	choice_attending_reverse2 := StrReplace(choice_attending_reverse, A_Space,"")
	Send "{Click 49 461}"	; clicks textbox for available providers

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
		click_addPrimary()

	}
	else if choice_attending_reverse~="Murphy"{
		;Msgbox("murphy")
		SendWait(choice_attending_reverse2)
		Send "{Tab}{Enter}"
		WinWait "Similar Providers"
		Send "{Tab 2} {Enter}"
		Sleep 500
		click_addPrimary()
	}
	else {
		SendWait(choice_attending_reverse2)
		Sleep 500
		click_addPrimary()
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
		Send "{Click 62 42}"	 	; click 'Image/Photos'
		Send "{Click 226 71}"		; click 'OCT Mac'
		Send "{Click 86 137}"		; click 'Proc-inj vegf'

		; need to program in the different procedure injections
		;Sleep 5000

		Send "{Click 79 11}"	; click 'Diagnoses'
		Send "{Click 80 215}"	; click 'Retina'
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
		Send "{Click 19 15}"		; click 'Visit Type'
		Send "{Click 43 45}"		; click 'Eye codes'
		Send "{Click 156 97}"		;click post-op follow-up visit 
		click_ResTeachingModifier()

		MouseClick "left", 71, 9 	; click 'Diagnoses'
		Send "{Click 117 151}"		; click 'LENS/CORNEA/POSTOP'
		Send "{Click 327 57}"		;click unclick random dx to highlight area
		Send "{Click 327 57}"
		Send "{PgDn 2}"				;scroll down
		Send "{Click 331 109}" 		;pseudophakia
		;MouseClick "left", 265, 340 ;   click 'post op form right eye'
		;MouseClick "left", 267, 354 ;   click 'post op form left eye'
		}
	if enc_title~="OPHTHALMOLOGY 2"{
		MouseClick "left", 168, 9	; click 'Procedures'
		MouseClick "left", 61, 42   ; 	click 'Image/Photos'
		MouseClick "left", 216, 83  ; 	click 'OCT Mac'

		MouseClick "left", 71, 9 	; click 'Diagnoses'
		MouseClick "left", 101, 217	; 	click 'Retina-Macula'
	}



}


