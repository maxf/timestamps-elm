module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)
import Time
import Types exposing (Model, Msg(..), TimestampManager)


emptyHtml : Html Msg
emptyHtml =
    text ""


viewTimestamp : Time.Posix -> Html Msg
viewTimestamp time =
    text "some ts"


viewTimestamps : List Time.Posix -> Html Msg
viewTimestamps timestamps =
    ul []
        (List.map viewTimestamp timestamps)


viewName : Maybe String -> Html Msg
viewName maybeName =
    case maybeName of
        Nothing ->
            emptyHtml

        Just name ->
            h2 [] [ text name ]


viewAddButton : TimestampManager -> Html Msg
viewAddButton tsm =
    button [ onClick (UserClickedAddTs tsm) ] [ text "New" ]


viewMgr : TimestampManager -> Html Msg
viewMgr tsm =
    li
        []
        [ viewName tsm.name
        , viewTimestamps tsm.timestamps
        , viewAddButton tsm
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "timestamps" ]
        , ul [] (List.map viewMgr model.tsManagers)
        ]
