module App.State where

import App.Config (config)
import Data.Newtype (class Newtype)
import Data.Show (class Show)
import Data.Eq (class Eq)
import Data.Maybe (Maybe(..))

import Data.Lens (Lens', lens)
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
title = lens (\(State s)-> s.title) (\(State s) val-> State s { title = val })

name :: Lens' State String
name = lens (\(State s)-> s.name) (\(State s) val-> State s { name = val })

biography :: Lens' State String
biography = lens (\(State s)-> s.biography) (\(State s) val-> State s { biography = val })

age :: Lens' State Int
age = lens (\(State s)-> s.age) (\(State s) val-> State s { age = val })

alive :: Lens' State Boolean
alive = lens (\(State s)-> s.alive) (\(State s) val-> State s { alive = val })

password :: Lens' State String
password = lens (\(State s)-> s.password) (\(State s) val-> State s { password = val })

avatar :: Lens' State String
avatar = lens (\(State s)-> s.avatar) (\(State s) val-> State s { avatar = val })

height :: Lens' State Number
height = lens (\(State s)-> s.height) (\(State s) val-> State s { height = val })

gender :: Lens' State Gender
gender = lens (\(State s)-> s.gender) (\(State s) val-> State s { gender = val })

lunch :: Lens' State (Maybe Food)
lunch = lens (\(State s)-> s.lunch) (\(State s) val-> State s { lunch = val })

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
