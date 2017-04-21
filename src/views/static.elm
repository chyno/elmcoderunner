module Views.Static exposing (..)

import Dom
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

header  :   Html a
header  =
nav [class "navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse"]
[
    button [class "navbar-toggler navbar-toggler-right", type "button", data-toggle "collapse" data-target "#navbarsExampleDefault" aria-controls"navbarsExampleDefault"]
    [
        span [class "navbar-toggler-icon"][]
    ],
    a [class "navbar-brand", href "#"][text "Chyno Test App"],
    div [class "collapse navbar-collapse" id "navbarsExampleDefault"]
        [
            ul [class "navbar-nav mr-auto"] 
               [li [class "nav-item active"][ a [class "nav-link" href "#"][text "Home"]]],
            ,ul [class "navbar-nav mr-auto"] 
               [li [class "nav-item active"][ a [class "nav-link" href "#"][text "User Kata"]]],
            ul [class "navbar-nav mr-auto"] 
               [li [class "nav-item active"][ a [class "nav-link" href "#"][text "Kata"]]],
               
        ]
]
   