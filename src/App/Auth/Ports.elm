port module App.Auth.Ports exposing (..)

import App.Auth.Models exposing (Token)


port setToken : Token -> Cmd msg


port removeToken : Token -> Cmd msg
