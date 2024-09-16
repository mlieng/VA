; AHK v2
#INCLUDE GuiCtlExt.ahk
; #Include _JXON.ahk

;these create saved

Global Saved
Global clinic_choice


ClinicList := [
	"Cornea: Esq Sp Opht Cornea",
	"Biometry: Esq Sp Opht Biometry",
	"Glauc: Esq Sp Opht Glaucoma",
	"Glaucoma: Esq Sp Opht Glaucoma",
	"Surgical Glaucoma: Esq Sp Ophth Surgical Glaucoma",
	"Econsult: Esq Sp Ophthal Econsult",
	"tbi: Esq Sp Ophthalm Con M Tbi",
	"Post-op: Esq Sp Ophthalm Postop 3",
	"Pre-op: Esq Sp Ophthalmo Preop 3",
	"Proc2: Esq Sp Ophthalmo Procedure 2",
	"Ret: Esq-Sp-Ophthalmo Res Ret",
	"Laser: Esq Sp Ophthalmology Laser",
	"Op1n: Esq Sp Ophthalmology 1n",
	"Op2r: Esq Sp Ophthalmology 2",
	"Op2rg: Esq Sp Ophthalmology 2rg",
	"Op3: Esq Sp Ophthalmology 3",
	"Plastic: Esq Sp Ophthalmology Plast I",
	"Plastproc: Esq Sp Oph Plastics Procedures",
	"Pproc: Esq Sp Oph Plastics Procedures",
	"Uveitis: Esq Sp Ophthalmology Uveitis",

	"Or: Pro-Amb Surg Or Non-Count",
	"Pro: Pro-Amb Surg Or Non-Count",
	"Glasses: Esq Sp Optom Glass Adjust",
	"Optom: Esq Sp Optometry General 1",
	"Optometry: Esq Sp Optometry New 1",
	"Refr: Esq Sp Optometry Refraction",
	"ORet: Esq Sp Optometry Retina",
	"Low: Esq Visual Imp Low Vision",

	"1n: Esq Sp Ophthalmology 1n",
	"2r: Esq Sp Ophthalmology 2r",
	"2rg: Esq Sp Ophthalmology 2rg",
	"3: Esq Sp Ophthalmology 3",
	]

clinic_chooser()
{
	;Global clinicGUI

	clinicGUI:= Gui("-MinimizeBox -MaximizeBox","Note")
	clinicGUI.SetFont("s10","Consolas")
	clinicGUI.OnEvent("close",gui_close)
	clinicGUI.OnEvent("escape",gui_close)

	clinicGUI.Add("Text",, "Clinic name:")
	CtlRes := clinicGUI.Add("ComboBox","vCB yp w300 h100 r30 Section",ClinicList)
	; CtlRes := clinicGUI.Add("ComboBox","vCB +10 yp w200 h100 r30 Section",ClinicList)
	CtlRes.AutoComplete := true
	Btn := clinicGUI.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", gui_close)


	clinicGUI.show("")

	gui_close(*) {

		Saved := clinicGUI.Submit()
		choice_clinic :=CtlRes.Text
		choice_clinic := StrSplit(choice_clinic, ": ")
		choice_clinic := choice_clinic[2]
		;MsgBox("You entered:" choice_clinic, "`n" Saved.CB)
		;MsgBox("You entered:" Saved.CB)
		;MsgBox "You entered " word_array[2]
		;ListVars
		A_Clipboard := choice_clinic
		Send A_Clipboard
	}
}
;clinic_chooser
