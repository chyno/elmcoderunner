module CodeMirror exposing (CmConfig, codeMirror) 
 
import Html exposing (..)
import Html exposing (Html)
--import Native.CodeMirror
import Models exposing (..)

type alias Config =
  { value : String
  , cmConfig : CmConfig
  }


type alias CmConfig =
  { theme : String
  , mode : String
  , height : String
  , lineNumbers : Bool
  , lineWrapping : Bool
  }


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

codeMirror : Config  -> Html msg
codeMirror config   =
  div[][text "code mirror text"]
  --Native.CodeMirror.codeMirror config


--codeMirror : CmConfig -> (String -> Signal.Message) -> String -> Html
--codeMirror config msgCreator code =
 -- codeMirror' { cmConfig = config, value = code } msgCreator
