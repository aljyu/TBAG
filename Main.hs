module Main where
import Player

status :: Player -> IO ()
status (Player {hp = h, potions = p}) = do      
                                                                let character = Player h p
                                                                putStrLn ("Player has " ++ (show h) ++ " HP and " ++ (show p) ++ " potions")

numPots :: Player -> String
numPots (Player {hp = h, potions = p}) = show p
 
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
                                        if input == "STATUS" then do
                                                                                        let x = (read (numPots character) :: Int)
                                                                                        if (x > 0) then do
                                                                                                                        status character
                                                                                                                        putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                        input <- getLine
                                                                                                                        if (input == "YES") then do
                                                                                                                                                                    let newPlayer = drink character
                                                                                                                                                                    doChoice1 newPlayer
                                                                                                                        else if (input == "NO") then doChoice1 character
                                                                                                                        else do
                                                                                                                                        putStrLn "Command not recognized. Please try again."
                                                                                                                                        doChoice1 character
                                                                                        else do
                                                                                                        status character
                                                                                                        doChoice1 character
                                        else if input == "KITCHEN" then goToKitchen "true" character
                                        else if input == "DOG HOUSE" then goToDogHouse "true" character
                                        else if input == "BACKYARD" then goToBackyard character
                                        else do
                                                        putStrLn "Command not recognized. Please try again."
                                                        doChoice1 character

goToDogHouse str character = do
                                                    let newPlayer = move character
                                                    putStrLn "\n\"Blue?\" you call out as you walk out the front door towards the dog house."
                                                    putStrLn "You hear your dog, Blue, trotting towards you with something in his mouth."
                                                    putStrLn "\"Should I take the ITEM, check out the KITCHEN, or check out the BACKYARD?\" you wonder to yourself as you absent-mindedly pet Blue on the head."
                                                    input <- getLine
                                                    if input == "STATUS" then do
                                                                                                    let x = (read (numPots newPlayer) :: Int)
                                                                                                    if (x > 0) then do
                                                                                                                                    status newPlayer
                                                                                                                                    putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                                    input <- getLine
                                                                                                                                    if (input == "YES") then do
                                                                                                                                                                                let newCharacter = drink newPlayer
                                                                                                                                                                                goToDogHouse str newCharacter
                                                                                                                                    else if (input == "NO") then goToDogHouse str character
                                                                                                                                    else do
                                                                                                                                                    putStrLn "Command not recognized. Please try again.1"
                                                                                                                                                    goToDogHouse str character
                                                                                                    else do
                                                                                                                    status newPlayer
                                                                                                                    goToDogHouse str character
                                                    else if input == "ITEM" then takeItem str newPlayer
                                                    else if input == "KITCHEN" then goToKitchen str newPlayer
                                                    else if input == "BACKYARD" then goToBackyard newPlayer
                                                    else do
                                                                    putStrLn "Command not recognized. Please try again."
                                                                    goToDogHouse str character

takeItem str character
    | str == "true" =   do
                                    let newPlayer = extra character
                                    putStrLn "You remove the item from Blue's mouth.\nYOU HAVE OBTAINED A POTION!"
                                    let str = "false"
                                    goToDogHouse str newPlayer
    | str == "false"    =   do
                                        let newPlayer = move character
                                        putStrLn "You remove the item from Blue's mouth only to find out that it is an old tennis ball."
                                        goToDogHouse str character
    | otherwise         =   do
                                        putStrLn "Command not recognized. Please try again."
                                        goToDogHouse str character

goToKitchen str character = do
                                                let newPlayer = move character
                                                putStrLn "\nYou walk into the kitchen.\n\"Alright\" you think to yourself \"Do I want to look inside the SINK, check out the DOG HOUSE, or check out the BACKYARD?\""
                                                input <- getLine
                                                if input == "STATUS" then do
                                                                                                let x = (read (numPots newPlayer) :: Int)
                                                                                                if (x > 0) then do
                                                                                                                                status newPlayer
                                                                                                                                putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                                input <- getLine
                                                                                                                                if (input == "YES") then do
                                                                                                                                                                            let newCharacter = drink newPlayer
                                                                                                                                                                            goToKitchen str newCharacter
                                                                                                                                else if (input == "NO") then goToKitchen str newPlayer
                                                                                                                                else do
                                                                                                                                                putStrLn "Command not recognized. Please try again."
                                                                                                                                                goToKitchen str character
                                                                                                else do
                                                                                                                status newPlayer
                                                                                                                goToKitchen str character
                                                else if input == "SINK" then goToSink str newPlayer
                                                else if input == "DOG HOUSE" then goToDogHouse str newPlayer
                                                else if input == "BACKYARD" then goToBackyard newPlayer
                                                else do
                                                                putStrLn "Command not recognized. Please try again."
                                                                goToKitchen str character

