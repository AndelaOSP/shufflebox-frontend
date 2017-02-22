module BrownBag.Messages exposing (..)

import Http
import BrownBag.Models exposing (Presenter)


type Msg
    = OnFetchAll (Result Http.Error (List Presenter))
    | ListBrownBags
    | ShuffleBrownBag
