ActivateFirefox()
{
    prev_title_match_mode := A_TitleMatchMode
    SetTitleMatchMode RegEx

    WinActivate i)mozilla firefox
    Sleep 200

    SetTitleMatchMode % prev_title_match_mode
    return
}

ActivateWindowWithTitle(win_title)
{
    prev_title_match_mode := A_TitleMatchMode
    SetTitleMatchMode RegEx

    WinActivate i)%win_title%
    ; MsgBox i)%win_title%

    SetTitleMatchMode % prev_title_match_mode
    return
}

ClickAt(pos_xy, times = 1)
{
    MouseMove % pos_xy.x, pos_xy.y
    Click %times%
}

MouseGotoCenter()
{
    MouseMove % A_ScreenWidth / 2, A_ScreenHeight / 2
}

FirefoxOpenNewTab(url)
{
    ActivateFirefox()
    Send ^t
    ; Send ^l
    Send %url%
    Send {Enter}

    MouseGotoCenter()
}

; F2::
; {
;     ; ActivateFirefox()
;     ActivateWindowWithTitle("mozilla firefox")

    ; ClickAt({ x: 430, y: 10})

    ; FirefoxOpenNewTab("http://www.abv.bg/")
    ; return

    ; MouseGotoCenter()
; }