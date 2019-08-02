module View exposing (view)

import Array
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Time
import Timestamp exposing (..)
import TimestampManager exposing (TimestampManager)
import Types exposing (Model, Msg(..))


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


viewAddButton : Int -> Html Msg
viewAddButton index =
    button [ onClick (UserClickedAddTs index) ] [ text "New" ]


viewNewTs : Int -> Maybe Timestamp -> Html Msg
viewNewTs index timestamp =
    case timestamp of
        Nothing ->
            emptyHtml

        Just ts ->
            div []
                [ input [ ts |> year |> value ] []
                , text "/ "
                , input [ ts |> month |> value ] []
                , text "/ "
                , input [ ts |> day |> value ] []
                , text " - "
                , input [ ts |> hours |> value ] []
                , text " : "
                , input [ ts |> minutes |> value ] []
                , button [] [ text "Add" ]
                , button [ onClick (UserClickedCancel index) ] [ text "Cancel" ]
                ]



viewMgr : Int -> TimestampManager -> Html Msg
viewMgr index tsm =
    li
        []
        [ viewName tsm.name
        , viewTimestamps tsm.timestamps
        , viewNewTs index tsm.newTimestamp
        , viewAddButton index
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "timestamps" ]
        , ul [] (Array.indexedMap viewMgr model.tsManagers |> Array.toList)
        ]
