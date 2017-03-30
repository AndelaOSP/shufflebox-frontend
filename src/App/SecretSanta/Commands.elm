module App.SecretSanta.Commands exposing (..)

import Http as H
import HttpBuilder exposing (withExpect)
import Json.Decode exposing (Decoder, succeed)
import Json.Decode.Extra exposing ((|:))
import Common.Utils.Http as Http
import Common.Utils exposing (baseUrl)
import App.SecretSanta.Messages exposing (Msg(..))
import App.Decoders.Common exposing (..)
import App.SecretSanta.Models exposing (SecretSanta)
import App.Auth.Models exposing (Token, User)
import App.Auth.Commands exposing (userDecoder)
import App.Decoders.Common exposing (decoderFirstField)


secretSantaUrl : String
secretSantaUrl =
    baseUrl ++ "/santas/"


getSecretSantas : Token -> Cmd Msg
getSecretSantas =
    HttpBuilder.send OnFetchSecretSantas
        << withExpect (H.expectJson <| decodeCollection secretSantaDecoder)
        << Http.get secretSantaUrl


secretSantaDecoder : Decoder SecretSanta
secretSantaDecoder =
    succeed SecretSanta
        |: intDecoder "id"
        |: stringDecoder "date"
        |: decoderFirstField userDecoder "santa"
        |: decoderFirstField userDecoder "giftee"
