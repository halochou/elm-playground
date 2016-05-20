module SecondaryScreen exposing (Model, Msg, init, update, view)
import Html exposing (..)
import Html.App as App
import Html.Events exposing (onInput)


-- MODEL
type alias Model =
  { title : String
  }

init : String -> Model
init title =
  Model title


-- UPDATE
type Msg
  = Input String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Input str -> { model | title = str }


-- VIEW
view : Model -> Html Msg
view model =
  div
    []
    [ input [onInput Input] []
    , text "Secondary: "
    , text model.title
    ]

main = App.beginnerProgram
  { model = init ""
  , update = update
  , view = view
  }
