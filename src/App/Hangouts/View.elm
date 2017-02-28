module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)


view : Html msg
view =
    div [ class "table" ]
        [ table []
            [ tr [] [ th [] [ text "HANGOUTS" ] ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            , tr []
                [ img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                , text "James Kinuthia"
                ]
            ]
        , div [ class "hangout--button" ]
            [ button []
                [ img [ src "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1" ] []
                , b [] [ text "SHUFFLE" ]
                ]
            ]
        ]
