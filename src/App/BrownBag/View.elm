module App.BrownBag.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)
import App.BrownBag.Messages exposing (Msg(..))
import App.BrownBag.Models exposing (BrownBag, Status(..))


view : List BrownBag -> Html Msg
view brownBags =
    div [ class "columns brownbag" ]
        [ feed brownBags
        , undone brownBags
        ]


feed : List BrownBag -> Html Msg
feed brownBags =
    div [ class "column is-two-thirds brownbag--feed" ]
        [ upcoming brownBags
        , previous brownBags
        ]


previous : List BrownBag -> Html msg
previous brownbags =
    let
        doneBrownbags =
            brownbags
                |> List.filter (\p -> p.status == Done)
    in
        div [ class "feed--card previous" ]
            [ h1 [] [ text "Previous Brown Bags" ]
            , p [] [ text "27 Jan - 20 Mar" ]
            , brownbagsList doneBrownbags
            ]


upcoming : List BrownBag -> Html msg
upcoming brownbags =
    let
        maybeUpcoming =
            brownbags
                |> List.filter (\p -> p.status == NextInLine)
                |> List.head
    in
        case maybeUpcoming of
            Just brownbag ->
                div [ class "feed--card upcoming" ]
                    [ h1 [] [ text "Upcoming Brown Bag" ]
                    , p [] [ text brownbag.date ]
                    , brownbagsList [ brownbag ]
                    ]

            Nothing ->
                shuffleView


shuffleView : Html msg
shuffleView =
    div [ class "feed--card shuffle" ]
        [ div [ class "shuffle--content" ]
            [ h1 [] [ text "Next brown bag is almost up..." ]
            , p [] [ text "30 Mar" ]
            ]
        , div [ class "shuffle--button" ]
            [ button [ class "button is-info" ]
                [ span [ class "icon" ]
                    [ img [ src brandUrl ] [] ]
                , span [] [ text "Shuffle" ]
                ]
            ]
        ]


undone : List BrownBag -> Html msg
undone brownBags =
    brownBags
        |> List.filter (\b -> b.status == NotDone)
        |> viewUndone


viewUndone : List BrownBag -> Html msg
viewUndone brownBags =
    div [ class "column is-one-third" ]
        [ div [ class "sidepanel" ]
            [ h1 [ class "title is-4" ] [ text "Who's on the list" ]
            , brownbagsList brownBags
            ]
        ]


brownbagsList : List BrownBag -> Html msg
brownbagsList =
    div [] << List.map presenterRow


presenterRow : BrownBag -> Html msg
presenterRow ({ user } as brownbag) =
    div [ class "media" ]
        [ div [ class "media-left" ]
            [ figure [ class "image is-48x48" ]
                [ img [ alt "user avatar", src user.profile.avatar ]
                    []
                ]
            ]
        , div [ class "media-content" ]
            [ div [ class "content" ]
                [ p [ class "subtitle is-5" ] [ text user.username ]
                , small [] [ text brownbag.date ]
                ]
            ]
        ]
