module App.BrownBag.Messages exposing (..)

import Http
import App.BrownBag.Models exposing (Presenter)


type Msg
    = OnFetchBrownBags (Result Http.Error (List Presenter))
    | ListBrownBags
    | ShuffleBrownBag
