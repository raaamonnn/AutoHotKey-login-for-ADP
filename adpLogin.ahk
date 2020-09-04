; #Persistent
; SetTimer, beginExecute, 60000
; Return

Login()
{
    url         :=  "https://workforcenow.adp.com/workforcenow/login.html"
    userID      :=  "XXX"
    userPW      :=  "XXX"

    ie          :=  ComObjCreate("InternetExplorer.Application")
    ie.Visible  :=  true
    ie.Navigate(url)

    while ie.ReadyState != 4
        Sleep, 2000

    ; User ID
    ie.document.getElementByID("user_id").fireEvent("onclick")
    ie.document.getElementByID("user_id").value := userID
    ie.document.getElementByID("user_id").focus()
    ie.document.getElementByID("user_id").fireEvent("onchange")
    Sleep, 2000

    ; User PW
    ie.document.getElementByID("password").fireEvent("onclick")
    ie.document.getElementByID("password").value := userPW
    ie.document.getElementByID("password").focus()
    ie.document.getElementByID("password").fireEvent("onchange")
    Sleep, 2000

    ie.document.getElementByID("subBtn").removeAttribute("disabled")
    ie.document.getElementByID("subBtn").Click()
    Sleep, 6000
}

Login()

beginExecute:
FormatTime, timeToBuild,,HHmm
If timeToBuild  = 755 ;7:55 am
{
    Login()
    ;Click Clock In
    Sleep, 6000
    Click,632,338 ;clockin
    Sleep, 9000
    Click,768,11 ;close window
}

Else If timeToBuild  = 1155 ;11:55 am
{
    Login()
    ;Click Take Break
    Sleep, 6000
    Click,632,415 ;mealout
    Sleep, 9000
    Click,768,11 ;close window
}

Else If timeToBuild  = 1225 ;12:25 pm
{
    Login()
    ;Click Stop Break
    Sleep, 6000
    Click,632,456 ;mealreturn
    Sleep, 9000
    Click,768,11 ;close window
}

Else If timeToBuild  = 1625 ;16:25 pm
{
    Login()
    ;Click Log Off
    Sleep, 6000
    Click,632,374 ;clockout
    Sleep, 9000
    Click,768,11 ;close window
}




; Click,632,500 ;timecard