module BrownBag.Messages exposing (..)

import Http
import BrownBag.Models exposing (BrownBag)


type Msg
    = OnFetchAll (Result Http.Error (List BrownBag))
    | ListBrownBags
    | ShuffleBrownBag
