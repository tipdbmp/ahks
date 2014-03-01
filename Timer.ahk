
class _StopTimer
{
    timer_id := ""

    __New(p_timer_id)
    {
        this.timer_id := p_timer_id
    }

    stop()
    {
        l_timer_id := this.timer_id
        if (IsLabel(l_timer_id))
        {
            SetTimer, %l_timer_id%, off
        }
    }
}

class Timer
{
    start($) ; Int.Miliseconds :$timeout, Bool :$periodic, Label :$func
    {
        Var.default_value($, "timeout", 0)
        Var.default_value($, "periodic", false)

        if (!$.func or !IsLabel($.func))
        {
            throw Exception("Timer.start: expected a valid label")
        }

        if (! $.periodic)
        {
            $.timeout := -$.timeout
        }

        func     := $.func
        timeout  := $.timeout
        SetTimer,  %func%, %timeout%

        return new _StopTimer($.func)
    }

    stop(p_timer)
    {
        p_timer.stop()
    }
}


; #include Console.ahk
; Console.log("Press F2 to start the timer `nand F3 to stop it.`n")
; my_timer := ""

; F2::
; {
;     my_timer := Timer.start({ timeout: 15, periodic: true, func: "TimerFunc" })
;     return
; }

; F3::
; {
;     Timer.stop(my_timer)
;     ; my_timer.stop()
;     return
; }

; F4::
; {
;     Console.log("X")
;     return
; }

; ^q::
; {
;     ExitApp
;     return
; }

; TimerFunc:
; Console.log("Timer expired!")
; return