module Player
(
  Player(..)
  ,move
  ,hit
  ,drink
) where

data Player = Player{ hp :: Int, potions :: Int} deriving (Show,Eq)
 
--tellPlayer :: Player -> String  
--tellPlayer (Player {hp = h, potions = p}) = "Player has " ++ show h ++ " HP and " ++ show p ++ " potions"  

move::Player->Player
move hero  = Player ((hp hero) - 5) (potions hero)

hit::Player->Player
hit hero  = Player ((hp hero) - 20) (potions hero)

drink::Player->Player
drink hero  = Player ((hp hero) + 20) (potions hero)



