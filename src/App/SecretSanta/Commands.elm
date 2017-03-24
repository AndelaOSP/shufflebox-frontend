module App.SecretSanta.Commands exposing (..)

import Http as H
import HttpBuilder exposing (withExpect)
import Json.Decode exposing (Decoder, succeed)
import Json.Decode.Extra exposing ((|:))
import Common.Utils.Http as Http
import App.SecretSanta.Messages exposing (Msg(..))
import App.Decoders.Common exposing (..)
import App.SecretSanta.Models exposing (SecretSanta, Pair, Person)
import App.Auth.Models exposing (Token)


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
        |: stringDecoder "date"
        |: pairsDecoder "pairs"


pairsDecoder : String -> Decoder (List Pair)
pairsDecoder =
    decoderFirstField (decodeCollection pairDecoder)


pairDecoder : Decoder Pair
pairDecoder =
    succeed Pair
        |: stringDecoder "id"
        |: personDecoder "santa"
        |: personDecoder "giftee"


personDecoder : String -> Decoder Person
personDecoder =
    decoderFirstField decodePerson


decodePerson : Decoder Person
decodePerson =
    succeed Person
        |: stringDecoder "user_id"
        |: stringDecoder "name"
        |: stringDecoder "email"
        |: stringDecoder "avatar"
