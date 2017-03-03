module App.Common.Commands exposing (..)

import App.Decoders.Common exposing (baseUrl)


shuffleUrl : String
shuffleUrl =
    baseUrl ++ "/shuffle"
