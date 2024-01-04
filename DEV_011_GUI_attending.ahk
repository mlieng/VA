; AHK v2
#INCLUDE GuiCtlExt.ahk
; #Include _JXON.ahk

Global g
Global Saved
Global choice_resident
Global choice_attending
Global choice_attending_reverse

g := Gui("-MinimizeBox -MaximizeBox","Settings for Hotel VA")
g.SetFont("s10","Consolas")
g.OnEvent("close",gui_close)
g.OnEvent("escape",gui_close)

choice_resident := "RESIDENT NAME"
choice_attending := "ATTENDING NAME"
choice_attending_reverse := "NAME, ATTENDING"

ResidentList := [
	"Althea Alquitran MD",
	"Franklin Jeng MD",
	"Matthew Hogan MD, MPH",
	"Monica K Lieng MD, PhD",
	"Nita Bhat MD",
	"Nicholas Janigian MD",
	"Purvi Shah MD",
	"Palmer Feibelman MD",
	"Shaunt Fereshetian MD"
	]

AttendingList := [
	"Pruzan, Noelle",
	"Murphy, Marjorie"]

g.Add("Text","xm w100", "`n")
;str_res := "Current Name: " choice_resident
g.Add("Text","xm w100", "Current Name: ")
text_res := g.Add("Text","yp w250", choice_resident)

g.Add("Text","xm w100", "Your name:")
CtlRes := g.Add("ComboBox","vCB yp w200 h100 r12 Section",ResidentList)
; CtlRes := g.Add("ComboBox","vCB +10 yp w200 h100 r5 Section",ResidentList)
CtlRes.AutoComplete := true

g.Add("Text","xm w100", "`n")

;str_att := "Current: " choice_attending
g.Add("Text","xm w100", "Current Name: ")
text_att := g.Add("Text","yp w250", choice_attending)

g.Add("Text","xm w100", "Attending Name:") ;xp starts a new row, same location as previous. xm starts new row below all aspects
CtlAtt := g.Add("ComboBox","vCB2 yp w200 h100 r5 Section",AttendingList) ; yp next col
CtlAtt.AutoComplete := true

g.Add("Text","xm w100", "`n")

Btn := g.Add("Button", "default xm", "Save + Exit")  ; xm puts it at the bottom left corner.
Btn.OnEvent("Click", gui_close)

Btn2 := g.Add("Button", "default yp", "Save")  ; yp same row as previous
Btn2.OnEvent("Click", gui_update)



g.show("")

gui_close(*) {
	Saved := g.Submit()
	choice_resident := CtlRes.Text
	;MsgBox("You entered:" choice_resident, "`n" Saved.CB2)
	;MsgBox("You entered:" Saved.CB "`n" Saved.CB2)
	;ListVars
	Return Saved
}

gui_update(*) {
	Saved := g.Submit()
	choice_resident := CtlRes.Text
	choice_attending := CtlAtt.Text

	;updates the choices
	text_res.Text := choice_resident
	text_att.Text := choice_attending

	g.show("")
	Return Saved
}



/*
https://www.autohotkey.com/docs/v2/lib/Gui.htm
MyGui := Gui()
Tab := MyGui.Add("Tab3",, ["First Tab","Second Tab","Third Tab"])
MyGui.Add("CheckBox", "vMyCheckBox", "Sample checkbox") 
Tab.UseTab(2)
MyGui.Add("Radio", "vMyRadio", "Sample radio1")
MyGui.Add("Radio",, "Sample radio2")
Tab.UseTab(3)
MyGui.Add("Edit", "vMyEdit r5")  ; r5 means 5 rows tall.
Tab.UseTab()  ; i.e. subsequently-added controls will not belong to the tab control.


Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
Btn.OnEvent("Click", ProcessUserInput)
MyGui.OnEvent("Close", ProcessUserInput)
MyGui.OnEvent("Escape", ProcessUserInput)
MyGui.Show()

ProcessUserInput(*)
{
    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
    MsgBox("You entered:`n" Saved.MyCheckBox "`n" Saved.MyRadio "`n" Saved.MyEdit)
}
*/