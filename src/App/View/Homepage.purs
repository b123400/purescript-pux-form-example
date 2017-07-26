module App.View.Homepage where

import Prelude hiding (div)
import App.Events (Event(..))
import App.State
  (State(..)
  , Gender(..)
  , title
  , name
  , biography
  , age
  , alive
  , password
  , avatar
  , height
  , gender
  , lunch )
import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, p, b)
import Text.Smolder.Markup (text)

import Pux.Form (form, (.|), (.\), (./))
import Pux.Form.Render
  (asTextArea
  , asPassword
  , asFile
  , asRange
  , asRangeNum
  , asDropdown
  , asDropdown'
  , withNothing )

view :: State -> HTML Event
view (s@State s') =
  div do
    p $ text ("Title: "        <>      s'.title)
    p $ text ("Name: "         <>      s'.name)
    p $ text ("Age: "          <> show s'.age)
    p $ text ("Biography: "    <>      s'.biography)
    p $ text ("Password: "     <>      s'.password)
    p $ text ("Alive? "        <> show s'.alive)
    p $ text ("Avatar: "       <>      s'.avatar)
    p $ text ("Height:"        <> show s'.height)
    p $ text ("Your gender:"   <> show s'.gender)
    p $ text ("Your lunch:"    <> show s'.lunch)
    form s fields Replace
  where fields = title                               .\ "Enter title"
              <> age                                  .\ "Enter age"
              <> (asRange 10 100 2 >>> age)            .\ "Input age as Range"
              <> name                                   .| (\d-> (b $ text "before") *> d *> (b $ text "after"))
              <> name                                  ./ (b $ text "Enter name")
              <> (asPassword >>> password)             .\ "Enter your password"
              <> (asTextArea >>> biography)             .\ "Enter biography in text area"
              <> alive                                   .\ "Are you alive?"
              <> (asFile >>> avatar)                      .\ "Choose your avatar"
              <> height                                    .\ "Height"
              <> (asRangeNum 0.1 10.0 0.2 >>> height)       .\ "Height"
              <> (asDropdown >>> gender)                     .\ "Your gender?"
              <> (asDropdown' [Male, Female] >>> gender)      .\ "Your gender?"
              <> (asDropdown >>> withNothing >>> lunch)        .\ "Your gender?"
