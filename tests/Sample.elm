module Sample exposing (..)
import Test exposing(..)
import Expect
all : Test
all =
  describe "New Test Case"
      [ sampleTest]

sampleTest : Test
sampleTest =
    describe "Sample 1"
    [ test "New Test" <|
      \() ->
        Expect.equal(3 + 3) 7]
