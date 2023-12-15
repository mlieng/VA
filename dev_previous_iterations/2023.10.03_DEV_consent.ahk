
/*

FillConsent()
{
	WinActivate "Informed Consent"
	Send "{Tab}"

	SendWait("Lieng")
	Sleep 1000

	Send "{Tab}"
	Send "{Enter}"
	Send "{Tab 3}"
	;Send "{Tab}"
	;Send "{Tab}"
	
	SendDownUp()
	;Send "{Down}"
	;Send "{Up}"
	Send "{Tab}"

}
early version

*/


/*

;will need to add own name0606

active window Informed Consent - Work - MIcrosoft Edge
tab
Lieng
wait
tab (to add button)
enter

tab x 3
down
up

tab 
loporchio
wait
*/



/*
Loporchio
Greenberg
*/

#HotIf GetKeyState("Shift")
	Capslock & c:: FillConsent("Loporchio")

#HotIf FindVarString_Loose(WinGetTitle("A"), "Informed Consent")
	Capslock & c:: FillConsent("Loporchio")

#HotIf

FillConsent(attending)
{
	WinActivate "Informed Consent"
	Send "{Tab}"

	SendWait("Lieng")
	Sleep 1000
	Send "{Tab}"
	Send "{Enter}"

	Send "{Tab 3}"
	
	SendDownUp() ;under supervision of attending
	Send "{Tab}"

	SendWait(attending)
	Sleep 1000
	Send "{Down 2}"
	Send "{Tab}"
	Send "{Enter}"

	Send "{Tab 3}"

	SendDownUpDown() ; chooses 'no' for other practitioner

	Send "{Tab}"	
	SendDownUp() ; chooses "yes decision making capacity"

	Send "{Tab}"	
	SendDownUp() ; chooses "no sedation"

	Send "{Tab 2}"
	SendDownUp() ; chooses "no high risk for cardiac arrest "

	Send "{Tab 4}"
	InjChoiceText := EyeInjSideGui()
	;EyeInjSideGui()
	;WinActivate "Informed Consent"
	;Send "{Ctrl}v"



}


;********************************************************************* 
; added 10/24/2023


#HotIf FindVarString_Loose(WinGetTitle("A"), "Informed Consent")
Capslock & s::
{
MouseClick "left", 98, 314

MouseClick "left", 38, 380 ;verify

MouseClick "left", 40, 492
MouseClick "left", 41, 513
MouseClick "left", 42, 538
MouseClick "left", 39, 555

MouseClick "left", 36, 628

Send "+{Down}" ;scroll down

;MouseClick "left", 41, 490
;MouseClick "left", 43, 512
;MouseClick "left", 40, 532
;MouseClick "left", 40, 553
;MouseClick "left", 38, 570
;MouseClick "left", 39, 611
;MouseClick "left", 42, 630

Send "+{Down}" ;scroll down
Send "+{Down}" ;scroll down
; put in laterality


}
#HotIf


SendWait(string)
	{
		Loop parse string
			{
				Send A_LoopField
				Sleep 50			
			}

	}
SendDownUp()
	{
	Send "{Down}"
	Sleep 50
	Send "{Up}"	
	Sleep 50	
	}

SendDownUpDown()
	{
	Send "{Down}"
	Sleep 50
	Send "{Up}"
	Sleep 50
	Send "{Down}"		
	Sleep 50
	}


EyeInjSide := Array(
	{abbr:"OD, od, r, right", name:"RIGHT Eye Injection"},
	{abbr:"OS, os, l, left", name:"LEFT Eye Injection"},
	{abbr:"OU, ou, b, botH", name:"BOTH - RIGHT and LEFT Eye Injections"}
)


/*

;Capslock & q::EyeInjSideGui()

; working on this!!!

EyeInjSideGui()
{
	MyGui := Gui()
	
	AbbrNameGuide := PrintAbbrNames(EyeInjSide)
	
	ArrNames := GetNames(EyeInjSide)
	ArrAbbr := GetAbbr(EyeInjSide)
	MyGui.Add("ComboBox", "r3 w350 vInjSideChoice", ArrNames)

	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)

	MyGui.Add("Text",,AbbrNameGuide)

	MyGui.Show()

		ProcessUserInput(*)
		{
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    ;MsgBox("You entered:`n '" Saved.InjSideChoice "'")
	    A_Clipboard := Saved.InjSideChoice
	    return A_Clipboard

		}	
}



*/





/*
--------------------------------------------------------------------------------
 already moved to main file
--------------------------------------------------------------------------------
*/




PrintArray(MyArray)
	{
		MyText := ""
		Loop MyArray.length
			MyText .= "`n" MyArray[A_Index]
			;
		MsgBox MyText
	}

GetNames(Array_of_Maps)
	{
		NewArray := []
		Loop Array_of_Maps.Length
			{
			Item := Array_of_Maps[A_Index]
			NewArray.Push(Item.name)
			}
		return NewArray
	}

GetAbbr(Array_of_Maps)
	{
		NewArray := []
		Loop Array_of_Maps.Length
			{
			Item := Array_of_Maps[A_Index]
			NewArray.Push(Item.abbr)
			}
		return NewArray
	}

PrintAbbrNames(ArrayOfOptions)
	{
		/*
		example: textboard := PrintAbbrNames(ImagingOptions)

			Abbr					Full Name
			-----					---------
			 B, BLAH, 2.blah  		full name
			 2, 2.BLAH, 3.blah  	full name 2


		*/
	textboard := ""
	ArrayOfNames := GetNames(ArrayOfOptions)
	ArrayOfAbbr := GetAbbr(ArrayOfOptions)
	
	textboard := "Abbr`t`tFull Name`n-----`t`t---------"
	Loop ArrayOfNames.Length
		textboard .= "`n " ArrayOfAbbr[A_Index] "  `t" ArrayOfNames[A_Index]
		
	
	return textboard	
	}



FindVarString_Strict(haystack, needle)
	{
		/*

			 'blah' 		 is in: 	BLAH, blah
			 '2' 			 is in: 	2, 2.BLAH, 3.blah

			 'blah' 	 was not is in: 	2, 2.BLAH, 3.blah

 		*/

		NewString := StrReplace(haystack, ",", "|")
		NewString := StrReplace(NewString, A_Space, "")
		boolVar := false
		if needle ~= NewString
			boolVar := true
		else
			boolVar := false
		return boolVar	
	}

FindVarString_Loose(haystack, needle)
	{
		/*
			 'blah' 		 is in: 	B, BLAH, 2.blah
			 'blah' 		 is in: 	2, 2.BLAH, 3.blah
			 '2' 			 is in: 	B, BLAH, 2.blah
			 '2' 			 is in: 	2, 2.BLAH, 3.blah
			in InStr(), the _false_ makes it caps insensitive
		*/
		boolVar := false
		if InStr(haystack, needle, false) 
			boolVar := true
		else
			boolVar := false
		return boolVar	
	}
