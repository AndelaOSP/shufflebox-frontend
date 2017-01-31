module BrownBag.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import BrownBag.Messages exposing (Msg(..))
import BrownBag.Models exposing (BrownBagPresenter, BrownBagStatus(..))


view : List BrownBagPresenter -> Html Msg
view brownBags =
    div []
        [ div [] [ feed brownBags ]
        , div [] [ presentersList brownBags, text (toString brownBags)]
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
    ul []
        (List.map presenterRow presenters)


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
                presenterRow presenter
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
            , button [ onClick ShuffleBrownBag ] [ text "Shuffle" ]
            ]


presentersList : List BrownBagPresenter -> Html msg
presentersList brownBags =
    brownBags
        |> List.filter (\b -> b.status == NotDone)
        |> whosOnTheListView


whosOnTheListView : List BrownBagPresenter -> Html msg
whosOnTheListView brownBags =
    ul []
        (List.map presenterRow brownBags)


presenterRow : BrownBagPresenter -> Html msg
presenterRow presenter =
    li []
        [ img [] []
        , text presenter.name
        ]

noPresenterRow : String -> Html msg
noPresenterRow msg =
    li []
        [ text msg ]
