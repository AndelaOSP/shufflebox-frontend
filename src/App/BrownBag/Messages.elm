module App.BrownBag.Messages exposing (..)

import Http
import App.BrownBag.Models exposing (BrownBag)
import App.Auth.Models exposing (User)


type Msg
    = OnFetchBrownBags (Result Http.Error (List BrownBag))
    | ListBrownBags
    | ShuffleBrownBag
    | OnShuffleBrownbag (Result Http.Error BrownBag)
    | OnFetchUndone (Result Http.Error (List User))
