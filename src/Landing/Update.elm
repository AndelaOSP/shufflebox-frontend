module Landing.Update exposing (update)

import Navigation
import Landing.Messages exposing (Msg(..))
import App.Models exposing (Model)
import Routing.Route exposing (Route(..), reverse)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetStarted ->
            ( model, Navigation.newUrl (reverse BrownBagsRoute) )

        Home ->
            ( model, Navigation.newUrl (reverse HomeRoute) )

        About ->
            ( model, Navigation.newUrl (reverse AboutRoute) )

        FAQ ->
            ( model, Navigation.newUrl (reverse FaqRoute) )
