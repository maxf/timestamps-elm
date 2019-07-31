module Types exposing (Model, Msg(..), TimestampManager, initialModel, newTsMgr)

import Time


type alias Model =
    { tsManagers : List TimestampManager }


initialModel : Model
initialModel =
    { tsManagers =
        [ newTsMgr "u" (Just "UR")
        , newTsMgr "h" Nothing
        ]
    }


type alias TimestampManager =
    { id : String
    , timestamps : List Time.Posix
    , newTimestamp : Maybe Time.Posix
    , name : Maybe String
    }


newTsMgr : String -> Maybe String -> TimestampManager
newTsMgr id name =
    { timestamps = []
    , newTimestamp = Nothing
    , name = name
    , id = id
    }


type Msg
    = TimestampManagerAdd TimestampManager
