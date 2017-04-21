module Models exposing (..)

type alias Kata = {id: Int,  name : String, code: String,  test: String, description: String }
type alias Model = 
 { 
     katas : List Kata,
     kata : Maybe Kata
  }

type Msg
  =  NoOp
     | Add
     | Edit Kata
     | Save Kata
     | Delete Kata
     | Cancel 
     | SetName Kata String
     | SetCode Kata String
     | SetTest Kata String
     | SetDescription Kata String

defaultModel : Model
defaultModel = 
  {
      katas = 
        [{ id= 0,name = "kata 1", code = "var x = 1;", test = "assert(x ==1);", description = "desc 1" },
        { id= 1,name = "kata 2", code = "var y = 1;", test = "assert(y ==2);", description = "desc 2" },
        {id= 2, name = "kata 3", code = "var z = 3;", test = "assert(y ==3);", description = "desc 3" }],
        kata = Nothing
  }

defaultkata : Kata
defaultkata = 
  { id= 0,name = "new", code = "var foo = null", test = "foo is null", description = "default desc" }
        