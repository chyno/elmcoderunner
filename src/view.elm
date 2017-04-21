module View exposing (..)
import Dom
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)
import Views.Static exposing (..)
view : Model -> Html Msg
view model =
  div []
  [
    h1 [] [text "Current Katas"],
    Views.Static.header,

     div [ class "form-group" ]
      [ 
        case  model.kata  of
          Nothing ->
            katasview model.katas
          _ ->
             katadetailsview  (Maybe.withDefault defaultkata model.kata)
      ]
  ]
 
 
katasview : List Kata -> Html.Html Msg
katasview katas =
    div []
      [
        table [class "table"]
        [
          thead [] [tr [] [
                          th [] [text "name"],
                          th [] [text "code"], 
                          th [] [text "test"],
                          th [] []
          ]],
          tbody []
          (katas |>
            List.map kataview)
          
        ]
         ,
        button
          [onClick (Add)]
          [text "Add"]
      ]

katadetailsview :   Kata -> Html.Html Msg
katadetailsview kata =
    div [class "form-group" ]
    [
       div [class "row"][
       label  [ class "col-sm-2 control-label" ] [ text "Name" ] ,
       input [ placeholder "Assertion text", class "col-sm-10", value kata.name, onInput (SetName kata)][]
       ],
        div [class "row"][
       label  [ class "col-sm-2 control-label" ] [ text "Code" ] ,
       input [ placeholder "Assertion text", class "col-sm-10", value kata.code, onInput (SetCode kata)][]
       ],
        div [class "row"][
       label  [ class "col-sm-2 control-label" ] [ text "Test" ] ,
       input [ placeholder "Assertion text", class "col-sm-10", value kata.test, onInput (SetTest kata)][]
       ],

       div [class "row"][
       button
          [class "btn btn-primary" , type_ "button", onClick (Save kata)]
          [text "Save"] ,
       button
          [class "btn btn-primary", type_ "button", onClick (Cancel)]
          [text "Cancel"]  ] 
    ]

kataview : Kata -> Html.Html Msg
kataview kata =
  tr[]
  [
    td [] [text kata.name],
    td [] [text kata.code],
    td [] [text kata.test],
    td[] [ button
          [class "btn btn-primary" , type_ "button", onClick (Edit kata)]
          [text "Manage"]]
  ]
  
       