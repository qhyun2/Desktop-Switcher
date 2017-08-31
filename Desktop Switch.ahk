#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, New,, SWITCH
OnMessage(0x5555, "func")

desktopcount := 3
currentdesktop := 1

#N::NewDesktop()
#M::CloseDesktop()
#'::MsgBox Desktop Count = %desktopcount%`nCurrent Desktop = %currentdesktop%
#`;::InputState()

func(wParam, lParam, Msg){
	SwitchDesktop()
}

InputState()
{
	global desktopcount
    	global currentdesktop

	currentdesktop := 1
	
	InputBox, count, Desktop Count
	if (!ErrorLevel) {
		if (count == -1) {
			MsgBox Reloading
			Reload
		}
		else
		{
    		desktopcount := count
		}
	}
}

SwitchDesktop()
{

    global desktopcount
    global currentdesktop

    if (currentdesktop = desktopcount)
    {
		Loop %desktopcount%
        {
        Send ^#{Left}
	Sleep, 1
        }
		currentdesktop := 1
    }
    else
    {
        currentdesktop := currentdesktop + 1
        Send ^#{Right}  
    }
}

NewDesktop()
{
    global desktopcount
    global currentdesktop
    if (desktopcount > 9)
    {
        return
    }
    desktopcount ++
    currentdesktop := desktopcount
    Send ^#d
}

CloseDesktop()
{
    global desktopcount
    global currentdesktop
    desktopcount --
    if (currentdesktop != 1)
    {
        currentdesktop --
    }
    Send ^#{f4}
}