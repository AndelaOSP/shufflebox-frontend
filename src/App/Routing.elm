module App.Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = HomeRoute
    | AboutRoute
    | FaqRoute
    | BrownBagsRoute
      -- | SecretSantaRoute
    | HangoutsRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map AboutRoute (s "about")
        , map FaqRoute (s "faq")
        , map BrownBagsRoute (s "brownbags")
          -- , map SecretSantaRoute (s "secretsanta")
        , map HangoutsRoute (s "hangouts")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
