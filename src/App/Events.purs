module App.Events where

import App.State (State)
import Pux (EffModel, noEffects)

data Event = Replace State

foldp :: Event -> State -> EffModel State Event
foldp (Replace s) _ = noEffects s
