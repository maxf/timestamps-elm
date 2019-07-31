module Types exposing (Model, Msg(..), TimestampManager, initialModel, newTsMgr)

import Time


type alias Timestamp =
    Time.Posix


type alias Model =
    { tsManagers : List TimestampManager }


initialModel : Model
initialModel =
    { tsManagers =
        [ newTsMgr (Just "UR")
        , newTsMgr Nothing
        ]
    }


type alias TimestampManager =
    { timestamps : List Timestamp
    , newTimestamp : Maybe Timestamp
    , name : Maybe String
    }


newTsMgr : Maybe String -> TimestampManager
newTsMgr name =
    { timestamps = []
    , newTimestamp = Nothing
    , name = name
    }


type alias TsMgrId =
    String


type Msg
    = UserClickedAddTs TimestampManager
    | RetrievedTimeForNewTs TimestampManager Time.Posix
