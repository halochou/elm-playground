import PrimaryScreen
import SecondaryScreen

import Html exposing (..)
import Html.App as App


-- MODEL
type alias Model =
  { primaryModel : PrimaryScreen.Model
  , secondaryModel : SecondaryScreen.Model
  }

init p s = Model (PrimaryScreen.init p) (SecondaryScreen.init s)

-- UPDATE
type Msg
  = PrimaryChange PrimaryScreen.Msg
  | SecondaryChange SecondaryScreen.Msg

update : Msg -> Model -> Model
update msg model =
  case msg of
    PrimaryChange msg -> { model | primaryModel = PrimaryScreen.update msg model.primaryModel }
    SecondaryChange msg -> { model | secondaryModel = SecondaryScreen.update msg model.secondaryModel }


-- VIEW
view : Model -> Html Msg
view model =
  div
    []
    [ App.map PrimaryChange (PrimaryScreen.view model.primaryModel)
    , App.map SecondaryChange (SecondaryScreen.view model.secondaryModel)
    ]


main = App.beginnerProgram
  { model = init "" ""
  , update = update
  , view = view
  }
