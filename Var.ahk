#include Console.ahk
#include JSON.ahk

Class Var
{
    dump(obj)
    {
        Console.log(JSON.to_json(obj))
        return Var
    }

    gdump(obj)
    {
        MsgBox % JSON.to_json(obj)
        return Var
    }

    default_value(obj, key, default_val)
    {
        if (! obj[key] and obj[key] != 0)
        {
            obj[key] := default_val
        }

        return Var
    }
}
