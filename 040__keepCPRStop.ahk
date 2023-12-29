#INCLUDE GuiCtlExt.ahk
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

btn := g.AddPicButton("vPicBtn w50 h24","netshell.dll","Icon151 w20 h20","Test") ; 24 x 24
btn.OnEvent("click",gui_events)

btn := g.AddSplitButton("vDropBtn1 xs h32 w80","Test",gui_events) ; here the callback is only for clicking the split down arrow
btn.OnEvent("click",gui_events) ; this is for when you click the "normal" part of the button
btn.SetImg("netshell.dll","Icon151 w20 h20")

btn := g.AddToggleButton("vToggleBtn w80 h32","Test")   ; Icons+Text on a ToggleButton don't seem to work with native AHK gui.
btn.OnEvent("click",gui_events)                         ; Remove button text to get a ToggleButton with an icon.
; btn.SetImg("netshell.dll","Icon151 w20 h20")            ; Maybe a different combo of buttons styles will work?
;'

ctl := g.Add("Tab3","vTabs w210",["Tab1","Tab2"])
ctl.SetImageList(IL)

ctl.UseTab("Tab1")

g.Add("Button","vTabData","Tab Data").OnEvent("click",gui_events)
g.Add("Button","vTabName x+0","Change Tab Name").OnEvent("click",gui_events)
g.Add("Button","vNoTabIcon xm+10 y+0","Remove Icon").OnEvent("click",gui_events)
g.Add("Button","vTabIcon x+0","Add Icon").OnEvent("click",gui_events)


ctl.SetIcon(1,2), ctl.SetIcon(2,1)

ctl.UseTab()

message :="No turned off"
ctl := g.Add("text", "vTextShown", message)

g.show("")

gui_close(*) {
    ExitApp
}

gui_events(ctl, info) {
    Global g
    
    If (ctl.name = "DropBtn1") && IsObject(info) {
        m(info)
    } Else If (ctl.name = "DropBtn1") {
        msgbox "You clicked the button portion of the drop button.`r`n`r`nTry clicking the arrow."
    } Else If (ctl.Name = "PicBtn") {
        msgbox "You clicked the pic btn."
	} Else If (ctl.name = "ToggleBtn") {
        Msgbox "Value: " ctl.Value
        if ctl.Value = 1
            message := "ON"
        	mess := ctl.gui["TextShown"]
        	mess.
        else if ctl.Value = 0
        	message := "OFF"
    } Else If (ctl.name = "TabData") {
        TB := ctl.gui["Tabs"]
        MsgBox "Tab 1`n"
             . "    Name: " TB.GetName(1) "`n"
             . "    Icon: " TB.GetIcon(1) "`n`n"
             . "Tab 2`n"
             . "    Name: " TB.GetName(2) "`n"
             . "    Icon: " TB.GetIcon(2)
             ;"
    } Else If (ctl.name = "TabName") {
        TB := ctl.gui["Tabs"]
        TB.SetName(2,"Name Changed")
    } Else If (ctl.name = "NoTabIcon") {
        TB := ctl.gui["Tabs"]
        TB.SetIcon(2) ; no icon param, or specify 0
    } Else If (ctl.name = "TabIcon") {
        TB := ctl.gui["Tabs"]
        TB.SetIcon(2,1)
}
}

m(coords) {
    me := Menu()
    me.Add("Item 1",m_event)
    me.Add("Item 2",m_event)
    me.Show(coords.x, coords.y)
}

m_event(item, pos, m) {
    msgbox "You clicked: " item
}

dbg(_in) { ; AHK v2
    Loop Parse _in, "`n", "`r"
        OutputDebug "AHK: " A_LoopField
}
