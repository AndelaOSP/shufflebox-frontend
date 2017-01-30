module BrownBag.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import BrownBag.Messages exposing (Msg(..))
import BrownBag.Models exposing (BrownBag, BrownBagStatus(..))


view : List BrownBag -> Html Msg
view brownBags =
    div []
        [ div [] [ feed brownBags ]
        , div [] [ presentersList brownBags ]
        ]


feed : List BrownBag -> Html Msg
feed brownBags =
    div []
        [ previous brownBags
        , upcoming brownBags
        -- , next brownBags
        ]


previous : List BrownBag -> Html msg
previous presenters =
    ul []
        (List.map presenterRow presenters)


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
                presenterRow presenter
            Nothing ->
                noPresenterRow "No Upcoming brownbag."
            

next : BrownBag -> Html Msg
next presenters =
    let
        notDone =
            List.filter (\p -> p.status == NotDone) 
    in
          div []
            [ span [] [ text "27 Jan - 20 March" ]
            , span [] [ text "Next brown bag is almost up..." ]
            , button [ onClick ShuffleBrownBag ] [ text "Shuffle" ]
            ]


presentersList : List BrownBag -> Html msg
presentersList brownBags =
    brownBags
        |> List.filter (\b -> b.status == NotDone)
        |> whosOnTheListView


whosOnTheListView : List BrownBag -> Html msg
whosOnTheListView brownBags =
    ul []
        (List.map presenterRow brownBags)


presenterRow : BrownBag -> Html msg
presenterRow presenter =
    li []
        [ img [] []
        , text presenter.name
        ]

noPresenterRow : String -> Html msg
noPresenterRow msg =
    li []
        [ text msg ]
