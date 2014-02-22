Class Winy
{
    activate_with_title_matching(win_title)
    {
        prev_title_match_mode := A_TitleMatchMode
        SetTitleMatchMode RegEx

        WinActivate i)%win_title%
        ; Sleep 120
        ; MsgBox i)%win_title%

        SetTitleMatchMode % prev_title_match_mode
        return
    }
}

; F2::
; {
    ; Winy.activate_with_title_matching("mozilla firefox")
; }