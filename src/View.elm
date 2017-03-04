module View exposing (..)

import Html exposing (..)
import Models exposing (Model)
import Messages exposing (Msg(..))
import Routing.Route exposing (Route(..))
import Landing.View as Landing
import App.View as App


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        NotFoundRoute ->
            notFoundView

        _ ->
            if model.authModel.isAuthenticated then
                Html.map AppMsg (App.view model)
            else
                Html.map LandingPageMsg (Landing.view model)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not Found" ]
