import PrimaryScreen
import SecondaryScreen

import Html exposing (..)
import Html.App as App


-- MODEL
type Model =
	{ primaryModel : PrimaryScreen.Model
	, secondaryModel : SecondaryScreen.Model
	}

init p s = (Model p s, Cmd.none)


-- UPDATE
port setStorage : Model -> Cmd msg

type Msg
	= PrimaryChange String
	| SecondaryChange String
	| DatabaseChange

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =