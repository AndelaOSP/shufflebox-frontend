module App.Hangouts.Messages exposing (..)

import Http
import App.Hangouts.Models exposing (Hangout)


type Msg
    = ListHangouts
    | ShuffleHangouts
    | OnShuffleHangouts (Result Http.Error Hangout)
    | OnFetchHangouts (Result Http.Error (List Hangout))
