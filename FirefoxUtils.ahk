; Do NOT use in new scripts unless you want namespace pollution.

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
    MsgBox i)%win_title%

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
    Send %url%
    Send {Enter}

    MouseGotoCenter()
}

_firefox_open_tab_by_id(tab_id, alt_shortcut = 1)
{
    if (alt_shortcut)
    {
        ; alt + 1|2|...|8
        Send !%tab_id%
    }
    else ; assume ctrl shortcut
    {
        ; ctrl + 1|2|...|8
        Send ^%tab_id%
    }
}

FirefoxOpenTabById(tab_id = 1, is_firefox_active = 1, alt_shortcut = 1)
{
    if (not is_firefox_active)
    {
        ActivateFirefox()
    }

    if (tab_id < 1)
    {
        return
    }

    if (tab_id <= 8)
    {
        _firefox_open_tab_by_id(tab_id, alt_shortcut)
    }
    else if (tab_id <= 15)
    {
        _firefox_open_tab_by_id(8, alt_shortcut)
        Loop % tab_id - 8
        {
            Send ^{Tab}
        }
    }

    return
}

; F2::
; {
;     ; ActivateFirefox()
;     ActivateWindowWithTitle("mozilla firefox")

    ; ClickAt({ x: 430, y: 10})

    ; FirefoxOpenNewTab("http://www.abv.bg/")
    ; return

    ; MouseGotoCenter()

    ; FirefoxOpenTabById(1)
; }