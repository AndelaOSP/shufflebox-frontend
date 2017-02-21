module BrownBag.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (..)
import BrownBag.Messages exposing (Msg(..))
import BrownBag.Models exposing (BrownBagPresenter, BrownBagStatus(..))
import Common.Nav exposing (navBar)
import Common.SideNav exposing (sideNav)


view : List BrownBagPresenter -> Html Msg
view brownBags =
    div [ class "brownbag" ]
        [ sideNav
        , div [ class "brownbag--content" ]
            [ navBar
            , div [ class "brownbag--feed" ]
                [ feed brownBags ]
            , div [ class "brownbag--side-panel" ]
                [ undone brownBags ]
            ]
        ]


feed : List BrownBagPresenter -> Html Msg
feed brownBags =
    div []
        [ upcoming brownBags
        , previous brownBags
        ]


previous : List BrownBagPresenter -> Html msg
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


upcoming : List BrownBagPresenter -> Html msg
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


undone : List BrownBagPresenter -> Html msg
undone brownBags =
    brownBags
        |> List.filter (\b -> b.status == NotDone)
        |> viewUndone


viewUndone : List BrownBagPresenter -> Html msg
viewUndone brownBags =
    div [ class "side-panel-content" ]
        [ h1 [] [ text "Who's on the list" ]
        , presenterList brownBags
        ]


presenterList : List BrownBagPresenter -> Html msg
presenterList presenters =
    ul [ class "feed--list" ]
        (List.map presenterRow presenters)


presenterRow : BrownBagPresenter -> Html msg
presenterRow presenter =
    li []
        [ img [ class "avatar", src presenter.avatar ] []
        , text presenter.name
        ]


noPresenterRow : String -> Html msg
noPresenterRow msg =
    li []
        [ text msg ]
