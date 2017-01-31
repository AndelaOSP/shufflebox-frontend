module BrownBag.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field, succeed, andThen, int, string)
import Json.Decode.Extra exposing ((|:))
import BrownBag.Messages exposing (..)
import BrownBag.Models exposing (BrownBag, BrownBagStatus(..))


baseUrl : String
baseUrl =
    "http://localhost:4000"


brownBagsUrl : String
brownBagsUrl =
    baseUrl ++ "/brownbags"


getBrownBags : Cmd Msg
getBrownBags =
    Http.get brownBagsUrl collectionDecoder
        |> Http.send OnFetchAll



{- Delegate decoding each member of a list to `memberDecoder` -}


collectionDecoder : Decode.Decoder (List BrownBag)
collectionDecoder =
    Decode.list memberDecoder



{- JSON decoder that returns a `BrownBag` record -}


memberDecoder : Decode.Decoder BrownBag
memberDecoder =
    succeed BrownBag
        |: (field "id" int)
        |: (field "name" string)
        |: (field "email" string)
        |: (field "avatar" string)
        |: (field "date" string)
        |: statusDecoder


statusDecoder : Decode.Decoder BrownBagStatus
statusDecoder =
    field "status" string
        |> andThen decodeStatus


decodeStatus : String -> Decode.Decoder BrownBagStatus
decodeStatus status =
    succeed (brownBagStatus status)


brownBagStatus : String -> BrownBagStatus
brownBagStatus status =
    case status of
        "notDone" ->
            NotDone

        "Done" ->
            Done

        "nextInLine" ->
            NextInLine

        _ ->
            NotDone
