module App.BrownBag.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Common.Utils exposing (brandUrl)
import App.BrownBag.Messages exposing (Msg(ShuffleBrownBag))
import App.BrownBag.Models exposing (BrownbagModel, BrownBag, Status(..))


view : BrownbagModel -> Html Msg
view ({ brownbags } as model) =
    div [ class "columns brownbag" ]
        [ feed model
        , undone brownbags
        ]


feed : BrownbagModel -> Html Msg
feed ({ brownbags } as model) =
    div [ class "column is-two-thirds brownbag--feed" ]
        [ upcoming model
        , previous brownbags
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
            , div [ class "previous-list" ] [ brownbagsList doneBrownbags ]
            ]


upcoming : BrownbagModel -> Html Msg
upcoming ({ brownbags } as model) =
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
                shuffleView model


shuffleView : BrownbagModel -> Html Msg
shuffleView { loading } =
    let
        shuffleButton =
            if not loading then
                button [ class "button is-info", onClick ShuffleBrownBag ]
                    [ span [ class "icon" ]
                        [ img [ src brandUrl ] [] ]
                    , span [] [ text "Shuffle" ]
                    ]
            else
                button [ class "button is-info is-loading" ] [ text "Loading" ]
    in
        div [ class "feed--card shuffle" ]
            [ div [ class "shuffle--content" ]
                [ h1 [] [ text "Next brown bag is almost up..." ]
                , p [] [ text "30 Mar" ]
                ]
            , div [ class "shuffle--button" ]
                [ shuffleButton ]
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
            [ h1 [ class "title is-4 heading" ] [ text "Who's on the list" ]
            , div [ class "sidepanel-list" ] [ brownbagsList brownBags ]
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
