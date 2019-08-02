module Types exposing (..)

import Array exposing (Array)
import TimestampManager exposing (TimestampManager, new, activate, deactivate)
import Timestamp exposing (Timestamp)

type alias Model =
    { tsManagers : Array TimestampManager }


initialModel : Model
initialModel =
    { tsManagers =
        Array.fromList
            [ new (Just "UR")
            , new Nothing
            ]
    }



activateTsMgr : Timestamp -> Int -> Model -> Model
activateTsMgr time index model =
    { model | tsManagers = activate time index model.tsManagers }


deactivateTsMgr : Int -> Model -> Model
deactivateTsMgr index model =
    { model | tsManagers = deactivate index model.tsManagers }


type Msg
    = UserClickedAddTs Int
    | RetrievedTimeForNewTs Int Timestamp
    | UserClickedCancel Int
