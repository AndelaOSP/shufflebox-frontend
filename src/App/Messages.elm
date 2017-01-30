module App.Messages exposing (..)

import Navigation exposing (Location)
import BrownBag.Messages exposing(Msg(..))


type Msg
  = BrownBagMsg BrownBag.Messages.Msg
  | OnLocationChange Location
