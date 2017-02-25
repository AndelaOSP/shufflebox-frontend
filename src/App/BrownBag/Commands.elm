module App.BrownBag.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field, succeed, andThen, int, string, maybe)
import Json.Decode.Extra exposing ((|:))
import App.BrownBag.Messages exposing (..)
import App.BrownBag.Models exposing (Presenter, Status(..))


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


collectionDecoder : Decode.Decoder (List Presenter)
collectionDecoder =
    Decode.list memberDecoder



{- JSON decoder that returns a `Presenter` record -}


memberDecoder : Decode.Decoder Presenter
memberDecoder =
    succeed Presenter
        |: (field "id" int)
        |: (field "name" string)
        |: (field "email" string)
        |: (field "avatar" string)
        |: (maybe (field "date" string))
        |: statusDecoder



{- Convert field status to Union Type `Status` -}


statusDecoder : Decode.Decoder Status
statusDecoder =
    field "status" string
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
