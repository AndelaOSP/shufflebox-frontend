module Landing.Nav exposing (navBar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)
import Common.Util.Html exposing (linkAttrs)
import Landing.Messages exposing (Msg(..))
import Routing.Route as Routing exposing (reverse)


navBar : Html Msg
navBar =
    div [ class "nav-bar" ]
        [ img
            [ src brandUrl
            , width 50
            , style [ ( "margin-left", "90px" ) ]
            ]
            []
        , div []
            [ homeLink "SHUFFLEBOX" ]
        , nav []
            [ ul []
                (List.map navLink [ homeLink "", aboutLink, faqLink ])
            ]
        ]


navLink : Html msg -> Html msg
navLink link =
    li []
        [ link ]


link : Msg -> Routing.Route -> String -> Html Msg
link action route linkText =
    a (linkAttrs "" action (reverse route)) [ text linkText ]


homeLink : String -> Html Msg
homeLink linkText =
    link Home Routing.HomeRoute linkText


aboutLink : Html Msg
aboutLink =
    link About Routing.AboutRoute "ABOUT"


faqLink : Html Msg
faqLink =
    link FAQ Routing.FaqRoute "FAQ"
