module Player
(
  Player(..)
  ,move
  ,extra
  ,hit
  ,drink
--  ,numPots
) where

data Player = Player{ hp :: Int, potions :: Int} deriving (Show,Eq)

move :: Player -> Player
move hero = Player ((hp hero) - 5) (potions hero)

extra :: Player -> Player
extra hero = Player (hp hero) ((potions hero) + 1)

hit :: Player -> Player
hit hero = Player ((hp hero) - 20) (potions hero)

drink :: Player -> Player
drink hero
    | ((hp hero) + 20) > 100   = Player 105 ((potions hero) - 1)
    | otherwise                     = Player ((hp hero) + 25) ((potions hero) - 1)

--numPots :: Player -> Int
--numPots hero = potions hero