module App.Auth.Messages exposing (..)

import App.Auth.Models exposing (Token)


type Msg
    = ReceiveToken Token
