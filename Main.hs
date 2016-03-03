module Main where
import Player

status :: Player -> IO()
status (Player {hp = h, potions = p}) = do      
                                            let character = Player h p
                                            if p==0 then putStrLn ("Player has " ++ (show h) ++ " HP and " ++ (show p) ++ " potions")
                                            else do putStrLn "Would you like to drink a potion? YES or NO?"
                                                    input <- getLine
                                                    if input == "STATUS" then status character
                                                    else if input == "YES" then do let newPlayer = drink character
                                                                                   status newPlayer
                                                    else if input == "NO" then putStrLn ""
                                                    else putStrLn "Command not recognized. Please try again."
                                                    status character

 

-- "global" variable
player :: Player
player = Player 100 0

main = do
                putStrLn("Welcome to EK4!")
                putStrLn("What is your name?")
                name <- getLine
                putStrLn("\nHello " ++ name ++ "!\n") 
                putStrLn("If you wish to view these stats during any point of the game, type in \"STATUS\".")
                putStrLn("You must type all commands and actions in capital letters.")
                putStrLn("If you wish to drink a potion, first type in Status and follow the instructions given.")
                putStrLn("In this game, every time you perform an action you will lose HP. When your HP hits 0, you will die and the game will end.")
                putStrLn("Now, let's begin...")
                putStrLn("--------------------------------------------------------------------------------------------------------------------------------------------")
                putStrLn("                                                                Level 1");
                putStrLn("--------------------------------------------------------------------------------------------------------------------------------------------")
                putStrLn("ZZZzzz...\nYou are sleeping peacefully, dreaming of summer vacation, when suddenly you are awakened by a bright, annoying light flashing through the window, directly at your face.")
                putStrLn("\"Why is it so bright...?!\" you gripe as you pull your covers over your head, trying to ignore the light and fall back asleep.")
                putStrLn("However, your attempts turn out to be futile as you begin to hear a series of high-pitched noises.")
                putStrLn("You decide that you've had enough and get out of bed to check the window for the source of the disturbance, only to realize that the light shining through your window is making it too bright to see anything outside.")
                putStrLn("As you stand next to your window clad only in your PJs wondering what you should do, the high-pitched noises begin to fade as you hear a voice.")
                putStrLn("\"" ++ name ++ "\" a soft, gentle voice calls out.")
                putStrLn("You look around, trying to pinpoint the location of the voice.")
                putStrLn("\"This voice is hauntingly beautiful... and... familiar...?\" you think as you being to feel compelled to track down its owner.")
                putStrLn("As you begin to walk out of your room, the light behind you begins to slowly fade away.")
                doChoice1 player

doChoice1 character = do
                                        putStrLn "\n\"Alright\" you think to yourself \"Where should I check out first? Should I check out the KITCHEN, check out the DOG HOUSE, or check out the BACKYARD?\""
                                        input <- getLine
                                        if input == "STATUS" then status character
                                        else if input == "KITCHEN" then goToKitchen character
                                        else if input == "DOG HOUSE" then goToDogHouse character
                                        else if input == "BACKYARD" then goToBackyard character
                                        else putStrLn "Command not recognized. Please try again."
                                        doChoice1 character

goToKitchen character = do
                                            let newPlayer = move character
                                            putStrLn "\nYou walk into the kitchen.\n\"Alright\" you think to yourself \"Do I want to look inside the SINK, check out the DOG HOUSE, or check out the BACKYARD?\""
                                            input <- getLine
                                            if input == "STATUS" then status newPlayer
                                            else if input == "SINK" then goToSink newPlayer
                                            else if input == "DOG HOUSE" then goToDogHouse newPlayer
                                            else if input == "BACKYARD" then goToBackyard newPlayer
                                            else putStrLn "Command not recognized. Please try again."
                                            goToKitchen character

goToSink character = do
                                        let newPlayer = move character
                                        putStrLn "\nYou look over to your sink and find a bunch of dirty dishes. \"I should've cleaned those hours ago...\" you think to yourself"
                                        putStrLn "\"Do I want to check out the DOG HOUSE, or check out the BACKYARD\"?\n"
                                        input <- getLine
                                        if input == "STATUS" then status newPlayer
                                        else if input == "DOG HOUSE" then goToDogHouse newPlayer
                                        else if input == "BACKYARD" then goToBackyard newPlayer
                                        else putStrLn "Command not recognized. Please try again."
                                        goToSink character

goToDogHouse character = do
                                                let newPlayer = move character
                                                putStrLn "\n\"Blue?\" you call out as you walk out the front door towards the dog house."
                                                putStrLn "You hear your dog, Blue, trotting towards you with something in his mouth."
                                                putStrLn "\"Should I take the ITEM, check out the KITCHEN, or check out the BACKYARD?\" you wonder to yourself as you absent-mindedly pet Blue on the head."
                                                input <- getLine
                                                if input == "STATUS" then status newPlayer
                                                else if input == "ITEM" then takeItem True newPlayer
                                                else if input == "KITCHEN" then goToKitchen newPlayer
                                                else if input == "BACKYARD" then goToBackyard newPlayer
                                                else putStrLn "Command not recognized. Please try again."
                                                goToDogHouse character

-- Doesn't work yet
--takeItem :: Bool -> Player -> IO()
takeItem b character = do
                                        let newPlayerExtra = extra character
                                        let newPlayer = move character
                                        if (b == True) then do putStrLn "You remove the item from Blue's mouth.\nYOU HAVE OBTAINED A POTION!\n"
                                                               leaveDogHouse newPlayerExtra    
                                        else do putStrLn "You remove the item from Blue's mouth only to find out that it is an old tennis ball.\n"
                                                leaveDogHouse newPlayer


leaveDogHouse character = do
                                                let newPlayer = move character
                                                putStrLn "Do you want to check out the KITCHEN or check out the BACKYARD?"
                                                input <- getLine
                                                if input == "STATUS" then status newPlayer
                                                else if input == "KITCHEN" then goToKitchen newPlayer
                                                else if input == "BACKYARD" then goToBackyard newPlayer
                                                else putStrLn "Command not recognized. Please try again."
                                                leaveDogHouse character

goToBackyard character = do
                                                let newPlayer = move character
                                                putStrLn "\nYou walk outside to the backyard where you are immediately caught in a tractor beam."
                                                putStrLn "Your thoughts immediately go into overdrive mode, debating whether it would be better to STRUGGLE against the beam or just COMPLY."
                                                input <- getLine
                                                if input == "STATUS" then status newPlayer
                                                else if input == "STRUGGLE" then do 
                                                                                                        putStrLn "Your struggles are useless as you feel yourself being beamed up and everything fades to black."
                                                                                                        goToLevel2 newPlayer
                                                else if input == "COMPLY" then do
                                                                                                        putStrLn "Your struggles are useless as you feel yourself being beamed up and everything fades to black."
                                                                                                        goToLevel2 newPlayer
                                                else do putStrLn "Command not recognized. Please try again."
                                                goToBackyard character
      
goToLevel2 character = putStrLn "\nYou walk outside to the backyard where you are immediately caught in a tractor beam."





