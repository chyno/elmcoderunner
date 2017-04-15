import Html exposing (..)
import Html.Attributes exposing (class)
import Navigation exposing (Location)
type alias Kata = { name : String, code: String,  test: String }

getkatas :  List Kata
getkatas   = 
   [{name = "kata 1", code = "var x = 1;", test = "assert(x ==1);" },
    {name = "kata 2", code = "var y = 1;", test = "assert(y ==2);" },
     {name = "kata 3", code = "var z = 3;", test = "assert(y ==3);" }
   ] 


displaykatas : List Kata -> Html.Html msg
displaykatas kts = 
    kts
       |> List.map (\l -> li [] [ text l.name ])
       |> ul []
 
init : Location -> ( Kata, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchPlayers )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
   ( model, Cmd.none ) 

view : Model -> Html Msg
view model =
    div []
        [ text  "hello world" ]

main =
  Navigation.program Msgs.OnLocationChange
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }