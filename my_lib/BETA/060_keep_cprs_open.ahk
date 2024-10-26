#Requires AutoHotkey v2.0+


;CPRS Timeout

;1000 every 1 second
;60000 every 60 seconds

SetTimer keepCPRSopen, 29000


keepCPRSopen(){
    if WinExist("CPRS Timeout"){
        WinActivate
        Send "{Enter}"
        MsgBox "Success. I kept CPRS Open"
    }

    return
}




/*
cprs_window_title := ""
sendMyText(){
    if WinExist("ahk_class TfrmFrame")
        WinActivate
    Send "^s"
    Sleep 500
    Send "^p"
    return
}

Capslock & o::SetTimer sendMyText, 500
Esc::SetTimer sendMyText, 0

#HotIf WinGetClass("A") = "TfrmFrame"




#Enter::
{   
    ;ATTEMPTING TO TURN OFF
    ;cprs_window_title := WinGetTitle("A")
    ;MsgBox cprs_window_title
    SetTimer sendMyText, 500

    ;https://www.autohotkey.com/docs/v2/lib/MsgBox.htm
    Result := MsgBox("I am keeping CPRS open! Would you like to exit?", "Hotel VA Helper","YesNo")
    if Result = "Yes"
        SetTimer sendMyText, 0
    else
        MsgBox "I am keeping CPRS open! Press `Esc` to exit"
    return
}

*/







/*
Press windows+1 to type 'v' 'a' every 1 second
Press Windows+2 to escape pressing va

#1::SetTimer sendMyText, 1000

Esc::
#2::SetTimer sendMyText, 0

sendMyText(){
    Send "v"
    Sleep 1000
    Send "a"
    return
}
*/

/*
;sends a message box while vista is open

#HotIf WinGetClass("A") = "TfrmFrame"
Capslock & i::
{
    MsgBox "Keeping CPRS Open! To exit press 'Esc' key"
    return
}

making a message box GUI
    Result := MsgBox("Keeping CPRS Open! Would you like to exit?", "Hotel VA","YesNo")
    ;WinSetAlwaysOnTop -1, "Hotel VA"
    ;https://www.autohotkey.com/docs/v2/lib/MsgBox.htm
    if Result = "Yes"
        MsgBox "You pressed Yes."
    else
        ;WinSetAlwaysOnTop -1, "Hotel VA"
        
        MsgBox "You pressed No."
    return
}
*/