goToSink str character = do
                                            let newPlayer = move character
                                            putStrLn "\nYou look over to your sink and find a bunch of dirty dishes. \"I should've cleaned those hours ago...\" you think to yourself"
                                            putStrLn "\"Do I want to check out the DOG HOUSE, or check out the BACKYARD\"?\n"
                                            input <- getLine
                                            if input == "STATUS" then do
                                                                                            let x = (read (numPots newPlayer) :: Int)
                                                                                            if (x > 0) then do
                                                                                                                            status newPlayer
                                                                                                                            putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                            input <- getLine
                                                                                                                            if (input == "YES") then do
                                                                                                                                                                        let newCharacter = drink newPlayer
                                                                                                                                                                        goToSink str newCharacter
                                                                                                                            else if (input == "NO") then goToSink str character
                                                                                                                            else do
                                                                                                                                            putStrLn "Command not recognized. Please try again."
                                                                                                                                            goToSink str character
                                                                                            else do
                                                                                                            status newPlayer
                                                                                                            goToSink str character
                                            else if input == "DOG HOUSE" then goToDogHouse str newPlayer
                                            else if input == "BACKYARD" then goToBackyard newPlayer
                                            else do
                                                            putStrLn "Command not recognized. Please try again."
                                                            goToSink str character

goToBackyard character = do
                                                let newPlayer = move character
                                                putStrLn "\nYou walk outside to the backyard where you are immediately caught in a tractor beam."
                                                putStrLn "Your thoughts immediately go into overdrive mode, debating whether it would be better to STRUGGLE against the beam or just COMPLY."
                                                input <- getLine
                                                if input == "STATUS" then do
                                                                                                let x = (read (numPots newPlayer) :: Int)
                                                                                                if (x > 0) then do
                                                                                                                                status newPlayer
                                                                                                                                putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                                input <- getLine
                                                                                                                                if (input == "YES") then do
                                                                                                                                                                            let newCharacter = drink newPlayer
                                                                                                                                                                            goToBackyard newCharacter
                                                                                                                                else if (input == "NO") then goToBackyard character
                                                                                                                                else putStrLn "Command not recognized. Please try again."
                                                                                                else do
                                                                                                                status newPlayer
                                                                                                                goToBackyard character
                                                else if input == "STRUGGLE" then do 
                                                                                                        putStrLn "Your struggles are useless as you feel yourself being beamed up and everything fades to black."
                                                                                                        goToLevel2 newPlayer
                                                else if input == "COMPLY" then do
                                                                                                        putStrLn "Your struggles are useless as you feel yourself being beamed up and everything fades to black."
                                                                                                        goToLevel2 newPlayer
                                                else do
                                                                putStrLn "Command not recognized. Please try again."
                                                                goToBackyard character

goToLevel2 character = do 
                                        putStrLn "\n--------------------------------------------------------------------------------------------------------------------------------------------"
                                        putStrLn "                                                                Level 2"
                                        putStrLn "--------------------------------------------------------------------------------------------------------------------------------------------"
                                        doChoice2 character

