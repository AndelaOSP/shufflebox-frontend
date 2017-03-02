module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Hangouts.Models exposing (Hangout, Group, Member)


view : List Hangout -> Html msg
view hangouts =
    div [ class "table" ]
        [ table []
            (tr [] [ th [] [ text "HANGOUTS" ] ] :: hangoutsView hangouts)
        , div [ class "hangout--button" ]
            [ button []
                [ img [ src "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1" ] []
                , b [] [ text "SHUFFLE" ]
                ]
            ]
        ]


hangoutsView : List Hangout -> List (Html msg)
hangoutsView hangouts =
    List.concatMap hangoutView hangouts


hangoutView : Hangout -> List (Html msg)
hangoutView hangout =
    hangout.groups
        |> List.concatMap groupView


groupView : Group -> List (Html msg)
groupView group_ =
    group_.members
        |> List.map memberView


memberView : Member -> Html msg
memberView member =
    tr []
        [ img
            [ src member.avatar
            , width 50
            ]
            []
        , text member.name
        ]
