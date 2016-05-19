import Html exposing (..)
import Html.App as App


-- MODEL
type alias Model =
  { title : String
  , label : String
  }

init : String -> String -> Model
init title label =
  Model title label


-- UPDATE
type Msg
  = Title String
  | Label String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Title str -> { model | title = str }
    Label str -> { model | label = str }


-- VIEW
view : Model -> Html Msg
view model =
  div
    []
    [ input [] []
    , text model.label
    ]


main = App.beginnerProgram
  { model = init "" "Sample"
  , update = update
  , view = view
  }
