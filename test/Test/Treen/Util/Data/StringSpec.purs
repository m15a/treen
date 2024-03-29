module Test.Treen.Util.Data.StringSpec (stringUtilSpec) where

import Prelude
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Treen.Util.Data.String

stringUtilSpec :: Spec Unit
stringUtilSpec = describe "Treen.Util.Data.String" do

  describe "lines" do
    it "splits string by their line boundaries" do
      let
        actual = lines "い\nろ\r\nは\rに\x0085ほ\x2028へ\x2029と"
        expected = [ "い", "ろ", "は", "に", "ほ", "へ", "と" ]
      actual `shouldEqual` expected

    it "ignores empty after the last line boundary" do
      {-
         See Haskell's implementation:
         https://hackage.haskell.org/package/base/docs/Prelude.html#v:lines

            The `\n` terminator is optional in a final non-empty line of
            the argument string.
      -}
      let
        actual = lines "A\n"
        expected = [ "A" ]
      actual `shouldEqual` expected

  describe "trimLastEndOfLine" do
    it "removes the last end of line" do
      let
        actual = trimLastEndOfLine "A\n\r\n"
        expected = "A\n"
      actual `shouldEqual` expected

  describe "trimMargin" do

    it "removes the first empty line" do
      let
        actual = trimMargin
          """  
          a"""
        expected = "a"
      actual `shouldEqual` expected

    it "removes each line's margin" do
      let
        actual = trimMargin
          """
           a
          b
             c"""
        expected = " a\nb\n   c"
      actual `shouldEqual` expected

    it "does not remove the last end of line" do
      let
        actual = trimMargin
          """
          a
          """
        expected = "a\n"
      actual `shouldEqual` expected
