module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import App.Hangouts.Models exposing (Hangout, Group)
import App.Hangouts.Messages exposing (Msg(..))
import App.Auth.Models exposing (User)
-- import Common.Utils exposing (brandUrl)


view : List Hangout -> Html Msg
view hangouts =
    div []
        [ table [ class "table is-bordered is-striped" ]
            (tr [] [ th [ colspan 4 ] [ text "HANGOUTS" ] ] :: hangoutsView hangouts)
        , div [ class "hangout--button" ]
            [ button [ onClick ShuffleHangouts, class "button is-primary is-outlined" ]
                [ text "SHUFFLE" ]
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


memberView : User -> Html msg
memberView member =
    td []
        [ img
            [ src member.profile.avatar
            , width 50
            ]
            []
        , text member.username
        ]
