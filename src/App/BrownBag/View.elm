module App.BrownBag.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Common.Utils exposing (brandUrl)
import App.BrownBag.Messages exposing (Msg(ShuffleBrownBag))
import App.BrownBag.Models exposing (BrownbagModel, BrownBag, Status(..))
import App.Auth.Models exposing (User)


view : BrownbagModel -> Html Msg
view model =
    div [ class "columns brownbag" ]
        [ feed model
        , viewUndone model.undone
        ]


feed : BrownbagModel -> Html Msg
feed model =
    div [ class "column is-two-thirds brownbag--feed" ]
        [ upcoming model
        , previous model.brownbags
        ]


previous : List BrownBag -> Html msg
previous brownbags =
    let
        doneBrownbags =
            brownbags
                |> List.filter (\p -> p.status == Done)
    in
        div [ class "feed--card previous" ]
            [ h1 [] [ text "Previous Brown Bags" ]
            , p [] [ text "27 Jan - 20 Mar" ]
            , div [ class "previous-list" ] [ brownbagsList doneBrownbags ]
            ]


upcoming : BrownbagModel -> Html Msg
upcoming model =
    let
        maybeUpcoming =
            model.brownbags
                |> List.filter (\p -> p.status == NextInLine)
                |> List.head
    in
        case maybeUpcoming of
            Just brownbag ->
                div [ class "feed--card upcoming" ]
                    [ h1 [] [ text "Upcoming Brown Bag" ]
                    , p [] [ text brownbag.date ]
                    , brownbagsList [ brownbag ]
                    ]

            Nothing ->
                shuffleView model


shuffleView : BrownbagModel -> Html Msg
shuffleView { loading } =
    let
        shuffleButton =
            if not loading then
                button [ class "button is-info", onClick ShuffleBrownBag ]
                    [ span [ class "icon" ]
                        [ img [ src brandUrl ] [] ]
                    , span [] [ text "Shuffle" ]
                    ]
            else
                button [ class "button is-info is-loading" ] [ text "Loading" ]
    in
        div [ class "feed--card shuffle" ]
            [ div [ class "shuffle--content" ]
                [ h1 [] [ text "Next brown bag is almost up..." ]
                , p [] [ text "30 Mar" ]
                ]
            , div [ class "shuffle--button" ]
                [ shuffleButton ]
            ]


viewUndone : List User -> Html msg
viewUndone users =
    div [ class "column is-one-third" ]
        [ div [ class "sidepanel" ]
            [ h1 [ class "title is-4 heading" ] [ text "Who's on the list" ]
            , div [ class "sidepanel-list" ] (undoneUsersList users)
            ]
        ]


undoneUsersList : List User -> List (Html msg)
undoneUsersList =
    List.map undone


undone : User -> Html msg
undone user =
    div [ class "columns" ]
        [ div [ class "column is-4" ]
            [ figure [ class "image is-48x48" ]
                [ img [ src user.profile.avatar, alt "avatar" ] [] ]
            ]
        , div [ class "column is-centered" ]
            [ span [ class "subtitle is-6" ] [ text user.username ] ]
        ]


brownbagsList : List BrownBag -> Html msg
brownbagsList =
    div [] << List.map presenterRow


presenterRow : BrownBag -> Html msg
presenterRow ({ user } as brownbag) =
    div [ class "media" ]
        [ div [ class "media-left" ]
            [ figure [ class "image is-48x48" ]
                [ img [ alt "user avatar", src user.profile.avatar ]
                    []
                ]
            ]
        , div [ class "media-content" ]
            [ div [ class "content" ]
                [ p [ class "subtitle is-5" ] [ text user.username ]
                , small [] [ text brownbag.date ]
                ]
            ]
        ]