doChoice2 character = do
                                        let newPlayer = move character
                                        putStrLn "\nYou wake up to a strong throbbing in your head and no memory of where you are or how you got here. You try to look around at your suroundings for any hints as to where you might be, but all you see are glowing orbs of light floating around in the darkness. You get up, and suddenly it hits you. You were abducted by a tractor beam! You realize that you must have been kidnapped by aliens and try your hardest not to freak out. You look around and as your eyes begin to adjust to the darkness, your surroundings begin to come into focus.\nAs you force yourself to calm down and carefully observe your surroundings, you notice that there is a glowing light coming from your right side and strange noises coming from your left.\nAfter your mental struggle with yourself of whether you want to walk towards the GLOWING LIGHT, check out the STRANGE NOISES, or TAKE A STEP AWAY from where you are currently standing so that you can begin to grope around in the darkness, you have come to a decision.\nYou want to..."
                                        input <- getLine
                                        if input == "STATUS" then do
                                                                                        let x = (read (numPots newPlayer) :: Int)
                                                                                        if (x > 0) then do
                                                                                                                        status newPlayer
                                                                                                                        putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                        input <- getLine
                                                                                                                        if (input == "YES") then do
                                                                                                                                                                    let newCharacter = drink newPlayer
                                                                                                                                                                    doChoice2 newCharacter
                                                                                                                        else if (input == "NO") then doChoice2 character
                                                                                                                        else do
                                                                                                                                        putStrLn "Command not recognized. Please try again."
                                                                                                                                        doChoice2 character
                                                                                        else do
                                                                                                        status newPlayer
                                                                                                        doChoice2 character
                                        else if input == "GLOWING LIGHT" then goToLight "true" newPlayer
                                        else if input == "STRANGE NOISES" then goToNoises "true" newPlayer
                                        else if input == "TAKE A STEP AWAY" then goToStep "true" newPlayer
                                        else do
                                                    putStrLn "Command not recognized. Please try again."
                                                    doChoice2 character
                                        
goToLight str character = do
                                        putStrLn "\nYou reach out and feel something slimy and smooth. Creeped out, you jump back and look at your hands to see a green electric slime coating your fingertips. You touch the wall in front of you, only to realize that it isn't actually a wall. It feels... slimy... and smooth... Your eyes widden in horror as you begin to frantically rub your hands across the \"wall\", only to have it reveal more of the green electric slime. Your horror increases as it finally hits you. You are trapped inside of a giant, green slime bubble.\nYou frantically grope around your surroundings in hopes that you can find something that will help you out of this mess. Your hands brush against something that feels like a switch. You brace yourself for the worst and flip it.\nImmediately, the slime bubble around you begins to glow brighter and brighter.\nYou look around at your surroundings and see that there are three items stuck to the sides of the bubble: a SCREWDRIVER, a pair of SCISSORS, and a CROWBAR.\nWhat do you want to grab?"
                                        let newPlayer = move character
                                        input <- getLine
                                        if input == "STATUS" then do
                                                                                        let x = (read (numPots newPlayer) :: Int)
                                                                                        if (x > 0) then do
                                                                                                                        status newPlayer
                                                                                                                        putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                        input <- getLine
                                                                                                                        if (input == "YES") then do
                                                                                                                                                                    let newCharacter = drink newPlayer
                                                                                                                                                                    goToLight str newCharacter
                                                                                                                        else if (input == "NO") then goToLight str character
                                                                                                                        else do
                                                                                                                                        putStrLn "Command not recognized. Please try again."
                                                                                                                                        goToLight str character
                                                                                        else do
                                                                                                        status newPlayer
                                                                                                        goToLight str character
                                        else if input == "SCREWDRIVER" then do
                                                                                                        putStrLn "\nYou start poking the bubble with the screwdriver. However, you soon realize that your poking isn't doing anything to the bubble. Why is it even here?! ~.~ Oh well... Guess it's time to try something else."
                                                                                                        goToLight str newPlayer
                                        else if input == "SCISSORS" then do
                                                                                                putStrLn "\nAfter struggling with the scissors, you finally manage to get out of your entrapement! However, your victory is short lived as you notice that you are inside a maze of a shapeship, filled with winding corridors and thousands of rooms.\n"
                                                                                                goToLevel3 newPlayer
                                        else if input == "CROWBAR" then do
                                                                                                putStrLn "\nYou start attacking the bubble with the crowbar. However, you soon realize that your attacks aren't doing anything to the bubble. Why is it even here?! ~.~ Oh well... Guess it's time to try something else."
                                                                                                goToLight str newPlayer
                                        else do
                                                    putStrLn "Command not recognized. Please try again."
                                                    goToLight str character

