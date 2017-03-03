module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Hangouts.Models exposing (Hangout, Group, Member)


view : List Hangout -> Html msg
view hangouts =
    div [ class "table" ]
        [ table []
            (tr [] [ th [ colspan 4 ] [ text "HANGOUTS" ] ] :: hangoutsView hangouts)
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
    List.map groupView hangout.groups


groupView : Group -> Html msg
groupView group_ =
    tr []
        (List.map memberView group_.members)


memberView : Member -> Html msg
memberView member =
    td []
        [ img
            [ src member.avatar
            , width 50
            ]
            []
        , text member.name
        ]
