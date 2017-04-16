import Task
import String
import Models exposing (..)
import View exposing (..)
import Html exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
     case msg of
        NoOp ->
            model ! []

        Add ->
          { model
                | kata = Just {id = -1, name="", code = "", test = ""}
          }
          ! []
        Edit kt ->
          { model
                | kata = Just kt
          }
          ! []
           


  
init :  ( Model, Cmd Msg )
init =
  defaultModel  ! []

    
main =
  Html.program  
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }