module Landing.Nav exposing (navBar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)
import Common.Utils.Html exposing (link)
import Landing.Messages exposing (Msg(..))
import Routing.Route as Routing exposing (reverse)


navBar : Html Msg
navBar =
    div [ class "nav-bar" ]
        [ img
            [ src brandUrl
            , class "image is-48x48"
            , style [ ( "margin-left", "90px" ) ]
            ]
            []
        , div [ class "column is-half"]
            [ homeLink "SHUFFLEBOX" ]
        , nav []
            [ ul []
                (List.map navLink [ homeLink "", aboutLink, faqLink ])
            ]
        ]


navLink : Html msg -> Html msg
navLink linkElement =
    li []
        [ linkElement ]


homeLink : String -> Html Msg
homeLink linkText =
    link Home Routing.HomeRoute linkText


aboutLink : Html Msg
aboutLink =
    link About Routing.AboutRoute "ABOUT"


faqLink : Html Msg
faqLink =
    link FAQ Routing.FaqRoute "FAQ"
