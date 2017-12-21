module App.Events where

import App.State (State)
import Pux (EffModel, noEffects)

data Event = Replace State

-- type AppEffects fx = (| fx)

foldp :: ∀ fx. Event -> State -> EffModel State Event fx
foldp (Replace s) _ = noEffects s
