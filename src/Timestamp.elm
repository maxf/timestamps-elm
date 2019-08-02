module Timestamp exposing (..)

import Time exposing (..)


type alias Timestamp = Posix

year : Timestamp -> String
year ts =
    ts |> Time.toYear Time.utc |> String.fromInt

month : Timestamp -> String
month ts =
    case ts |> Time.toMonth Time.utc of
        Time.Jan -> "01"
        Time.Feb -> "02"
        Time.Mar -> "03"
        Time.Apr -> "04"
        Time.May -> "05"
        Time.Jun -> "06"
        Time.Jul -> "07"
        Time.Aug -> "08"
        Time.Sep -> "09"
        Time.Oct -> "10"
        Time.Nov -> "11"
        Time.Dec -> "12"

day : Timestamp -> String
day ts =
    ts |> Time.toDay Time.utc |> String.fromInt |> pad2

hours : Timestamp -> String
hours ts =
    ts |> Time.toHour Time.utc |> String.fromInt |> pad2

minutes : Timestamp -> String
minutes ts =
    ts |> Time.toMinute Time.utc |> String.fromInt |> pad2

seconds : Timestamp -> String
seconds ts =
    ts |> Time.toSecond Time.utc |> String.fromInt |> pad2


pad2 : String -> String
pad2 s =
    if String.length s < 2 then "0" ++ s else s
