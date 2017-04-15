import Dom
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Task
import String

type alias Kata = {id: Int,  name : String, code: String,  test: String }
type alias Model = 
 { 
     katas : List Kata,
     showList : Bool
 
  }

type Msg
    = NoOp
    | Add
   
    

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
     case msg of
        NoOp ->
            model ! []

        Add ->
          { model
                | showList = False
                , katas =   model.katas ++ [ {id = 99, name="", code = "", test = ""} ]
            }
                ! []

defaultModel : Model
defaultModel = 
  {
      katas = 
        [{ id= 0,name = "kata 1", code = "var x = 1;", test = "assert(x ==1);" },
        { id= 1,name = "kata 2", code = "var y = 1;", test = "assert(y ==2);" },
        {id= 2, name = "kata 3", code = "var z = 3;", test = "assert(y ==3);" }],
        showList = True
  }
   

init :  ( Model, Cmd Msg )
init =
  defaultModel  ! []




view : Model -> Html Msg
view model =
    div []
    [
      h1 [] [text "Current Katas"],
      div [style [("visibility", (model |>  \x -> if x.showList then "visible" else "hidden" )) ]]
      [
        ul []
          (model.katas |>
            List.map (\x -> li [] [text x.name])),
        button
          [onClick (Add)]
          [text "Add"]
      ],   
      div [style [("visibility",  (model |>  \x -> if x.showList then "hidden" else "visible" ) )]]
        [
          div [][text "kata detals go here"]
           
        ]
      ]   
    
main =
  Html.program  
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }