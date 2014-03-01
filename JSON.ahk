; #include Console.ahk
#include libs\AHK-Lib-JSON_ToObj
#include JSON_FromObj.ahk
#include JSON_ToObj.ahk

Class JSON
{
    to_json(obj)
    {
        return JSON_FromObj(obj)
    }

    from_json(json_text)
    {
        return JSON_ToObj(json_text)
    }
}

; Console.log(JSON.to_json({a: 1, b: 2}))
; vary := JSON.from_json(JSON.to_json({a: 1, b: 2}))
; Console.log(vary.a)