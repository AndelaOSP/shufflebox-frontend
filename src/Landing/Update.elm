module Landing.Update exposing (update)

import Navigation
import Landing.Messages exposing (Msg(..))
import Models exposing (Model)
import Routing.Route exposing (Route(..), reverse)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetStarted ->
            ( model, Navigation.newUrl (reverse <| AuthRoute Nothing) )

        Home ->
            ( model, Navigation.newUrl (reverse HomeRoute) )

        About ->
            ( model, Navigation.newUrl (reverse AboutRoute) )

        FAQ ->
            ( model, Navigation.newUrl (reverse FaqRoute) )
