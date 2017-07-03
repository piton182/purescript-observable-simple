module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (Error)
import RxJS.Observable (range, subscribe, Observable)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = subscribe subscriber numbers
  where
    numbers = range 1 10
    subscriber =
      { next: log <<< append "Next: " <<< show
      , error: log <<< append "Error: " <<< show
      , completed: const $ log "Completed."
      }
