Class Raty
{
    click_at(pos_xy, times = 1)
    {
        MouseMove % pos_xy.x, pos_xy.y
        Click %times%
    }

    go_to_center_of_screen()
    {
        MouseMove % A_ScreenWidth / 2, A_ScreenHeight / 2
    }
}

; F2::
; {
    ; Raty.click_at({ x: 600, y: 600 })
    ; Raty.go_to_center_of_screen()
; }