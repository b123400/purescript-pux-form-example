module App.State where

import Prelude
import App.Config (config)
import Data.Newtype (class Newtype)
import Data.Maybe (Maybe(..))
import Data.Lens.Record (prop)
import Data.Symbol (SProxy(..))
import Data.Lens.Iso.Newtype (_Newtype)

import Data.Lens (Lens')
import Pux.Form.Render (class MultipleChoice)

data Gender = Male | Female | Secret
data Food = Rice | Noodle

newtype State = State
  { title :: String
  , name :: String
  , biography :: String
  , age :: Int
  , alive :: Boolean
  , password :: String
  , avatar :: String
  , height :: Number
  , gender :: Gender
  , lunch :: Maybe Food
  }

derive instance newtypeState :: Newtype State _

init :: State
init = State
  { title: config.title
  , name: "hello"
  , biography: "yo"
  , age: 1
  , alive: true
  , password: "hey"
  , avatar: ""
  , height: 0.2
  , gender: Male
  , lunch: Nothing
  }

title :: Lens' State String
title = _Newtype <<< prop (SProxy :: SProxy "title")

name :: Lens' State String
name = _Newtype <<< prop (SProxy :: SProxy "name")

biography :: Lens' State String
biography = _Newtype <<< prop (SProxy :: SProxy "biography")

age :: Lens' State Int
age = _Newtype <<< prop (SProxy :: SProxy "age")

alive :: Lens' State Boolean
alive = _Newtype <<< prop (SProxy :: SProxy "alive")

password :: Lens' State String
password = _Newtype <<< prop (SProxy :: SProxy "password")

avatar :: Lens' State String
avatar = _Newtype <<< prop (SProxy :: SProxy "avatar")

height :: Lens' State Number
height = _Newtype <<< prop (SProxy :: SProxy "height")

gender :: Lens' State Gender
gender = _Newtype <<< prop (SProxy :: SProxy "gender")

lunch :: Lens' State (Maybe Food)
lunch = _Newtype <<< prop (SProxy :: SProxy "lunch")

instance multipleChoiceGender :: MultipleChoice Gender where
  choices = [Male, Female, Secret]

derive instance eqGender :: Eq Gender

instance showGender :: Show Gender where
  show Male = "Male"
  show Female = "Female"
  show Secret = "Secret"

instance multipleChoiceFood :: MultipleChoice Food where
  choices = [Rice, Noodle]

derive instance eqFood :: Eq Food

instance showFood :: Show Food where
  show Rice = "Rice"
  show Noodle = "Noodle"
