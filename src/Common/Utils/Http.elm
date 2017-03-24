module Common.Utils.Http exposing (get, post, put)

{-| A collection of HTTP utilities for convenience.

    These utilities are thin wrappers around the HTTP methods defined in
    HttpBuilder. Yield methods with the authorization header. The yielded
    HttpBuilder.RequestBuilder type can be piped along and enhanced with
    other fields as defined in the library.
    http://package.elm-lang.org/packages/lukewestby/elm-http-builder/5.1.0/
-}

import String
import HttpBuilder exposing (withHeader, RequestBuilder)
import App.Auth.Models exposing (Token)


type alias Url =
    String


{-| Take a token and reformat it to conform to the shape expected by the backend.
    Default to assuming an empty token.
-}
appendJWT : Token -> String
appendJWT =
    String.append "JWT " << Maybe.withDefault ""


{-| Add an authorization header to a HTTP method
-}
authorizeMethod : (String -> RequestBuilder ()) -> Url -> Token -> RequestBuilder ()
authorizeMethod method url token =
    method url
        |> withHeader "Authorization" (appendJWT token)


{-| Yield an authenticated post request. Thin wrapper around`HttpBuilder.post`.
-}
post : Url -> Token -> RequestBuilder ()
post =
    authorizeMethod HttpBuilder.post


{-| Yield an authenticated get request. Thin wrapper around`HttpBuilder.get`.
-}
get : Url -> Token -> RequestBuilder ()
get =
    authorizeMethod HttpBuilder.get


{-| Yield an authenticated put request. Thin wrapper around`HttpBuilder.put`.
-}
put : Url -> Token -> RequestBuilder ()
put =
    authorizeMethod HttpBuilder.put
