module Main (..) where

import Html exposing (..)
import CodeMirror exposing (..)
import StartApp.Simple exposing (start)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

codeMirrorView :  String -> Html
codeMirrorView txt  =
  let md =
    { theme = model.theme
  , mode = model.mode
  , height = "auto"
  , lineNumbers = model.lineNumbers
  , lineWrapping = model.lineWrapping
  }


  if (model.theme == "hide") then
    div [] [ text "hidden" ]
  else
    codeMirror (cmConfig model) md txt

