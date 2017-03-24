module App.BrownBag.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)
import App.BrownBag.Messages exposing (Msg(..))
import App.BrownBag.Models exposing (BrownBag, Status(..))


view : List BrownBag -> Html Msg
view brownBags =
    span []
        [ feed brownBags
        , undone brownBags
        ]


feed : List BrownBag -> Html Msg
feed brownBags =
    div [ class "brownbag--feed" ]
        [ div []
            [ upcoming brownBags
            , previous brownBags
            ]
        ]


previous : List BrownBag -> Html msg
previous presenters =
    let
        previousPresenters =
            presenters
                |> List.filter (\p -> p.status == Done)
    in
        div [ class "feed--card previous" ]
            [ h1 [] [ text "Previous Brown Bags" ]
            , p [] [ text "27 Jan - 20 Mar" ]
            , presenterList previousPresenters
            ]


upcoming : List BrownBag -> Html msg
upcoming presenters =
    let
        maybePresenter =
            presenters
                |> List.filter (\p -> p.status == NextInLine)
                |> List.head
    in
        case maybePresenter of
            Just presenter ->
                div [ class "feed--card upcoming" ]
                    [ h1 [] [ text "Upcoming Brown Bag" ]
                    , p [] [ text "30 Mar" ]
                    , presenterList [ presenter ]
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
            [ button []
                [ img [ src brandUrl ] []
                , text "Shuffle"
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
    div [ class "brownbag--side-panel" ]
        [ div [ class "side-panel-content" ]
            [ h1 [] [ text "Who's on the list" ]
            , presenterList brownBags
            ]
        ]


presenterList : List BrownBag -> Html msg
presenterList presenters =
    ul [ class "feed--list" ]
        (List.map presenterRow presenters)


presenterRow : BrownBag -> Html msg
presenterRow { user } =
    li []
        [ img [ class "avatar", src user.profile.avatar ] []
        , text user.username
        ]
