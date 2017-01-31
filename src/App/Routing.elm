module App.Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = BrownBagsRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map BrownBagsRoute top
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
