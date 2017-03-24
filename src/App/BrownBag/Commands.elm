module App.BrownBag.Commands exposing (..)

import Http as H
import HttpBuilder exposing (withExpect)
import Json.Decode as Decode exposing (succeed, andThen, maybe)
import Json.Decode.Extra exposing ((|:))
import Common.Utils.Http as Http
import App.Auth.Models exposing (Token)
import App.BrownBag.Messages exposing (Msg(..))
import App.BrownBag.Models exposing (BrownBag, Status(..))
import App.Decoders.Common exposing (..)
import App.Auth.Commands exposing (userDecoder)


brownBagsUrl : String
brownBagsUrl =
    baseUrl ++ "/brownbags/"


getBrownBags : Token -> Cmd Msg
getBrownBags =
    HttpBuilder.send OnFetchBrownBags
        << withExpect (H.expectJson <| decodeCollection memberDecoder)
        << Http.get brownBagsUrl


{-| JSON decoder that returns a `BrownBag` record
-}
memberDecoder : Decode.Decoder BrownBag
memberDecoder =
    succeed BrownBag
        |: intDecoder "id"
        |: stringDecoder "date"
        |: statusDecoder
        |: decoderFirstField userDecoder "user"


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
            "not_done" ->
                NotDone

            "done" ->
                Done

            "next_in_line" ->
                NextInLine

            _ ->
                NotDone
