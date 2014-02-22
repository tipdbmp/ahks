Class Firefox
{
    activate()
    {
        prev_title_match_mode := A_TitleMatchMode
        SetTitleMatchMode RegEx

        WinActivate i)mozilla firefox
        Sleep 120

        SetTitleMatchMode % prev_title_match_mode
        return
    }

    open_new_tab(url)
    {
        Firefox.activate()

        Send ^t
        ; Send ^l
        Send %url%
        Send {Enter}

        Raty.go_to_center_of_screen()
    }

    open_tab_by_id(tab_id = 1, is_firefox_active = 1, alt_key = 1)
    {
        if (not is_firefox_active)
        {
            Firefox.activate()
        }

        if (tab_id < 1)
        {
            return
        }

        if (tab_id <= 8)
        {
            Firefox._open_tab_by_id_with_shortcut(tab_id, alt_key)
        }
        else if (tab_id <= 15)
        {
            Firefox._open_tab_by_id_with_shortcut(8, alt_key)
            loop % tab_id - 8
            {
                Send ^{Tab}
            }
        }

        return
    }

    _open_tab_by_id_with_shortcut(tab_id, alt_key = 1)
    {
        if (alt_key)
        {
            ; alt + 1|2|...|8
            Send !%tab_id%
        }
        else ; assume ctrl key
        {
            ; ctrl + 1|2|...|8
            Send ^%tab_id%
        }
    }
}

; F2::
; {
    ; Firefox.activate()
    ; Firefox.open_new_tab("https://en.wikipedia.org/")
    ; Firefox.open_tab_by_id(3)
; }