goToNoises str character = do
                                        putStrLn "\nAs you walk towards the strange noises, you begin to recognize them. It's the sound that is created when two metal or steel objects are being banged together. You soon find yourself in front of a door with light streaming out of it. You cautiously open the door and peek inside the room.\nYou see rows of gigantic cylindrical containers lined against the walls, with their lids opening and closing. You also notice that there are three items laying partially hideen behind one of the containers and beyond one of the containers, a metal door. You walk into the room and try to open the door, only to find out that it's locked. You go back to the items and find: a small BOX, a SCREWDRIVER, a pair of SCISSORS, and a CROWBAR.\nWhat do you want to grab?"
                                        let newPlayer = move character
                                        input <- getLine
                                        if input == "STATUS" then do
                                                                                        let x = (read (numPots newPlayer) :: Int)
                                                                                        if (x > 0) then do
                                                                                                                        status newPlayer
                                                                                                                        putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                        input <- getLine
                                                                                                                        if (input == "YES") then do
                                                                                                                                                                    let newCharacter = drink newPlayer
                                                                                                                                                                    goToNoises str newCharacter
                                                                                                                        else if (input == "NO") then goToNoises str character
                                                                                                                        else do
                                                                                                                                        putStrLn "Command not recognized. Please try again."
                                                                                                                                        goToNoises str character
                                                                                        else do
                                                                                                        status newPlayer
                                                                                                        goToNoises str character
                                        else if input == "BOX" then getBox str newPlayer
                                        else if input == "SCREWDRIVER" then do
                                                                                                        putStrLn "\nAfter struggling with the screwdriver, you finally manage to get out of your entrapment! However, your victory is short lived as you notice that you are inside a maze of a shapeship, filled with winding corridors and thousands of rooms.\n"
                                                                                                        goToLevel3 newPlayer
                                        else if input == "SCISSORS" then do
                                                                                                putStrLn "\nYou start attacking the door hinges with the scissors. However, you soon realize that your attack isn't doing anything to the door. Why is it even here?! ~.~ Oh well... Guess it's time to try something else."
                                                                                                goToNoises str newPlayer
                                        else if input == "CROWBAR" then do
                                                                                                putStrLn "\nYou start attacking the door with the crowbar. However, you soon realize that your attack isn't doing anything to the bubble. Why is it even here?! ~.~ Oh well... Guess it's time to try something else."
                                                                                                goToNoises str newPlayer
                                        else do
                                                    putStrLn "Command not recognized. Please try again."
                                                    goToNoises str character

getBox str character
    | str == "true" =   do
                                    let newPlayer = extra character
                                    putStrLn "You open the box and find a potion.\nYOU HAVE OBTAINED A POTION!"
                                    let str = "false"
                                    goToNoises str newPlayer
    | str == "false"    =   do
                                        let newPlayer = move character
                                        putStrLn "You open the box and find nothing."
                                        goToNoises str character
    | otherwise         =   do
                                        putStrLn "Command not recognized. Please try again."
                                        getBox str character

goToStep str character = do
                                        putStrLn "\nOuch! You bump your head on what feels like a metal bar on the ceiling. You didn't realize that the space you were in was so small. You grope around your surroundings in hopes that you can find something that will help you out of this mess. Your hands brush against something that feels like a switch. You brace yourself for the worst and flip it.\nImmediately, the room gets flooded with light.\nYoulook around at your surroundings and realize that you can only take one step in each direction. You start hyperventilating due to your claustrophobia until you notice that there is a tool kit in one of the corners.\nYou open the tool kit, hoping to find something that will help you escape, and find: a SCREWDRIVER, a pair of SCISSORS, and a CROWBAR.\nWhat do you want to grab?"
                                        let newPlayer = move character
                                        input <- getLine
                                        if input == "STATUS" then do
                                                                                        let x = (read (numPots newPlayer) :: Int)
                                                                                        if (x > 0) then do
                                                                                                                        status newPlayer
                                                                                                                        putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                        input <- getLine
                                                                                                                        if (input == "YES") then do
                                                                                                                                                                    let newCharacter = drink newPlayer
                                                                                                                                                                    goToStep str newCharacter
                                                                                                                        else if (input == "NO") then goToStep str character
                                                                                                                        else do
                                                                                                                                        putStrLn "Command not recognized. Please try again."
                                                                                                                                        goToStep str character
                                                                                        else do
                                                                                                        status newPlayer
                                                                                                        goToStep str character
                                        else if input == "SCREWDRIVER" then do
                                                                                                        putStrLn "\nYou start attacking a wall with the screwdriver. However, you soon realize that your attack isn't doing anything to the door. Why is it even here?! ~.~ Oh well... Guess it's time to try something else."
                                                                                                        goToStep str newPlayer
                                        else if input == "SCISSORS" then do
                                                                                                putStrLn "\nYou start attacking a wall with the scissors. However, you soon realize that your attack isn't doing anything to the door. Why is it even here?! ~.~ Oh well... Guess it's time to try something else."
                                                                                                goToStep str newPlayer
                                        else if input == "CROWBAR" then do
                                                                                                putStrLn "\nYou start attacking a wall with the crowbar with all of your strength. After some struggle, you finally manage to get out of your entrapment! However, your victory is short lived as you notice that you are inside a maze of a shapeship, filled with winding corridors and thousands of rooms.\n"
                                                                                                goToLevel3 newPlayer
                                        else do
                                                    putStrLn "Command not recognized. Please try again."
                                                    goToStep str character

