module BrownBag.Messages exposing (..)

import Http
import BrownBag.Models exposing (BrownBagPresenter)


type Msg
    = OnFetchAll (Result Http.Error (List BrownBagPresenter))
    | ListBrownBags
    | ShuffleBrownBag
