#Persistent  

global keysSent := []

SetTimer, CheckExplorer, 100

CheckExplorer:
WinGet, wnd, List  
Loop %wnd%
{
  id := wnd%A_Index%    
  WinGetClass, class, ahk_id %id%
  didRun := 0

  if (class = "CabinetWClass")
  { 
    idExist := 0
    for index, val in keysSent
    {
      if (val = id) 
        idExist := 1 
    }
      
    if(idExist = 0)  
    {
      keysSent.Push(id)
      ;Sleep 100
      Send {F11}
      ;Sleep 100
      Send {F11}
      Sleep 2000
      if(didRun = 0)  
      {
        WinGet, active_id, ID, A
        WinGetPos, x, y, width, height, ahk_id %active_id%
        SysGet, screen_width, 78
        SysGet, screen_height, 79
        if (x = 0 AND y = 0 AND width = screen_width AND height = screen_height)
        {
          Send {F11}
          didRun := 1
        }
      }
      didRun := 0
    }
  }
}
Return