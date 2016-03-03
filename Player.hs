module Player
(
  Player(..)
  ,move
  ,hit
  ,extra
  ,drink
) where

data Player = Player{ hp :: Int, potions :: Int} deriving (Show,Eq)

move :: Player -> Player
move hero = Player ((hp hero) - 5) (potions hero)

hit :: Player -> Player
hit hero = Player ((hp hero) - 20) (potions hero)

extra :: Player -> Player
extra hero = Player (hp hero) ((potions hero) + 1)

drink :: Player -> Player
drink hero
    | ((hp hero) + 20) > 100   = Player 100 ((potions hero) - 1)
    | otherwise                     = Player ((hp hero) + 20) ((potions hero) - 1)