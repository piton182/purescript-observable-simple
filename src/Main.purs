module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import RxJS.Observable (range, subscribeNext)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  _ <- subscribeNext (log <<< append "Next: " <<< show) numbers
  pure unit
    where
      numbers = range 1 10
