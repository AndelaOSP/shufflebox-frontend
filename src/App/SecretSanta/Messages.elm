module App.SecretSanta.Messages exposing (..)

import Http
import App.SecretSanta.Models exposing (SecretSanta)


type Msg
    = ListSecretSanta
    | OnFetchSecretSantas (Result Http.Error (List SecretSanta))
