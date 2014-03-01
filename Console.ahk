; If runned from the console must be piped to some other program
; in order for the output to be printed on the console.
; Ex path/to/AutoHotkey.exe my-ahkscript.ahk | more

class Console
{
    print(args*)
    {
        for index, value in args
        {
            FileAppend %value%, *
        }
    }

    log(args*)
    {
        for index, value in args
        {
            FileAppend %value%, *
        }
        FileAppend `n, *
    }
}

