module App.Hangouts.Commands exposing (..)

import Http as H
import HttpBuilder exposing (withExpect, withHeader, withJsonBody, send)
import Json.Decode as Decode exposing (Decoder, succeed, string, int)
import Json.Decode.Extra exposing ((|:))
import Json.Encode as Encode exposing (object, string)
import Common.Utils.Http as Http
import Common.Utils exposing (hangoutsUrl, shuffleUrl)
import App.Decoders.Common exposing (..)
import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (Hangout, Group)
import App.Auth.Models exposing (Token, User)
import App.Auth.Commands exposing (userDecoder)


getHangouts : Token -> Cmd Msg
getHangouts =
    HttpBuilder.send OnFetchHangouts
        << withExpect (H.expectJson <| decodeCollection hangoutDecoder)
        << Http.get hangoutsUrl


shuffleHangouts : Token -> Cmd Msg
shuffleHangouts token =
    Http.post shuffleUrl token
        |> withJsonBody hangoutsPayload
        |> withExpect (H.expectJson <| decodeCollection hangoutDecoder)
        |> HttpBuilder.send OnFetchHangouts


hangoutsPayload : Encode.Value
hangoutsPayload =
    object <|
        [ ( "type", Encode.string "hangout" ) ]


hangoutDecoder : Decoder Hangout
hangoutDecoder =
    succeed Hangout
        |: intDecoder "id"
        |: stringDecoder "date"
        |: groupsDecoder "groups"


groupsDecoder : String -> Decoder (List Group)
groupsDecoder =
    decoderFirstField (decodeCollection groupDecoder)


groupDecoder : Decoder Group
groupDecoder =
    succeed Group
        |: intDecoder "id"
        |: membersDecoder "members"


membersDecoder : String -> Decoder (List User)
membersDecoder =
    decoderFirstField (decodeCollection userDecoder)
