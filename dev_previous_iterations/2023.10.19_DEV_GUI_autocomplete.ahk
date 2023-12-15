; AHK v2
#INCLUDE _GuiCtlExt.ahk

;sets up global parameters for future GUI

Global g

IL := IL_Create(2) ; image lists for, ListView, Tabs
IL_Add(IL, "shell32.dll", 128)
IL_Add(IL, "shell32.dll", 129)
IL_Add(IL, "shell32.dll", 256)

g := Gui("-MinimizeBox -MaximizeBox","Test")
g.SetFont("s10","Consolas")
g.SetIcon("shell32.dll",20) ; one of the folder icons

g.OnEvent("close",gui_close)
g.OnEvent("escape",gui_close)


list := [
	"ComboBox Item 1",
	"ComboBox Item 2",
	"ComboBox Item 3",
	"ComboBox Item 4",
	"AutoC Test",
	"a",
	"b","c","d","e","f","g","h","i","j","k"]
attendingGui := g.Add("ComboBox","x+10 yp w150 h100 vCB r5 Section",list)
attendingGui.AutoComplete := true
attendingGui.SetSel(1) ; set selection

g.Show()


gui_close(*) {
    ExitApp
}
