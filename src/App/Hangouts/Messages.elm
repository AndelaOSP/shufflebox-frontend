module App.Hangouts.Messages exposing (..)

import Http
import App.Hangouts.Models exposing (Hangout)


type Msg
    = ListHangouts
    | ShuffleHangouts
    | OnFetchHangouts (Result Http.Error (List Hangout))