goToLevel3 character = do
                                        putStrLn("\n--------------------------------------------------------------------------------------------------------------------------------------------")
                                        putStrLn("                                                                Level 3")
                                        putStrLn("--------------------------------------------------------------------------------------------------------------------------------------------")
                                        doChoice3 character

doChoice3 character = do
                                        let newPlayer = move character
                                        putStrLn("\nYou find yourself in a long hallway. There is a guard standing near a door who seems like he is dozing off. \"That room must be important if it has a guard in front of it...\" you think to yourself as you approach it.")
                                        putStrLn "Do you want to SCREAM and hope that the loud noise wakes you up from what are hoping is a dream, SURPRISE ATTACK the guard in hopes that your attack will render them unconscious, or SNEAK INSIDE the room?"
                                        input <- getLine
                                        if input == "STATUS" then do
                                                                                        let x = (read (numPots newPlayer) :: Int)
                                                                                        if (x > 0) then do
                                                                                                                        status newPlayer
                                                                                                                        putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                        input <- getLine
                                                                                                                        if (input == "YES") then do
                                                                                                                                                                    let newCharacter = drink newPlayer
                                                                                                                                                                    doChoice3 newCharacter
                                                                                                                        else if (input == "NO") then doChoice3 character
                                                                                                                        else do
                                                                                                                                        putStrLn "Command not recognized. Please try again."
                                                                                                                                        doChoice3 character
                                                                                        else do
                                                                                                        status newPlayer
                                                                                                        doChoice3 character
                                        else if input == "SCREAM" then do
                                                                                        putStrLn "\nThe guard wakes up with a jolt and attacks you. You are quickly overpowered by the guard who proceeds to eleminate the threat, you."
                                                                                        gameOverFail
                                        else if input == "SURPRISE ATTACK" then do
                                                                                            putStrLn "\nYou quietly sneak over to the guard and whack them over their head with both hands as hard as you can, hoping that it is enough to render them unconscious. With a groan, the guard slumps down onto the floor."
                                                                                            goToGuard newPlayer
                                        else if input == "SNEAK INSIDE" then do 
                                                                                                        putStrLn "\nYou quietly sneak around the guard and reach your hand out for the door handle. You carefully turn the handle and open the door, only to realize that doing so has created a loud noise.\nThe guard's eyes quickly shoot open and sees you right away. You are quickly overpowered by the guard who proceeds to eleminate the threat, you."
                                                                                                        gameOverFail
                                        else do
                                                    putStrLn "Command not recognized. Please try again."
                                                    doChoice3 character

goToGuard character = do
                                            let newPlayer = move character
                                            putStrLn "You sigh in relief and stare down at the guard. You can see something sticking out of their pocket and debate whether or not you want to grab the ITEM or JUST LEAVE."
                                            putStrLn "You can see the guard beginning to stir and quickly decide that you want to..."
                                            input <- getLine
                                            if input == "STATUS" then do
                                                                                            let x = (read (numPots newPlayer) :: Int)
                                                                                            if (x > 0) then do
                                                                                                                            status newPlayer
                                                                                                                            putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                            input <- getLine
                                                                                                                            if (input == "YES") then do
                                                                                                                                                                        let newCharacter = drink newPlayer
                                                                                                                                                                        goToGuard newCharacter
                                                                                                                            else if (input == "NO") then goToGuard character
                                                                                                                            else do
                                                                                                                                            putStrLn "Command not recognized. Please try again."
                                                                                                                                            putStrLn ""
                                                                                                                                            goToGuard character
                                                                                            else do
                                                                                                            status newPlayer
                                                                                                            putStrLn ""
                                                                                                            goToGuard character
                                            else if input == "ITEM" then do
                                                                            putStrLn "\nYou quickly bend over to grab the item from the guard's pocket. However, upon doing so, your hand brushes against their armor and you feel a jolt of electricity passing throughout your body.\nYou cry out from the excruciating pain despite your best efforts not to as you stagger through the door to the next room.\nYou let out a whimper as you lean against the door and you swear that you can feel your body getting weaker by the second.\nWhat feels like hours pass before you feel well enough to get up and move around again. You take this chance to study your surroundings."
                                                                            --THIS TAKES AWAY 25 HP. CHECK WITH JAVA PROGRAM TO SEE IF THAT IS THE CASE THERE AS WELL
                                                                            let hurtPlayer = extra (hit newPlayer)
                                                                            goFinal hurtPlayer
                                            else if input == "JUST LEAVE" then goFinal newPlayer
                                            else do
                                                        putStrLn "Command not recognized. Please try again."
                                                        goToGuard character

