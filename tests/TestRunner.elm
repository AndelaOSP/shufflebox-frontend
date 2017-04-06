port module TestRunner exposing (..)

import Tests
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)
import Sample


main : TestProgram
main =
    run emit Sample.all


port emit : ( String, Value ) -> Cmd msg
