module SoundCloud.DummyTest where

import Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

hprop_involutive :: (MonadTest m, Eq a, Show a) => (a -> a) -> a -> m ()
hprop_involutive f x =
  f (f x) === x
