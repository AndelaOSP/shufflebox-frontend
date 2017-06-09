module App.SecretSanta.View exposing (view)

import Html exposing (Html, div, h1, h3, section, text, a)
import Html.Attributes exposing (class, href)
import Common.Utils exposing (gitRepo)


view : Html msg
view =
    section [ class "hero is-primary is-fullheight" ]
        [ div [ class "hero-body" ]
            [ div [ class "container has-text-centered" ]
                [ h1 [ class "title" ] [ text "Coming Soon" ]
                , h3 [ class "subtitle" ]
                    [ a [ href gitRepo ] [ text "Help out?" ] ]
                ]
            ]
        ]
