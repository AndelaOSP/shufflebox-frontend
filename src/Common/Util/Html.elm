module Common.Util.Html exposing (..)

import Html exposing (Html, Attribute, a, text)
import Html.Attributes exposing (class, href)
import Common.Util.Events exposing (onClick)
import Routing.Route exposing (Route, reverse)


type alias Url =
    String


type alias ClassName =
    String



{- Construct a link element attributes list.
   The constructed attribute list uses a custom onClick handler that does not
   perform a page reload.
-}


linkAttrs : ClassName -> msg -> Url -> List (Attribute msg)
linkAttrs className message url =
    [ onClick message
    , href url
    , class className
    ]



{- Small helper for constructing links without classes -}


link : msg -> Route -> String -> Html msg
link action route linkText =
    a (linkAttrs "" action (reverse route)) [ text linkText ]