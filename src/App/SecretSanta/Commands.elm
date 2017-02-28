module App.SecretSanta.Commands exposing (..)

import Http
import Json.Decode exposing (Decoder, succeed, field)
import Json.Decode.Extra exposing ((|:))
import App.SecretSanta.Messages exposing (Msg(..))
import App.Decoders.Common exposing (..)
import App.SecretSanta.Models exposing (SecretSanta, Pair, Person)


secretSantaUrl : String
secretSantaUrl =
    baseUrl ++ "/secretsantas"


getSecretSantas : Cmd Msg
getSecretSantas =
    Http.get secretSantaUrl (decodeCollection secretSantaDecoder)
        |> Http.send OnFetchSecretSantas


secretSantaDecoder : Decoder SecretSanta
secretSantaDecoder =
    succeed SecretSanta
        |: stringDecoder "date"
        |: (field "pairs" (decodeCollection pairDecoder))


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
