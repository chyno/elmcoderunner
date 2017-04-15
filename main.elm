import Dom
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Task
import String

type alias Kata = { name : String, code: String,  test: String }
type alias Model = List Kata

type Msg
    = NoOp
    | Add
    

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
     case msg of
        NoOp ->
            model ! []

        Add ->
          ({name = "New kata", code = "var x = 100;", test = "assert(x ==1);" }::model) ! []

defaultModel : Model
defaultModel = 
  [{name = "kata 1", code = "var x = 1;", test = "assert(x ==1);" },
    {name = "kata 2", code = "var y = 1;", test = "assert(y ==2);" },
     {name = "kata 3", code = "var z = 3;", test = "assert(y ==3);" }
 ] 

init :  ( Model, Cmd Msg )
init =
  defaultModel  ! []




view : Model -> Html Msg
view model =
    div []
      [
          h1 [] [text "Current Katas"],
          ul []
      (model |>
        List.map (\x -> li [] [text x.name])),
        button
          [onClick (Add)]
          [text "Add"]

      ]   
    
main =
  Html.program  
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }