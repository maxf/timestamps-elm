module TimestampManager exposing (TimestampManager, new, activate, deactivate)

import Timestamp exposing (..)
import Array exposing (Array)

type alias TimestampManager =
    { timestamps : List Timestamp
    , newTimestamp : Maybe Timestamp
    , name : Maybe String
    }


new : Maybe String -> TimestampManager
new name =
    { timestamps = []
    , newTimestamp = Nothing
    , name = name
    }


activate : Timestamp -> Int -> Array TimestampManager -> Array TimestampManager
activate newTime index tsmgrList =
    case Array.get index tsmgrList of
        Nothing ->
            tsmgrList

        Just mgr ->
            let
                activatedTsMgr =
                    { mgr | newTimestamp = Just newTime }
            in
            Array.set index activatedTsMgr tsmgrList


deactivate : Int -> Array TimestampManager -> Array TimestampManager
deactivate index tsmgrList =
    case Array.get index tsmgrList of
        Nothing ->
            tsmgrList

        Just mgr ->
            let
                deactivatedTsMgr =
                    { mgr | newTimestamp = Nothing }
            in
            Array.set index deactivatedTsMgr tsmgrList
