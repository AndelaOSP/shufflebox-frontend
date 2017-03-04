module App.Auth.Update exposing (update)

import App.Auth.Messages exposing (Msg(..))
import App.Auth.Models exposing (Model, hasToken)
import App.Auth.Ports as AuthPorts


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReceiveToken token ->
            case token of
                Just t ->
                    ( { model | token = token, isAuthenticated = True }
                    , AuthPorts.setToken token
                    )

                Nothing ->
                    ( { model | token = token, isAuthenticated = False }
                    , Cmd.none
                    )
