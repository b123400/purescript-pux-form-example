module Main where

import Prelude
import App.Events (Event(), foldp)
import App.State (State, init)
import App.View.Layout (view)
-- import Control.Monad.Eff (Eff)
import Effect (Effect)
import Pux (App, start)
import Pux.DOM.Events (DOMEvent)
import Pux.Renderer.React (renderToDOM)

type WebApp = App (DOMEvent -> Event) Event State

main :: String -> State -> Effect WebApp
main url state =

  -- | Start the app.
  start
    { initialState: state
    , view
    , foldp
    , inputs: [] } >>= \app->

  -- | Render to the DOM
  renderToDOM "#app" app.markup app.input

  -- | Return app to be used for hot reloading logic in support/client.entry.js
  *> pure app

initialState :: State
initialState = init
