#include Raty.ahk

Class Firefox
{
    activate()
    {
        prev_title_match_mode := A_TitleMatchMode
        SetTitleMatchMode RegEx

        WinActivate i)mozilla firefox
        Sleep 120

        SetTitleMatchMode % prev_title_match_mode

        return Firefox
    }

    open_new_tab(url)
    {
        Firefox.activate()

        Send ^t
        ; Send ^l
        Send %url%
        Send {Enter}

        Raty.go_to_center_of_screen()

        return Firefox
    }

    open_tab_with_id(tab_id = 1, is_firefox_active = 1, alt_key = 1)
    {
        if (not is_firefox_active)
        {
            Firefox.activate()
        }

        if (tab_id < 1)
        {
            return Firefox
        }

        if (tab_id <= 8)
        {
            Firefox._open_tab_with_id_using_shortcut(tab_id, alt_key)
        }
        else if (tab_id <= 15)
        {
            Firefox._open_tab_with_id_using_shortcut(8, alt_key)
            loop % tab_id - 8
            {
                Send ^{Tab}
            }
        }

        return Firefox
    }

    _open_tab_with_id_using_shortcut(tab_id, alt_key = 1)
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

    click_button($) ; Int :$x, Int :$y
    {
        Raty.click_at($)
    }

    fill_field($) ; Point :$at, Str :$value
    {
        Raty.click_at($.at)

        Firefox.clear_field($)
        Send % $.value

        return Firefox
    }

    clear_field($) ; Point :$at
    {
        if $.at
        {
            Raty.click_at($.at)
            Send ^a{Backspace}
        }

        return Firefox
    }

    go_to_next_field()
    {
        Send {Tab}
        return Firefox
    }

    enter()
    {
        Send {Enter}
        return Firefox
    }

    drop_down_list($) ; Point :$at, Int :$select_item
    {
        Raty.click_at($.at)

        ; go to the first item in the list
        Send {Home}

        if $.select_item
        {
            loop % $.select_item - 1
            {
                Send {Down}
            }
            Send {Enter}
        }

        return Firefox
    }

    ; click_at(pos_xy) ; Point pos_xy
    click_at(pos_xy) ; Point pos_xy
    {
        Raty.click_at(pos_xy)
        return Firefox
    }

    go_to_start_of_page()
    {
        Send {Home}
        return Firefox
    }

    sleep(miliseconds)
    {
        Sleep miliseconds
        return Firefox
    }

    wait_win(window_title)
    {
        SetTitleMatchMode RegEx
        WinWait i)%window_title%
        ; MsgBox %window_title%

        return Firefox
    }
}

; F2::
; {
    ; Firefox.activate()
    ; Firefox.open_new_tab("https://en.wikipedia.org/")
    ; Firefox.open_tab_by_id(3)

    ; Firefox
    ; .activate()
    ; .open_tab_by_id(4)
    ; .sleep(1000)
    ; .open_tab_by_id(2)


    ; Firefox
    ; .fill_field({ at: { x: 666, y: 340 }, value: "pracacc000" })
    ; .go_to_next_field()
    ; .fill_field({ value: "pracpass000" })
    ; .enter()

    ; Raty.go_to_center_of_screen()

    ; Firefox
    ; .drop_down_list({ at: { x: 810, y: 12 }, select_item: 35 })
    ; .go_to_next_field()
    ; .enter()
; }
