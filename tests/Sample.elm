module Sample exposing (..)
import Test exposing(..)
import Expect


sampleTest : Test
sampleTest =
    describe "Sample 1"
    [ test "New Test" <|
      \() ->
        Expect.equal(3 + 3) 7]
