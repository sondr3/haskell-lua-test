{-# LANGUAGE TypeApplications #-}

module Main (main) where

import HsLua (dofile, openlibs, preloadModule, run)
import qualified HsLua as Lua
import qualified HsLua.Module.Path as Path
import qualified HsLua.Module.System as System
import qualified LuaTest
import System.Environment (getArgs)

main :: IO ()
main = do
  filterFile <- fmap (!! 0) getArgs
  luaStatus <- run @Lua.Exception $ do
    openlibs
    preloadModule System.documentedModule
    preloadModule Path.documentedModule
    preloadModule LuaTest.documentedModule
    dofile filterFile
  print luaStatus
