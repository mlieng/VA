
/*
abbrev used: 
- CI-DME (center-involving diabetic macular edema) 
- NPDR (non-proliferative diabetic retinopathy)
- RTC (return to clinic)
- IVA (intravitreal avastin)
*/


ophtho_abbreviations := Map(   
	"cidme","CI-DME(center-involving diabetic macular edema)",
	"iva","IVA (intravitreal avastin)",
	"ive","IVE (intravitreal eylea)",
	"od","OD (RIGHT eye)",
	"os","OS (LEFT eye)",
	"npdr","NPDR (non-proliferative diabetic retinopathy)",
	"pdr","PDR (proliferative diabetic retinopathy"
)

BuildAbbrevKey(INPUT_KEYS){
	INPUT_KEYS := StrReplace(INPUT_KEYS, A_Space, "")
	textboard := "`tsome abbreviations used in this note:"
	failed := "`nFailed to find: "
	Loop parse, INPUT_KEYS, ","
		try
		{
			newstring := StrLower(A_LoopField)
			value := ophtho_abbreviations[newstring]
			textboard .= "`n`t- " value
			;"
		}
		catch
			failed .= A_LoopField ","

	Msgbox textboard, failed 
	A_Clipboard := textboard
}

BuildAbbrevKeyGUI(){
	MyGui := Gui()
	MyGui.Add("Edit", "r5 w300 vMyEdit -WantReturn", "separate abbreviations by commas") ;
	MyGui.Add("Text",, "ex. OS, OD ")
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
	    BuildAbbrevKey(Saved.MyEdit )
	    ;MsgBox MyText
	}	
}

Capslock & q:: BuildAbbrevKeyGUI()
;BuildAbbrevKey("npdr,OD,os")
