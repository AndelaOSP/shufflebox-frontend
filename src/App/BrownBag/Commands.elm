module App.BrownBag.Commands exposing (..)

import Http as H
import HttpBuilder exposing (withExpect)
import Json.Decode as Decode exposing (succeed, andThen, maybe)
import Json.Decode.Extra exposing ((|:))
import Common.Utils.Http as Http
import App.Auth.Models exposing (Token)
import App.BrownBag.Messages exposing (Msg(..))
import App.BrownBag.Models exposing (Presenter, Status(..))
import App.Decoders.Common exposing (decodeCollection, stringDecoder, intDecoder, baseUrl)


brownBagsUrl : String
brownBagsUrl =
    baseUrl ++ "/brownbags/"


getBrownBags : Token -> Cmd Msg
getBrownBags =
    HttpBuilder.send OnFetchBrownBags
        << withExpect (H.expectJson <| decodeCollection memberDecoder)
        << Http.get brownBagsUrl


{-| JSON decoder that returns a `Presenter` record
-}
memberDecoder : Decode.Decoder Presenter
memberDecoder =
    succeed Presenter
        |: (intDecoder "id")
        |: (stringDecoder "name")
        |: (stringDecoder "email")
        |: (stringDecoder "avatar")
        |: (maybe (stringDecoder "date"))
        |: statusDecoder


{-| Convert field status to Union Type `Status`
-}
statusDecoder : Decode.Decoder Status
statusDecoder =
    stringDecoder "status"
        |> andThen decodeStatus


decodeStatus : String -> Decode.Decoder Status
decodeStatus s =
    succeed (status s)


status : String -> Status
status s =
    let
        lowerStatus =
            String.toLower s
    in
        case lowerStatus of
            "notdone" ->
                NotDone

            "done" ->
                Done

            "nextinline" ->
                NextInLine

            _ ->
                NotDone
