module BrownBag.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field, succeed, andThen, int, string, maybe)
import Json.Decode.Extra exposing ((|:))
import BrownBag.Messages exposing (..)
import BrownBag.Models exposing (BrownBagPresenter, BrownBagStatus(..))


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


collectionDecoder : Decode.Decoder (List BrownBagPresenter)
collectionDecoder =
    Decode.list memberDecoder



{- JSON decoder that returns a `BrownBagPresenter` record -}


memberDecoder : Decode.Decoder BrownBagPresenter
memberDecoder =
    succeed BrownBagPresenter
        |: (field "id" int)
        |: (field "name" string)
        |: (field "email" string)
        |: (field "avatar" string)
        |: (maybe (field "date" string))
        |: statusDecoder



{- Convert field status to Uniion Type `BrownBagStatus` -}


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
