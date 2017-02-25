module Routing.Route exposing (..)

import Navigation exposing (Location)
import UrlParser as UrlParser exposing (Parser, parsePath, oneOf, map, top, s)


type Route
    = HomeRoute
    | AboutRoute
    | FaqRoute
    | BrownBagsRoute
    | SecretSantaRoute
    | HangoutsRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map AboutRoute (s "about")
        , map FaqRoute (s "faq")
        , map BrownBagsRoute (s "brownbags")
        , map SecretSantaRoute (s "secretsanta")
        , map HangoutsRoute (s "hangouts")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


reverse : Route -> String
reverse route =
    case route of
        HomeRoute ->
            "/"

        AboutRoute ->
            "/about"

        FaqRoute ->
            "/faq"

        BrownBagsRoute ->
            "/brownbags"

        SecretSantaRoute ->
            "/secretsanta"

        HangoutsRoute ->
            "/hangouts"

        _ ->
            "/"
