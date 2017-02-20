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
                []
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
        [ previous brownBags
        , upcoming brownBags
          -- , next brownBags
        ]


previous : List BrownBagPresenter -> Html msg
previous presenters =
    div [ class "feed--card" ]
        [ h1 [] [ text "Previous Brown Bags" ]
        , p [] [ text "27 Jan - 20 Mar" ]
        , presenterList presenters
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
                div [ class "feed--card" ]
                    [ presenterList [presenter] ]

            Nothing ->
                noPresenterRow "No Upcoming BrownBagPresenter."


next : BrownBagPresenter -> Html Msg
next presenters =
    let
        notDone =
            List.filter (\p -> p.status == NotDone)
    in
        div []
            [ span [] [ text "27 Jan - 20 March" ]
            , span [] [ text "Next brown bag is almost up..." ]
            , button [] [ text "Shuffle" ]
            ]


-- TODO: Remove confusing function identifier
presentersList : List BrownBagPresenter -> Html msg
presentersList brownBags =
    brownBags
        |> List.filter (\b -> b.status == NotDone)
        |> whosOnTheListView


whosOnTheListView : List BrownBagPresenter -> Html msg
whosOnTheListView brownBags =
    ul []
        (List.map presenterRow brownBags)


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
