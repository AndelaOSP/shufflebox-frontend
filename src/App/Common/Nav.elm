module App.Common.Nav exposing (navBar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)
import Common.Utils.Html exposing (link, transformerLink)
import App.Messages exposing (Msg(..))
import App.BrownBag.Messages as Brownbag
import App.Hangouts.Messages as Hangouts
import App.SecretSanta.Messages as SecretSanta
import Routing.Route exposing (Route(..))


navBar : Html Msg
navBar =
    nav [ class "container--nav" ]
        [ div [ class "list" ]
            [ ul []
                [ li [] [ brownBagsLink ]
                , li [] [ secretSantaLink ]
                , li [] [ hangoutsLink ]
                ]
            ]
        , div [ class "image" ]
            [ img
                [ src brandUrl
                , width 50
                ]
                []
            ]
        ]


brownBagsLink : Html Msg
brownBagsLink =
    transformerLink BrownBagMsg Brownbag.ListBrownBags BrownBagsRoute "Brown Bag"


hangoutsLink : Html Msg
hangoutsLink =
    transformerLink HangoutsMsg Hangouts.ListHangouts HangoutsRoute "Hangouts"


secretSantaLink : Html Msg
secretSantaLink =
    transformerLink SecretSantaMsg SecretSanta.ListSecretSanta SecretSantaRoute "Secret Santa"
