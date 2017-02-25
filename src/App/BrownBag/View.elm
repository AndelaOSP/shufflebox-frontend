module App.BrownBag.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (..)
import App.BrownBag.Messages exposing (Msg(..))
import App.BrownBag.Models exposing (Presenter, Status(..))
import App.Common.Nav exposing (navBar)
import App.Common.SideNav exposing (sideNav)


view : List Presenter -> Html Msg
view brownBags =
    div [ class "container" ]
        [ sideNav
        , div [ class "container--content" ]
            [ navBar
            , feed brownBags
            , undone brownBags
            ]
        ]


feed : List Presenter -> Html Msg
feed brownBags =
    div [ class "brownbag--feed" ]
        [ div []
            [ upcoming brownBags
            , previous brownBags
            ]
        ]


previous : List Presenter -> Html msg
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


upcoming : List Presenter -> Html msg
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


undone : List Presenter -> Html msg
undone brownBags =
    brownBags
        |> List.filter (\b -> b.status == NotDone)
        |> viewUndone


viewUndone : List Presenter -> Html msg
viewUndone brownBags =
    div [ class "brownbag--side-panel" ]
        [ div [ class "side-panel-content" ]
            [ h1 [] [ text "Who's on the list" ]
            , presenterList brownBags
            ]
        ]


presenterList : List Presenter -> Html msg
presenterList presenters =
    ul [ class "feed--list" ]
        (List.map presenterRow presenters)


presenterRow : Presenter -> Html msg
presenterRow presenter =
    li []
        [ img [ class "avatar", src presenter.avatar ] []
        , text presenter.name
        ]
