Class Raty
{
    click_at(pos_xy, times = 1) ; Point pos_xy, Int times
    {
        if pos_xy
        {
            MouseMove % pos_xy.x, pos_xy.y
            Click %times%
        }

        return Raty
    }

    move(pos_xy) ; Point pos_xy
    {
        MouseMove % pos_xy.x, pos_xy.y

        return Raty
    }

    go_to_center_of_screen()
    {
        MouseMove % A_ScreenWidth / 2, A_ScreenHeight / 2

        return Raty
    }

    sleep(miliseconds) ; Int miliseconds
    {
        Sleep miliseconds

        return Raty
    }
}

; F2::
; {
    ; Raty.click_at({ x: 600, y: 600 })
    ; Raty.go_to_center_of_screen()
; }