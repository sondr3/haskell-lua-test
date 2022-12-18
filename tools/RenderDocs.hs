{-# LANGUAGE TypeApplications #-}

module Main (main) where

import Data.Text
import HsLua.Packaging.Rendering (render)
import LuaTest qualified

main :: IO ()
main = putStrLn . unpack $ render LuaTest.documentedModule
