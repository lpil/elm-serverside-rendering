port module Main exposing (main)

import Html.App
import Html exposing (..)


type alias Flags =
    { text : Maybe String
    }


type alias Model =
    { text : Maybe String
    }


type Msg
    = Noop


port initialized : String -> Cmd msg


main : Program Flags
main =
    Html.App.programWithFlags
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }


subscriptions : Model -> Sub a
subscriptions model =
    Sub.none


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( flags, initialized "Ok" )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model.text of
        Nothing ->
            h1 [] [ text "Huh? Say something" ]

        Just value ->
            h1 [] [ text value ]
