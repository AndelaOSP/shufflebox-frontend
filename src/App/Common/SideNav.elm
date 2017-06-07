module App.Common.SideNav exposing (sideNav)

import Html exposing (..)
import Html.Attributes exposing (..)


sideNav : Html msg
sideNav =
    div [ class "column is-one-third sidenav is-hidden-mobile" ]
        [ div [ class "columns header" ]
            [ div [ class "column is-2" ] []
            , nav [ class "column is-10" ]
                [
                  img [
                    src "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL6mL82lmkpq6LY4xvBS2lpYmTjT5S8KuYzhu52C7FcYfbghfV"
                  ][]
                , text " What is your next event?" ]
            ]
        ]

