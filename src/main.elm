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
                | kata = Just defaultkata
          }
          ! []
        Edit kt ->
          { model
                | kata = Just kt
          }
          ! []
        Save  kt ->
          { model
                | kata = Nothing,
                katas = (updateKata model.katas kt)
          }
          ! []
        Delete kt ->
          { model
                | katas = (List.filter (\k -> not(k.id == kt.id))  (updateKata model.katas kt))
          }
          ! []
        Cancel   ->
          { model
                | kata = Nothing                
          }
          ! []
        SetTest kt txt ->
          { model
                | kata = Just (Kata kt.id kt.name kt.code txt kt.description)
          }
          ! []
        SetName kt txt ->
          { model
                | kata = Just (Kata kt.id txt kt.code kt.test kt.description)
          }
          ! []
        SetCode kt txt ->
          { model
                | kata = Just (Kata kt.id kt.name txt kt.test kt.description)
          }
          ! []
        SetDescription kt txt ->
          { model
                | kata = Just (Kata kt.id kt.name kt.code kt.test txt)
          }
          ! []
             
init :  ( Model, Cmd Msg )
init =
  defaultModel  ! []

main : Program Never Model Msg  
main =
  Html.program    
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }


updateKata : List Kata -> Kata -> List Kata
updateKata katas updatedKata =
    let
        pick currentKata =
            if updatedKata.id == currentKata.id then
                updatedKata
            else
                currentKata

        updateList players =
            List.map pick players     
    in
      updateList katas