module Landing.Update exposing (update)

import Navigation
import Landing.Messages exposing (Msg(..))
import App.Models exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetStarted ->
            ( model, Navigation.newUrl "#brownbags" )

        Home ->
            ( model, Navigation.newUrl "#" )

        About ->
            ( model, Navigation.newUrl "#about" )

        FAQ ->
            ( model, Navigation.newUrl "#faq" )