goFinal character = do
                                    let newPlayer = move character
                                    putStrLn "\nYou find yourself in a large room containing a huge holographic picture of Earth being projected above a white, circular table.\nYou quickly snap out of your awestruck state as you hear footsteps and what sounds like voices getting closer to the room. You panic as you quickly hide behind the table. You rack your brains thinking of what the best course of action is. You see a flashing red BUTTON on the control panel in front of you, a GUN next to you, and a DESK behind you. The door to the room slides open as you dive for the..."
                                    input <-  getLine
                                    if input == "STATUS" then do
                                                                                    let x = (read (numPots newPlayer) :: Int)
                                                                                    if (x > 0) then do
                                                                                                                    status newPlayer
                                                                                                                    putStrLn "Would you like to drink a potion? YES or NO?"
                                                                                                                    input <- getLine
                                                                                                                    if (input == "YES") then do
                                                                                                                                                                let newCharacter = drink newPlayer
                                                                                                                                                                goFinal newCharacter
                                                                                                                    else if (input == "NO") then goFinal character
                                                                                                                    else do
                                                                                                                                    putStrLn "Command not recognized. Please try again."
                                                                                                                                    goFinal character
                                                                                    else do
                                                                                                    status newPlayer
                                                                                                    goFinal character
                                    else if input == "BUTTON" then do
                                                                                    putStrLn "\nYour hand slaps the button right as the alien guards burst through the door. You are quickly subdued by the guards as the ship begins to give off a piercing noise.\nYou have activated attack mode! The giant lasers in front of the ship begin to power up, gathering dark energy.\nYou watch helplessly, unable to do anything, as the ship's lasers finish powering up and a shot of pure, black energy is shot towards Earth, tearing a hole through the middle of the planet."
                                                                                    putStrLn "You let out an inhumane scream filled with pain, loss, and regret as you realize that you just killed everyone you cared about. You struggle against your captors, screaming out profanity after profanity, swearing to kill them before you hit the floor. Hard."
                                                                                    putStrLn "\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream..."
                                                                                    gameOverWin 
                                    else if input == "GUN" then do 
                                                                                    putStrLn "\nYour hand closes around the butt of the gun right as the alien guards burst through the door. You quickly raise your arms and point the gun at the guards and press the trigger, effectively blowing yourself backwards against the wall due to the sheer force of the recoil. As you are tackled by the guards, you notice with satisfaction that at the very least the blast from your gun has taken out one of them."
                                                                                    putStrLn "You laugh and give out a victory shout before you are spun around and a fist meets your face. You grunt in pain as you hit the floor and are met with a kick to the stomach. The aliens seem to be pissed as they take turns punching and kicking you as you curl up into a ball in an attempt to try to protect yourself. The attacks stop and you look up to see a boot coming right at your face. You quickly squeeze your eyes shut right before it makes contact with your face and you feel your body flying through the air before hitting the wall behind you. Hard."
                                                                                    putStrLn "\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream..."
                                                                                    gameOverWin
                                    else if input == "DESK" then do
                                                                                        putStrLn "\nYou manage to hide next to a desk right as the aliens burst through the door. You shut your eyes and desperately hope that you won't be found. However, your hope fades as you are grabbed by the neck and roughly hauled to your feet. You open your eyes and are met with a fist flying at your face. You quickly squeeze your eyes shut before it makes contact with your face and you feel yourself falling onto the floor."
                                                                                        putStrLn "\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream..."
                                    else do
                                                putStrLn "Command not recognized. Please try again.\n"
                                                goFinal character

gameOverFail = putStrLn "You ran out of HP. Better luck next time!\nGAME OVER!"

gameOverWin = putStrLn "You did it! You managed to survive!\nAchievement Unlocked!\nSURVIVOR"