module Views.Kata exposing (..)
import Models exposing (..)
import CodeMirror exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

inputStyle =
  style [ ( "width", "100%" ), ( "margin-bottom", "10px" ) ]


cmConfig : Model -> CmConfig
cmConfig model =
  { theme = "monokai"
  , mode = "elm"
  , height = "auto"
  , lineNumbers = True
  , lineWrapping = True
  }

 

katadetailsview :   Kata -> Html.Html Msg
katadetailsview kata =
    div []
    [
       div [class "form-group"][
       label  [  ] [ text "Name" ] ,
       input [ class "form-control", value kata.name, onInput (SetName kata)][]
       ],
        div [class "form-group"][
       label  [  ] [ text "Code" ] ,
       input [ class "form-control",  value kata.code, onInput (SetCode kata)][]
       ],
        div [class "form-group"][
       label  [ ] [ text "Test" ] ,
       input [class "form-control", value kata.test, onInput (SetTest kata)][]
       ],
        div [class "form-group"][
       label  [ ] [ text "Instructions" ] ,
       textarea [class "form-control", value kata.test, onInput (SetDescription kata)][]
       ],

      -- codeMirror cmConfig   (Signal.message add << CodeChange) kata.code,

       div [class "form-group"][
       button
          [class "btn btn-primary" , type_ "button", onClick (Save kata)]
          [text "Save"] ,
       button
          [class "btn btn-primary", type_ "button", onClick (Cancel)]
          [text "Cancel"]  ] 
    ]



