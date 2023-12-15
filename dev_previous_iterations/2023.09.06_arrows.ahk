SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
 
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
SetCapsLockState, AlwaysOff
 
CapsLock & i::
       if getkeystate("Shift") = 0
                        {
                        SendPlay,{Up}
                        }
       else           {
               SendPlay,+{Up}
                        }
return
 
CapsLock & l::
       if getkeystate("Shift") = 0
               Send,{Right}
       else
               Send,+{Right}
return
 
CapsLock & j::
       if getkeystate("Shift") = 0
               Send,{Left}
       else
               Send,+{Left}
return
 
CapsLock & k::
       if getkeystate("Shift") = 0
               SendPlay,{Down}
       else
               SendPlay,+{Down}
return
 
CapsLock & ,::
       if getkeystate("Shift") = 0
               Send,^{Down}
       else
               Send,+^{Down}
return
 
CapsLock & 8::
       if getkeystate("Shift") = 0
               Send,^{Up}
       else
               Send,+^{Up}
return
 
CapsLock & u::
       if getkeystate("Shift") = 0
               Send,{Home}
       else
               Send,+{Home}
return
 
CapsLock & o::
       if getkeystate("Shift") = 0
               Send,{End}
       else
               Send,+{End}
return
 
CapsLock & H::
       if getkeystate("Shift") = 0
               Send,^{Left}
       else
               Send,+^{Left}
return
 
       CapsLock & SC027::                                  ;has to be changed (depending on the keyboard-layout)
               if getkeystate("Shift") = 0
                       Send,^{Right}
               else
                       Send,+^{Right}
       return
 
CapsLock & BS::Send,{Del}


CapsLock & i::
       if GetKeyState("Shift", "0"){
                        SendPlay "Up"
                        }
       else           {
               SendPlay "+Up"
                        }
return