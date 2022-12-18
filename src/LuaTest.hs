module LuaTest (documentedModule) where

import HsLua

documentedModule :: Module HsLua.Exception
documentedModule =
  Module
    { moduleName = "heime",
      moduleDescription = "Utilities for heime and stuff",
      moduleFields = [],
      moduleFunctions = [luaFactorial],
      moduleOperations = []
    }

luaFactorial :: DocumentedFunction HsLua.Exception
luaFactorial =
  defun "factorial"
    ### liftPure (\n -> product [1 .. n])
    <#> factorialParam
    =#> factorialResult
  where
    factorialParam :: Parameter HsLua.Exception Prelude.Integer
    factorialParam = parameter peekIntegral "integer" "n" "number for factorial"
    factorialResult = functionResult pushIntegral "integer" "factorial"
