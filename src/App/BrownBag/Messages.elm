module App.BrownBag.Messages exposing (..)

import Http
import App.BrownBag.Models exposing (BrownBag)


type Msg
    = OnFetchBrownBags (Result Http.Error (List BrownBag))
    | ListBrownBags
    | ShuffleBrownBag
    | OnShuffleBrownbag (Result Http.Error BrownBag)
