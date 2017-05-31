-- Reverse a string and add a prefix to it
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { content : String
  , prefix: String
  }

model : Model
model =
  { content = ""
  , prefix = "prefix" }


-- UPDATE

type Msg
  = ChangeContent String | ChangePrefix String

update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeContent newContent ->
      { model | content = newContent }
    ChangePrefix newPrefix ->
      { model | prefix = newPrefix }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", onInput ChangeContent ] []
    , input [ value model.prefix, onInput ChangePrefix ] []
    , div [] [ text (model.prefix ++ String.reverse model.content) ]
    ]
