module Common.Util.Html exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (class, href)
import Common.Util.Events exposing (onClick)


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
