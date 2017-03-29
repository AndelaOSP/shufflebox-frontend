module App.BrownBag.Commands exposing (..)

import Http as H
import HttpBuilder exposing (withExpect, withJsonBody)
import Json.Decode as Decode exposing (succeed, andThen, maybe)
import Json.Decode.Extra exposing ((|:))
import Json.Encode as Encode
import Common.Utils.Http as Http
import Common.Utils exposing (fork)
import App.Auth.Models exposing (Token)
import App.BrownBag.Messages exposing (Msg(..))
import App.BrownBag.Models exposing (BrownBag, Status(..))
import App.Decoders.Common exposing (..)
import Common.Utils exposing (baseUrl)
import App.Auth.Commands exposing (userDecoder)


brownBagsUrl : String
brownBagsUrl =
    baseUrl ++ "/brownbags/"


undoneUrl : String
undoneUrl =
    brownBagsUrl ++ "not_presented/"


getBrownBags : Token -> Cmd Msg
getBrownBags =
    HttpBuilder.send OnFetchBrownBags
        << withExpect (H.expectJson <| decodeCollection brownbagDecoder)
        << Http.get brownBagsUrl


{-| Get users who've not done brownbag.
-}
getUndone : Token -> Cmd Msg
getUndone =
    HttpBuilder.send OnFetchUndone
        << withExpect (H.expectJson <| decodeCollection userDecoder)
        << Http.get undoneUrl


hydrateBrownbagData : Token -> List (Cmd Msg)
hydrateBrownbagData =
    fork (\( a, b ) -> [ a, b ]) getBrownBags getUndone


{-| JSON decoder that returns a `BrownBag` record
-}
brownbagDecoder : Decode.Decoder BrownBag
brownbagDecoder =
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


shuffleUrl : String
shuffleUrl =
    baseUrl ++ "/shuffle/"


shuffleDataEncoder : Encode.Value
shuffleDataEncoder =
    [ ( "type", Encode.string "brownbag" ) ] |> Encode.object


shuffleBrownbag : Token -> Cmd Msg
shuffleBrownbag =
    HttpBuilder.send OnShuffleBrownbag
        << withJsonBody shuffleDataEncoder
        << withExpect (H.expectJson brownbagDecoder)
        << Http.post shuffleUrl
