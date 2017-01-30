module App.View exposing (..)

import Html exposing (..)
import App.Models exposing (Model)
import App.Messages exposing (Msg(..))
import App.Routing exposing (Route(..))
import BrownBag.View

view : Model -> Html Msg
view model =
  div []
    [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        BrownBagsRoute ->
            Html.map BrownBagMsg (BrownBag.View.view model.brownBags )
        
        NotFoundRoute ->
            notFoundView


sideBarSection : Model -> Html Msg
sideBarSection model =
  div []
    [ profileInfoView model
    , calendarView model
    ]



profileInfoView : Model -> Html Msg
profileInfoView model =
  div []
    [ img [] []
    , text "Jane Doe"
    ]


calendarView : Model -> Html Msg
calendarView model =
  div []
    []

contentSection : Model -> Html Msg
contentSection model =
  div []
    []

notFoundView : Html msg
notFoundView =
    div []
        [ text "Not Found" ]
  
