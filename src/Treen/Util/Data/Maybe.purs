-- | Miscellaneous helper functions for `Maybe` type manipulation.
module Treen.Util.Data.Maybe
  ( unwrapJust
  ) where

import Prelude
import Data.Maybe (Maybe, fromJust)
import Partial.Unsafe (unsafePartial)

-- | Unwrap data in a `Just`, trusting that it has some content.
unwrapJust :: forall a. Maybe a -> a
unwrapJust x = unsafePartial $ fromJust x
