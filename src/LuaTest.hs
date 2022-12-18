module LuaTest (documentedModule) where

import Data.Version (makeVersion)
import HsLua

documentedModule :: Module HsLua.Exception
documentedModule =
  Module
    { moduleName = "heime",
      moduleDescription = "Utilities for heime and stuff",
      moduleFields =
        [ Field
            { fieldName = "utils",
              fieldDescription = "Utilities",
              fieldPushValue = pushModule nestedModule
            }
        ],
      moduleFunctions = [luaFactorial],
      moduleOperations = []
    }

luaFactorial :: DocumentedFunction HsLua.Exception
luaFactorial =
  defun "factorial"
    ### liftPure (\n -> product [1 .. n])
    <#> factorialParam
    =#> factorialResult
    #? "Calculates the factorial of a number"
    `since` makeVersion [0, 1, 0]
  where
    factorialParam :: Parameter HsLua.Exception Prelude.Integer
    factorialParam = parameter peekIntegral "integer" "n" "number for factorial"
    factorialResult = functionResult pushIntegral "integer" "factorial"

nestedModule :: Module HsLua.Exception
nestedModule =
  Module
    { moduleName = "nested",
      moduleDescription = "Some nested utilities",
      moduleFields =
        [ Field
            { fieldName = "test",
              fieldDescription = "A test field",
              fieldPushValue = pushString "this is a test"
            }
        ],
      moduleFunctions = [],
      moduleOperations = []
    }
