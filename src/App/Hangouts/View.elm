module App.Hangouts.View exposing (view)

import Html exposing (..)
import Paginate exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import App.Hangouts.Models exposing (HangoutModel, Hangout, Group)
import App.Hangouts.Messages exposing (Msg(..))
import App.Auth.Models exposing (User)


view : HangoutModel -> Html Msg
view hangoutModel =
    let
        buttonClass =
            "button is-primary is-outlined"

        isShuffling =
            if hangoutModel.loading == True then
                buttonClass ++ "is-loading"
            else
                buttonClass

        hangoutDate =
            Maybe.withDefault "No hangout yet" hangoutModel.hangout.date
    in
        div [ class "hangouts" ]
            [ h2 [] [ text hangoutDate ]
            , div []
                [ ul []
                    (List.map hangoutPageView <| Paginate.page hangoutModel.pGroups)
                ]
            , a [ class "button", onClick Prev ]
                [ span [ class "icon is-small" ]
                    [ i [ class "fa fa-chevron-left" ] [] ]
                ]
            , a [ class "button", onClick Next ]
                [ span [ class "icon is-small" ]
                    [ i [ class "fa fa-chevron-right" ] [] ]
                ]
            , div [ class "hangout--button" ]
                [ button [ onClick ShuffleHangouts, class isShuffling ]
                    [ text "SHUFFLE" ]
                ]
            ]


hangoutPageView : Group -> Html msg
hangoutPageView pGroup =
    li []
        [ div []
            (List.map memberView pGroup.members)
        ]


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
