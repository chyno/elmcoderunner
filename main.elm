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

defaultModel : Model
defaultModel = 
  [{name = "kata 1", code = "var x = 1;", test = "assert(x ==1);" },
    {name = "kata 2", code = "var y = 1;", test = "assert(y ==2);" },
     {name = "kata 3", code = "var z = 3;", test = "assert(y ==3);" }
 ] 

init :  ( Model, Cmd Msg )
init =
  defaultModel  ! []

displaykatas :  Model -> Html.Html msg
displaykatas kts = 
    kts
       |> List.map (\l -> li [] [ text l.name ])
       |> ul []
 

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
   ( model, Cmd.none ) 

view : Model -> Html Msg
view model =
    ul []
      (model |>
        List.map (\x -> li [] [text x.name]))
    
main =
  Html.program  
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }