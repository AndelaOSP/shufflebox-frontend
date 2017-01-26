module App.View exposing (..)

import Html exposing (..)
import App.Models exposing (Model)
import App.Messages exposing (Msg(..))

view : Model -> Html Msg
view model =
  div []
    [ div []
      [ sideBarSection model
      , contentSection model
      ]
    ]


sideBarSection : Model -> Html Msg
sideBarSection model =
  div []
    [ profileInfoView model
    , calendarView model
    ]



profileInfoView : Model -> Html Msg
profileInfoView model =
  div []
    [ ]


calendarView : Model -> Html Msg
calendarView model =
  div []
    []

contentSection : Model -> Html Msg
contentSection model =
  div []
    []

