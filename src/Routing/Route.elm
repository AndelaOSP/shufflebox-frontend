module Routing.Route exposing (..)

import Navigation exposing (Location)
import UrlParser as UrlParser exposing (..)
import App.Auth.Models exposing (Token)
import Common.Utils exposing (loginAPIUrl)
import String


type Route
    = HomeRoute
    | AboutRoute
    | FaqRoute
    | BrownBagsRoute
    | SecretSantaRoute
    | HangoutsRoute
    | NotFoundRoute
    | AuthRoute Token
    | LoginRoute Location


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map AboutRoute (s "about")
        , map FaqRoute (s "faq")
        , map BrownBagsRoute (s "brownbags")
        , map SecretSantaRoute (s "secretsanta")
        , map HangoutsRoute (s "hangouts")
        , map AuthRoute (s "auth" <?> stringParam "token")
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

        LoginRoute location ->
            constructLoginUrl location

        AuthRoute token ->
            case token of
                Just t ->
                    "/auth?token=" ++ t

                Nothing ->
                    "/auth"

        _ ->
            "/"


constructLoginUrl : Location -> String
constructLoginUrl location =
    String.concat
        [ loginAPIUrl
        , "?redirect_url="
        , location.protocol
        , "//"
        , location.host
        , "/auth"
        ]
