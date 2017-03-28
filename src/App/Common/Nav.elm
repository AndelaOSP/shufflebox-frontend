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
    nav [ class "level is-mobile is-marginless" ]
        (List.map levelItem [ brownBagsLink, secretSantaLink, hangoutsLink ])


levelItem : Html Msg -> Html Msg
levelItem navLink =
    div [ class "level-item has-text-centered" ]
        [ p [ class "title is-5" ]
            [ navLink ]
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
