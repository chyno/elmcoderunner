module View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)
import Views.Static exposing (..)
import Views.Kata exposing (..)
import Display exposing (..)


view : Model -> Html Msg
view model =
  div []
  [
    textarea [][text "code goes her"],
    Views.Static.header,
    h1 [] [text "Current Katas"],
    div [class "jumbotron"] [
      div [class "container"]
      [
        div [ class "form-group" ]
        [ 
        case  model.kata  of
          Nothing ->
            katasview model.katas
          _ ->
             katadetailsview  (Maybe.withDefault defaultkata model.kata)
        ]

      ]
    ]
  ]
 
katasview : List Kata -> Html.Html Msg
katasview katas =
    div []
      [
        table [class "table table-condensed"]
        [
          thead [] [tr [] [
                          th [] [],
                          th [] [],
                          th [] [text "name"],
                          th [] [text "description"] 
          ]],
          tbody []
          (katas |>
            List.map kataview)  
        ],
        button
          [class "btn btn-primary", onClick (Add)]
          [text "Add"]
      ]


kataview : Kata -> Html.Html Msg
kataview kata =
  tr[]
  [
    td[] [ button
          [class "btn btn-primary" , type_ "button", onClick (Edit kata)]
          [text "Edit"]],
    td[] [ button
          [class "btn btn-primary" , type_ "button", onClick (Delete kata)]
          [text "Delete"]],
    td [] [text kata.name],
    td [] [text kata.description]
    
  ]
  
