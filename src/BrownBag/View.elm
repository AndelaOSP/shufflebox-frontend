module BrownBag.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import BrownBag.Messages exposing (Msg(..))
import BrownBag.Models exposing (BrownBagPresenter, BrownBagStatus(..))


view : List BrownBagPresenter -> Html Msg
view brownBags =
    div [ class "brownbag" ]
        [ div [ class "brownbag--sidebar" ] [ sideNav ]
        , div [ class "brownbag--content" ]
            [ navBar
            , div [ class "brownbag--feed" ]
                [ feed brownBags ]
            , div [ class "brownbag--side-panel" ]
                [ undoneBrownbags brownBags ]
            ]
        ]


navBar : Html Msg
navBar =
    nav [ class "brownbag--nav" ]
        [ div [ class "list" ]
            [ ul []
                [ li [] [ a [ href "#brownbags" ] [ text "Brown Bag" ] ]
                , li [] [ a [ href "#secretsanta" ] [ text "Secret Santa" ] ]
                , li [] [ a [ href "#hangouts" ] [ text "Hangouts" ] ]
                ]
            ]
        , div [ class "image" ]
            [ img
                [ src "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1"
                , width 50
                ]
                []
            ]
        ]


sideNav : Html msg
sideNav =
    div [ class "sidenav" ]
        [ nav [] [ text "What is you next event?" ]
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


undoneBrownbags : List BrownBagPresenter -> Html msg
undoneBrownbags brownBags =
    brownBags
        |> List.filter (\b -> b.status == NotDone)
        |> undoneBrownbagsView


undoneBrownbagsView : List BrownBagPresenter -> Html msg
undoneBrownbagsView brownBags =
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


brandUrl : String
brandUrl =
    "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1"
