port module SecondaryScreen exposing (Model, Msg, init, update, view)
import Html exposing (..)
import Html.App as App


-- MODEL
type alias Model =
  { title : String
  , label : String
  }

init : String -> String -> ( Model, Cmd Msg )
init title label =
  (Model title label, Cmd.none)


-- UPDATE
type Msg
  = Input String

port publish : String -> Cmd msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Input str -> ( { model | title = str }, publish str )


-- VIEW
view : Model -> Html Msg
view model =
  div
    []
    [ input [] []
    , text model.label
    ]
