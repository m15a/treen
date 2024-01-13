module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Aff (launchAff_)
-- import Test.Spec.Discovery (discover)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

import Test.Treen.Data.Lineage.Spec (lineageSpec)

main :: Effect Unit
main = launchAff_ $ runSpec [ consoleReporter ] do
  lineageSpec
