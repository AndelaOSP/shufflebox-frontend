module App.Hangouts.Messages exposing (..)

import Http
import App.Hangouts.Models exposing (Hangout)


type Msg
    = ListHangouts
    | OnFetchHangouts (Result Http.Error (List Hangout))
