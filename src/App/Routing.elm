module App.Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = LandingPageRoute
    | BrownBagsRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map LandingPageRoute top
        , map BrownBagsRoute (s "brownbags")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
