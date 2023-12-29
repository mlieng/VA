
/*
See original in 
https://www.autohotkey.com/docs/v2/lib/Menu.htm#Remarks
*/


; Create the popup menu by adding some items to it.
MyMenu := Menu()
MyMenu.Add("Help", MenuHandler)
MyMenu.Add("Settings", MenuHandler)
MyMenu.Add()  ; Add a separator line.
MyMenu.Add("Clean Optometry Note", cleanOptom)

; Create another menu destined to become a submenu of the above menu.
Submenu1 := Menu()
Submenu1.Add("Item A", MenuHandler)
Submenu1.Add("Item B", MenuHandler)

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
MyMenu.Add("My Submenu", Submenu1)

MyMenu.Add()  ; Add a separator line below the submenu.
MyMenu.Add("Item 3", MenuHandler)  ; Add another menu item beneath the submenu.

MenuHandler(Item, *) {
    MsgBox("You selected " Item)
}

;control plus right click
~^RButton::{
    MouseGetPos &xpos, &ypos 
    ;MouseClick, right, xpos, ypos
    MyMenu.Show()  ; i.e. press the Win-Z hotkey to show the menu.
}



;*******************************************************************************
; edit menu
;*******************************************************************************


/*
 place a \ to escape the ()

;replaces the line before OS 
mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n){2}( *)OS", "`n`t`tOS")
; looks ahead  so that don't have to manually put spaces and OS back
mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n){2}(?=(\s+)OS)", "`n")
https://images.datacamp.com/image/upload/v1665049611/Marketing/Blog/Regular_Expressions_Cheat_Sheet.pdfhttps://www.rexegg.com/regex-quickstart.html
*/

cleanOptom(Item, *){
 cleanOptom2
}

cleanOptom2(){
    Send "^C"
    ClipWait(2)
    mytext := A_Clipboard
    ;mytext :=  EditGetSelectedText()


    mytext2 := StrReplace(mytext, "`r`n`n", "")
    mytext2 := RegExReplace(mytext2, "m)\( \) White and Quiet(\r\n|\r|\n)\s+", "") 
    mytext2 := RegExReplace(mytext2, "m)\( \) Clear(\r\n|\r|\n)\s+", "") 
    mytext2 := RegExReplace(mytext2, "m)\( \) Normal(\r\n|\r|\n)\s+", "") 
    ;replaces Other and deletes the following line
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)  +\( \) Other:(\r\n|\r|\n)", "")
   
    ; deletes empty line before OS
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)OS)", "`n")

    ; delete extra line before OD
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.)(.*))", "`n")   
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)(Vitreous|Disc\sMargin|Cup|Rim|Macula|Vasc|Background|Periphery))(.*)", "`n")   

    ; add extra line before OD
    ;mytext2 := RegExReplace(mytext2, "m)(\n)(?=(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.))", "`n`n")   
    ;mytext2 := RegExReplace(mytext2, "m)(\n)(?=(\s+)(Vitreous|Disc\sMargin|Cup|Rim|Macula|Vasc|Background|Periphery))", "`n`n") 

    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)OS)", "`n")

    ;to delete the fundus exam part
    mytext2 := RegExReplace(mytext2, "m)\s+\( \) Undilated", "")
        ;deletes from "reason on + dilated on next line "
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+Reason(.*)[(\r\n|\r|\n)\s*(.*)]", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)Dilated with(.*)", "") 
    mytext2 := RegExReplace(mytext2, "\s+Time(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\(\w\) 90 D(.*)", "   +90D") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\( \) 90 D(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\(\w\) 78 D(.*)", "   +78D") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\( \) 78 D(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\(\w\) 20 D(.*)", "   +20D") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\( \) 20 D(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)Direct(.*)", "") 
    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)Other:(.*)", "") 
    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+\(\w\) 90 D]", "90D")
    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+\( \)\s90(.*)]", "")
    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+\(\w\)\s78(.*)]", "78D")
    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+\( \)\s78(.*)]", "")
    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+\(\w\)\s20(.*)]", "20D")
    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+\( \)\s20(.*)]", "")

    mytext2 := StrReplace(mytext2, "Tonometry", "`nTonometry")
    ;replaces any extra space before "OD with just one tab"
    ;mytext2 := RegExReplace(mytext2, "^\s+(.*)OD", "`t$1OD")


    ; opens and pastes in notepad
    ;if WinExist("Untitled - Notepad")
    ;    WinActivate ;
    ;else 
    ;    Run "notepad.exe"
    ;    WinWait(2)
    ;    WinActivate "Untitled - Notepad"

    ;ShowStart("", "notepad.exe")
    
    ;WinActivate("Untitled - Notepad")

    A_Clipboard := mytext2
    Send "^V"
}

CapsLock & z:: cleanOptom2

/*
bajdljfsljdfs

sdkfjlskdjflsd

lskdjflsjdf
*/


ShowStart(title, exe)
{
if WinExist(title)
    WinActivate ; Use the window found by WinExist.
else
    Run exe
    WinActivate(title)
}