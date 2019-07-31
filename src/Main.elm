module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, li, text, ul)
import Html.Attributes exposing (src)
import Task
import Time
import Types exposing (..)
import View exposing (view)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UserClickedAddTs tsMgrId ->
            ( model
            , Task.perform (RetrievedTimeForNewTs tsMgrId) Time.now
            )

        RetrievedTimeForNewTs tsMgrId newTime ->
            ( model, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
