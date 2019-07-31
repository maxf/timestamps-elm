module View exposing (view)

import Html exposing (Html, div, h1, h2, img, li, text, ul)
import Html.Attributes exposing (src)
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


viewMgr : TimestampManager -> Html Msg
viewMgr ts =
    li
        []
        [ viewName ts.name
        , viewTimestamps ts.timestamps
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "timestamps" ]
        , ul [] (List.map viewMgr model.tsManagers)
        ]
