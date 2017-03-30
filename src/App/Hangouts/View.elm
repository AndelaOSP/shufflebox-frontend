module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import App.Hangouts.Models exposing (HangoutModel, Hangout, Group)
import App.Hangouts.Messages exposing (Msg(..))
import App.Auth.Models exposing (User)


view : HangoutModel -> Html Msg
view hangoutsModel =
    let
        buttonClass =
            "button is-primary is-outlined"

        isShuffling =
            if hangoutsModel.loading == True then
                buttonClass ++ "is-loading"
            else
                buttonClass
    in
        div [ class "hangouts" ]
            []
        -- div []
        --     [ table [ class "table is-bordered is-striped" ]
        --         (tr [] [ th [ colspan 4 ] [ text "HANGOUTS" ] ] :: hangoutsView hangoutsModel.hangouts)
        --     , div [ class "hangout--button" ]
        --         [ button [ onClick ShuffleHangouts, class isShuffling ]
        --             [ text "SHUFFLE" ]
        --         ]
        --     ]


-- hangoutsPageView : List Hangout -> Html Msg
-- hangoutsPageView hangouts =
--     -- hangouts


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
    div [ class "" ]
        [ img
            [ src member.profile.avatar
            , width 50
            ]
            []
        , text member.username
        ]
