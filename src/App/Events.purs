module App.Events where

import App.State (State)
import Network.HTTP.Affjax (AJAX)
import Pux (EffModel, noEffects)

data Event = Replace State

type AppEffects fx = (ajax :: AJAX | fx)

foldp :: ∀ fx. Event -> State -> EffModel State Event (AppEffects fx)
foldp (Replace s) _ = noEffects s
