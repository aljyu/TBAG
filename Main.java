import java.util.*;

public class Main {
    public static void main (String[] args)  {
        Scanner in = new Scanner (System.in);
        String input;
        System.out.println ("Welcome to EK4!");
        System.out.println ("What is your name?");
        String playerName = in.nextLine();
        System.out.println ("\nHello " + playerName + "!");
        
        Player character = new Player (100, 100, 5, 0, 30);
        System.out.println("You currently have " + character.playerCurrentHP() + " HP and " + character.playerCurrentPotions() + " potions.");
        System.out.println("If you wish to view these stats during any point of the game, type in \"Status\".");
		System.out.println("The \"Status\" menu will automatically exit after 1 command, regardless of whether the command was valid, and return to the game.");
		System.out.println("If you wish to drink a potion, first type in \"Status\" and follow the instructions given.");
		System.out.println("In this game, every time you choose to perform an action you will lose HP. When your HP hits 0, you will die and the game will end.");
        System.out.println ("\nNow, let's begin...\n");
        // The beginning of the game
		// Global game variable
		boolean gameStatus = true;
		// Global level variable
		boolean checked = false;
		boolean next;

		if (gameStatus) {
			System.out.println ("--------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.println ("                                                                Level 1");
			System.out.println ("--------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.println("ZZZzzz...\nYou are sleeping peacefully, dreaming of summer vacation, when suddenly you are awakened by a bright, annoying light flashing through the window, directly at your face.");
			System.out.println("\"Why is is so bright...?!\" you gripe as you pull your covers over your head, trying to ignore the light and fall back asleep.");
			System.out.println("However, your attempts turn out to be futile as you being to hear a series of high-pitched noises.");
			System.out.println("You decide that you've had enough and get out of bed to check the window for the source of the disturbance, only to realize that the light shining through your window is making it too bright to see anything outside.");
			System.out.println("As you stand next to your window clad only in your PJs wondering what you should do, the high-pitched noises begin to fade as you hear a voice.");
			System.out.println("\"" + playerName + "\" a soft, gentle voice calls out.");
			System.out.println("You look around, trying to pinpoint the location of the voice.");
			System.out.println("\"This voice is hauntingly beautiful... and... familiar...?\" you think as you being to feel compelled to track down its owner.");
			System.out.println("As you being to walk out of your room, the light behind you begins to slowly fade away.\n");
			System.out.println("\"Alright\" you think to yourself \"Where should I check out first? Should I check out the KITCHEN, check out the DOG HOUSE, or check out the BACKYARD?\"");
		}
		input = in.nextLine();

		LOOP_1: // Loop 1
		while (gameStatus) {
			while (!(input.equalsIgnoreCase("dog house") || input.equalsIgnoreCase("kitchen") || input.equalsIgnoreCase("backyard")) || (input.equalsIgnoreCase("status"))) {
				// Always call the following 11 lines after every input
				if (statusCheck(input)) {
					status (input, character);
					if (character.numPotions > 0) {
						System.out.println("Would you like to drink a potion? YES or NO?");
						input = in.nextLine();
						if (input.equalsIgnoreCase("yes")) {
							character.currentHealth = character.drink();
							character.numPotions--;
						}
						else if (input.equalsIgnoreCase("no")) {
						}
						else {
							System.out.println("Command not recognized. Please try again.");
						}
					}
					System.out.println();
					input = in.nextLine();
				}
				else {
					System.out.println("Command not recognized. Please try again.\n");
					input = in.nextLine();
				}
			}
			if (input.equalsIgnoreCase("dog house")) {
				character.currentHealth = character.move();
				// Always call the following 3 lines after every move
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_1;
				}
				System.out.println("\n\"Blue?\" you call out as you walk out the front door towards the dog house.");
				System.out.println("You hear your dog, Blue, trotting towards you with something in his mouth.");
				System.out.println("\"Should I take the ITEM, check out the KITCHEN, or check out the BACKYARD?\" you wonder to yourself as you absent-mindedly pet Blue on the head.");
				input = in.nextLine();
				
				while (!(input.equalsIgnoreCase("item") || input.equalsIgnoreCase("kitchen") || input.equalsIgnoreCase("backyard")) || (input.equalsIgnoreCase("status"))) {
					// Always call the following 11 lines after every input
					if (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					else {
						System.out.println("Command not recognized. Please try again.\n");
						input = in.nextLine();
					}
				}
				
				if (input.equalsIgnoreCase("item")) {
					if (checked == false) {
						checked = true;
						character.currentHealth = character.move();
						// Always call the following 3 lines after every move
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_1;
						}
						System.out.println("You remove the item from Blue's mouth.\nYOU HAVE OBTAINED A POTION!\n");
						character.numPotions++;
					}
					else {
						System.out.println("You remove the item from Blue's mouth only to find out that it is an old tennis ball.\n");
					}
					System.out.println("Do you want to check out the KITCHEN or check out the BACKYARD?");
					input = in.nextLine();
					while (!(input.equalsIgnoreCase("kitchen") || input.equalsIgnoreCase("backyard") || input.equalsIgnoreCase("status"))) {
						// Always call the following 11 lines after every input
						if (statusCheck(input)) {
							status (input, character);
							if (character.numPotions > 0) {
								System.out.println("Would you like to drink a potion? YES or NO?");
								input = in.nextLine();
								if (input.equalsIgnoreCase("yes")) {
									character.currentHealth = character.drink();
									character.numPotions--;
								}
								else if (input.equalsIgnoreCase("no")) {
								}
								else {
									System.out.println("Command not recognized. Please try again.");
								}
							}
							System.out.println();
							input = in.nextLine();
						}
						else {
							System.out.println("Command not recognized. Please try again.\n");
							input = in.nextLine();
						}
					}
					continue LOOP_1;
				}
				continue LOOP_1;
			}
			else if (input.equalsIgnoreCase("kitchen")) {
				character.currentHealth = character.move();
				// Always call the following 3 lines after every move
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_1;
				}
				System.out.println("\nYou walk into the kitchen.\n\"Alright\" you think to yourself \"Do I want to look inside the SINK, check out the DOG HOUSE, or check out the BACKYARD");
				input = in.nextLine();
				while (!(input.equalsIgnoreCase("sink") || input.equalsIgnoreCase("dog house") || input.equalsIgnoreCase("backyard")) || (input.equalsIgnoreCase("status"))) {
					// Always call the following 11 lines after every input
					if (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
					}
					else {
						System.out.println("Command not recognized. Please try again.\n");
					}
					input = in.nextLine();
				}
				if (input.equalsIgnoreCase("sink")) {
					character.currentHealth = character.move();
					// Always call the following 3 lines after every move
					if (character.currentHealth <= 0) {
						gameStatus = false;
						break LOOP_1;
					}
					System.out.println("\nYou look over to your sink and find a bunch of dirty dishes. \"I should've cleaned those hours ago...\" you think to yourself");
					System.out.println("\"Do I want to check out the DOG HOUSE, or check out the BACKYARD\"?\n");
					input = in.nextLine();
					while (!(input.equalsIgnoreCase("dog house") || input.equalsIgnoreCase("backyard")) || (input.equalsIgnoreCase("status"))) {
						// Always call the following 11 lines after every input
						if (statusCheck(input)) {
							status (input, character);
							if (character.numPotions > 0) {
								System.out.println("Would you like to drink a potion? YES or NO?");
								input = in.nextLine();
								if (input.equalsIgnoreCase("yes")) {
									character.currentHealth = character.drink();
									character.numPotions--;
								}
								else if (input.equalsIgnoreCase("no")) {
								}
								else {
									System.out.println("Command not recognized. Please try again.");
								}
							}
							System.out.println();
						}
						else {
							System.out.println("Command not recognized. Please try again.\n");
						}
						input = in.nextLine();
					}
					continue LOOP_1;
				}
				continue LOOP_1;
			}
			else if (input.equalsIgnoreCase("backyard")) {
				character.currentHealth = character.move();
				// Always call the following 3 lines after every move
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_1;
				}
				System.out.println("\nYou walk outside to the backyard where you are immediately caught in a tractor beam.");
				System.out.println("Your thoughts immediately go into overdrive mode, debating whether it would be better to STRUGGLE against the beam or just COMPLY.");
				input = in.nextLine();
				while (!(input.equalsIgnoreCase("struggle") || input.equalsIgnoreCase("comply")) || input.equalsIgnoreCase("status")) {
					// Always call the following 11 lines after every input
					if (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					System.out.println("Command not recognized. Please try again.\n");
					input = in.nextLine();
				}
				if (input.equalsIgnoreCase("struggle")) {
					System.out.println("Your struggles are useless as you feel yourself being beamed up and everything fades to black.");
				}
				else {
					System.out.println("You relax your body and as you feel yourself being beamed up, everything fades to black.");
				}
				break LOOP_1;
			}
			else {
				while (!(input.equalsIgnoreCase("kitchen") || input.equalsIgnoreCase("item") || input.equalsIgnoreCase("backyard") || input.equalsIgnoreCase("status"))) {
					System.out.println("Command not recognized. Please try again.\n");
					input = in.nextLine();
				}
				continue LOOP_1;
			}
		}

		if (gameStatus) {
			System.out.println ("\n--------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.println ("                                                                Level 2");
			System.out.println ("--------------------------------------------------------------------------------------------------------------------------------------------");
			checked = false;
			
			//System.out.println("Location: Inside the spaceship prison cell");
			System.out.println("You wake up to a strong throbbing in your head and no memory of where you are or how you got here. You try to look around at your suroundings for any hints as to where you might be, but all you see are glowing orbs of light floating around in the darkness. You get up, and suddenly it hits you. You were abducted by a tractor beam! You realize that you must have been kidnapped by aliens and try your hardest not to freak out. You look around and as your eyes begin to adjust to the darkness, your surroundings begin to come into focus.\nAs you force yourself to calm down and carefully observe your surroundings, you notice that there is a glowing light coming from your right side and strange noises coming from your left.\nAfter your mental struggle with yourself of whether you want to walk towards the GLOWING LIGHT, check out the STRANGE NOISES, or TAKE A STEP AWAY from where you are currently standing so that you can begin to grope around in the darkness, you have come to a decision.\nYou want to...");
		}
		input = in.nextLine();		
		
		LOOP_2: // Loop 2
		while (gameStatus) {
			while (!(input.equalsIgnoreCase("glowing light") || input.equalsIgnoreCase("strange noises") || input.equalsIgnoreCase("take a step away")) || (input.equalsIgnoreCase("status"))) {
				// Always call the following 11 lines after every input
				if (statusCheck(input)) {
					status (input, character);
					if (character.numPotions > 0) {
						System.out.println("Would you like to drink a potion? YES or NO?");
						input = in.nextLine();
						if (input.equalsIgnoreCase("yes")) {
							character.currentHealth = character.drink();
							character.numPotions--;
						}
						else if (input.equalsIgnoreCase("no")) {
						}
						else {
							System.out.println("Command not recognized. Please try again.");
						}
					}
					System.out.println();
				}
				else {
					System.out.println("Command not recognized. Please try again.\n");
				}
				input = in.nextLine();
			}
			if (input.equalsIgnoreCase("glowing light")) {
				character.currentHealth = character.move();
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_2;
				}
				System.out.println("\nYou reach out and feel something slimy and smooth. Creeped out, you jump back and look at your hands to see a green electric slime coating your fingertips. You touch the wall in front of you, only to realize that it isn't actually a wall. It feels... slimy... and smooth... Your eyes widden in horror as you begin to frantically rub your hands across the \"wall\", only to have it reveal more of the green electric slime. Your horror increases as it finally hits you. You are trapped inside of a giant, green slime bubble.\nYou frantically grope around your surroundings in hopes that you can find something that will help you out of this mess. Your hands brush against something that feels like a switch. You brace yourself for the worst and flip it.\nImmediately, the slime bubble around you begins to glow brighter and brighter.\nYou look around at your surroundings and see that there are three items stuck to the sides of the bubble: a SCREWDRIVER, a pair of SCISSORS, and a CROWBAR.\nWhat do you want to grab?\n");
				
				input = in.nextLine();
				next = true;
				while (next) {
					// Always call the following 11 lines after every input
					while (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					if (input.equalsIgnoreCase("screwdriver")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("You start poking the bubble with the screwdriver. However, you soon realize that your poking isn't doing anything to the bubble. Why is it even here?! ~.~ Oh well... Guess it's time to try something else.\n");
					}
					else if (input.equalsIgnoreCase("scissors")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("After struggling with the scissors, you finally manage to get out of your entrapement! However, your victory is short lived as you notice that you are inside a maze of a shapeship, filled with winding corridors and thousands of rooms.\n");
						next = false;
						break LOOP_2;
					}
					else if (input.equalsIgnoreCase("crowbar")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("You start attacking the bubble with the crowbar. However, you soon realize that your attacks aren't doing anything to the bubble. Why is it even here?! ~.~ Oh well... Guess it's time to try something else.\n");
					}
					else {
						System.out.println("Command not recognized. Please try again.\n");
					}
					input = in.nextLine();
				}
			}
			else if (input.equalsIgnoreCase("strange noises")) {
				character.currentHealth = character.move();
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_2;
				}
				System.out.println("As you walk towards the strange noises, you begin to recognize them. It's the sound that is created when two metal or steel objects are being banged together. You soon find yourself in front of a door with light streaming out of it. You cautiously open the door and peek inside the room.\nYou see rows of gigantic cylindrical containers lined against the walls, with their lids opening and closing. You also notice that there are three items laying partially hideen behind one of the containers and beyond one of the containers, a metal door. You walk into the room and try to open the door, only to find out that it's locked. You go back to the items and find: a small BOX, a SCREWDRIVER, a pair of SCISSORS, and a CROWBAR.\nWhat do you want to grab?\n");
				
				input = in.nextLine();
				next = true;
				while (next) {
					// Always call the following 11 lines after every input
					while (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					if (input.equalsIgnoreCase("box")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						if (checked == false) {
							checked = true;
							// Always call the following 3 lines after every move
							if (character.currentHealth <= 0) {
								gameStatus = false;
								break LOOP_2;
							}
							System.out.println("You open the box and find a potion.\nYOU HAVE OBTAINED A POTION!\n");
							character.numPotions++;
						}
						else {
							System.out.println("You open the box and find nothing.\n");
						}
						System.out.println("You look back over at the remaining items. What do you want to grab?\n");
						input = in.nextLine();
					}
					// Always call the following 11 lines after every input
					while (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					if (input.equalsIgnoreCase("screwdriver")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("After struggling with the screwdriver, you finally manage to get out of your entrapment! However, your victory is short lived as you notice that you are inside a maze of a shapeship, filled with winding corridors and thousands of rooms.\n");
						next = false;
						break LOOP_2;
					}
					else if (input.equalsIgnoreCase("scissors")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("You start attacking the door hinges with the scissors. However, you soon realize that your attack isn't doing anything to the door. Why is it even here?! ~.~ Oh well... Guess it's time to try something else.\n");
					}
					else if (input.equalsIgnoreCase("crowbar")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("You start attacking the door with the crowbar. However, you soon realize that your attack isn't doing anything to the bubble. Why is it even here?! ~.~ Oh well... Guess it's time to try something else.\n");
					}
					else {
						System.out.println("Command not recognized. Please try again.\n");
					}
					input = in.nextLine();
				}
			}
			else if (input.equalsIgnoreCase("take a step away")) {
				character.currentHealth = character.move();
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_2;
				}
				System.out.println("Ouch! You bump your head on what feels like a metal bar on the ceiling. You didn't realize that the space you were in was so small. You grope around your surroundings in hopes that you can find something that will help you out of this mess. Your hands brush against something that feels like a switch. You brace yourself for the worst and flip it.\nImmediately, the room gets flooded with light.\nYoulook around at your surroundings and realize that you can only take one step in each direction. You start hyperventilating due to your claustrophobia until you notice that there is a tool kit in one of the corners.\nYou open the tool kit, hoping to find something that will help you escape, and find: a SCREWDRIVER, a pair of SCISSORS, and a CROWBAR.\nWhat do you want to grab?\n");
				
				input = in.nextLine();
				next = true;
				while (next) {
					// Always call the following 11 lines after every input
					while (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					if (input.equalsIgnoreCase("screwdriver")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("You start attacking a wall with the screwdriver. However, you soon realize that your attack isn't doing anything to the door. Why is it even here?! ~.~ Oh well... Guess it's time to try something else.\n");
					}
					else if (input.equalsIgnoreCase("scissors")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("You start attacking a wall with the scissors. However, you soon realize that your attack isn't doing anything to the door. Why is it even here?! ~.~ Oh well... Guess it's time to try something else.\n");
					}
					else if (input.equalsIgnoreCase("crowbar")) {
						character.currentHealth = character.move();
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_2;
						}
						System.out.println("You start attacking a wall with the crowbar with all of your strength. After some struggle, you finally manage to get out of your entrapment! However, your victory is short lived as you notice that you are inside a maze of a shapeship, filled with winding corridors and thousands of rooms.\n");
						next = false;
						break LOOP_2;
					}
					else {
						System.out.println("Command not recognized. Please try again.\n");
					}
					input = in.nextLine();
				}
			}
			else {
				while (!input.equalsIgnoreCase("walk towards the glowing light") || !input.equalsIgnoreCase("check out the strange noises") || !input.equalsIgnoreCase("take a step away from where you are currently standing") || !input.equals("status")) {
					System.out.println("Command not recognized. Please try again.\n");
					input = in.nextLine();
					while (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					break;
				}
				continue LOOP_2;
			}
			break LOOP_2;
		}
	
		
		if (gameStatus) {
			System.out.println ("\n--------------------------------------------------------------------------------------------------------------------------------------------");
			System.out.println ("                                                                Level 3");
			System.out.println ("--------------------------------------------------------------------------------------------------------------------------------------------");
			checked = false;
			next = true;
			
			//System.out.println("Location: Inside the spaceship prison cell");
			System.out.println("You find yourself in a long hallway. There is a guard standing near a door who seems like he is dozing off. \"That room must be important if it has a guard in front of it...\" you think to yourself as you approach it.");
			System.out.println("Do you want to SCREAM and hope that the loud noise wakes you up from what are hoping is a dream, SURPRISE ATTACK the guard in hopes that your attack will render them unconscious, or SNEAK INSIDE the room?");
		}
		input = in.nextLine();
		
		
		LOOP_3: // Loop 3
		while (gameStatus) {
			// Always call the following 11 lines after every input
			while (!(input.equalsIgnoreCase("scream") || input.equalsIgnoreCase("surprise attack") || input.equalsIgnoreCase("sneak inside")) || (input.equalsIgnoreCase("status"))) {
				// Always call the following 11 lines after every input
				if (statusCheck(input)) {
					status (input, character);
					if (character.numPotions > 0) {
						System.out.println("Would you like to drink a potion? YES or NO?");
						input = in.nextLine();
						if (input.equalsIgnoreCase("yes")) {
							character.currentHealth = character.drink();
							character.numPotions--;
						}
						else if (input.equalsIgnoreCase("no")) {
						}
						else {
							System.out.println("Command not recognized. Please try again.");
						}
					}
					System.out.println();
				}
				else {
					System.out.println("Command not recognized. Please try again.\n");
				}
				input = in.nextLine();
			}
			if (input.equalsIgnoreCase("scream")) {
				character.currentHealth = character.move();
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_3;
				}
				System.out.println("\nThe guard wakes up with a jolt and attacks you. You are quickly overpowered by the guard who proceeds to eleminate the threat, you.");
				gameStatus = false;
				break LOOP_3;
			}
			else if (input.equalsIgnoreCase("surprise attack")) {
				character.currentHealth = character.move();
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_3;
				}
				System.out.println("\nYou quietly sneak over to the guard and whack them over their head with both hands as hard as you can, hoping that it is enough to render them unconscious. With a groan, the guard slumps down onto the floor.");
				System.out.println("You sigh in relief and stare down at the guard. You can see something sticking out of their pocket and debate whether or not you want to GRAB THE ITEM or JUST LEAVE.");
				System.out.println("You can see the guard beginning to stir and quickly decide that you want to...");
				next = true;
				
				while (next) {
					input = in.nextLine();
					// Always call the following 11 lines after every input
					while (statusCheck(input)) {
						status (input, character);
						if (character.numPotions > 0) {
							System.out.println("Would you like to drink a potion? YES or NO?");
							input = in.nextLine();
							if (input.equalsIgnoreCase("yes")) {
								character.currentHealth = character.drink();
								character.numPotions--;
							}
							else if (input.equalsIgnoreCase("no")) {
							}
							else {
								System.out.println("Command not recognized. Please try again.");
							}
						}
						System.out.println();
						input = in.nextLine();
					}
					if (input.equalsIgnoreCase("just leave")) {
						next = false;
						System.out.println("\nYou find yourself in a large room containing a huge holographic picture of Earth being projected above a white, circular table.\nYou quickly snap out of your awestruck state as you hear footsteps and what sounds like voices getting closer to the room. You panic as you quickly hide behind the table. You rack your brains thinking of what the best course of action is. You see a flashing red BUTTON on the control panel in front of you, a GUN next to you, and a DESK behind you. The door to the room slides open as you dive for the...");
						boolean fail = false;
						while (!fail) {
							input = in.nextLine();
							character.currentHealth = character.move();
							while (statusCheck(input)) {
								status (input, character);
								if (character.numPotions > 0) {
									System.out.println("Would you like to drink a potion? YES or NO?");
									input = in.nextLine();
									if (input.equalsIgnoreCase("yes")) {
										character.currentHealth = character.drink();
										character.numPotions--;
									}
									else if (input.equalsIgnoreCase("no")) {
									}
									else {
										System.out.println("Command not recognized. Please try again.");
									}
								}
								System.out.println();
								input = in.nextLine();
							}
							if (input.equalsIgnoreCase("button")) {
								if (character.currentHealth <= 0) {
									gameStatus = false;
									break LOOP_3;
								}
								System.out.println("\nYour hand slaps the button right as the alien guards burst through the door. You are quickly subdued by the guards as the ship begins to give off a piercing noise.\nYou have activated attack mode! The giant lasers in front of the ship begin to power up, gathering dark energy.\nYou watch helplessly, unable to do anything, as the ship's lasers finish powering up and a shot of pure, black energy is shot towards Earth, tearing a hole through the middle of the planet.");
								System.out.println("You let out an inhumane scream filled with pain, loss, and regret as you realize that you just killed everyone you cared about. You struggle against your captors, screaming out profanity after profanity, swearing to kill them before you hit the floor. Hard.");
								System.out.println("\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream...");
								break LOOP_3;
							}
							else if (input.equalsIgnoreCase("gun")) {
								if (character.currentHealth <= 0) {
									gameStatus = false;
									break LOOP_3;
								}
								System.out.println("\nYour hand closes around the butt of the gun right as the alien guards burst through the door. You quickly raise your arms and point the gun at the guards and press the trigger, effectively blowing yourself backwards against the wall due to the sheer force of the recoil. As you are tackled by the guards, you notice with satisfaction that at the very least the blast from your gun has taken out one of them.");
								System.out.println("You laugh and give out a victory shout before you are spun around and a fist meets your face. You grunt in pain as you hit the floor and are met with a kick to the stomach. The aliens seem to be pissed as they take turns punching and kicking you as you curl up into a ball in an attempt to try to protect yourself. The attacks stop and you look up to see a boot coming right at your face. You quickly squeeze your eyes shut right before it makes contact with your face and you feel your body flying through the air before hitting the wall behind you. Hard.");
								System.out.println("\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream...");
								break LOOP_3;
							}
							else if (input.equalsIgnoreCase("desk")) {
								if (character.currentHealth <= 0) {
									gameStatus = false;
									break LOOP_3;
								}
								System.out.println("\nYou manage to hide next to a desk right as the aliens burst through the door. You shut your eyes and desperately hope that you won't be found. However, your hope fades as you are grabbed by the neck and roughly hauled to your feet. You open your eyes and are met with a fist flying at your face. You quickly squeeze your eyes shut before it makes contact with your face and you feel yourself falling onto the floor.");
								System.out.println("\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream...");
								break LOOP_3;
							}
							else {
								System.out.println("Command not recognized. Please try again.\n");
								fail = false;
							}
						}
					}
					else if (input.equalsIgnoreCase("grab the item")) {
						checked = true;
						next = false;
						character.currentHealth = character.hit();
						// Always call the following 3 lines after every move
						if (character.currentHealth <= 0) {
							gameStatus = false;
							break LOOP_3;
						}
						character.numPotions++;
						System.out.println("\nYou quickly bend over to grab the item from the guard's pocket. However, upon doing so, your hand brushes against their armor and you feel a jolt of electricity passing throughout your body.\nYou cry out from the excruciating pain despite your best efforts not to as you stagger through the door to the next room.\nYou let out a whimper as you lean against the door and you swear that you can feel your body getting weaker by the second.\nWhat feels like hours pass before you feel well enough to get up and move around again. You take this chance to study your surroundings and notice that you are in a large room containing a huge holographic picture of Earth being projected above a white, circular table.\nYou quickly snap out of your awestruck state as you hear footsteps and what sounds like voices getting closer to the room. You panic as you quickly hide behind the table. You rack your brains thinking of what the best course of action is. You see a flashing red BUTTON on the control panel in front of you, a GUN next to you, and a DESK behind you. The door to the room slides open as you dive for the...");
						boolean fail = false;
						while (!fail) {
							input = in.nextLine();
							// Always call the following 11 lines after every input
							while (statusCheck(input)) {
								status (input, character);
								if (character.numPotions > 0) {
									System.out.println("Would you like to drink a potion? YES or NO?");
									input = in.nextLine();
									if (input.equalsIgnoreCase("yes")) {
										character.currentHealth = character.drink();
										character.numPotions--;
									}
									else if (input.equalsIgnoreCase("no")) {
									}
									else {
										System.out.println("Command not recognized. Please try again.");
									}
								}
								System.out.println();
								input = in.nextLine();
							}
							if (input.equalsIgnoreCase("button")) {
								character.currentHealth = character.move();
								if (character.currentHealth <= 0) {
									gameStatus = false;
									break LOOP_3;
								}
								System.out.println("\nYour hand slaps the button right as the alien guards burst through the door. You are quickly subdued by the guards as the ship begins to give off a piercing noise.\nYou have activated attack mode! The giant lasers in front of the ship begin to power up, gathering dark energy.\nYou watch helplessly, unable to do anything, as the ship's lasers finish powering up and a shot of pure, black energy is shot towards Earth, tearing a hole through the middle of the planet.");
								System.out.println("You let out an inhumane scream filled with pain, loss, and regret as you realize that you just killed everyone you cared about. You struggle against your captors, screaming out profanity after profanity, swearing to kill them before you hit the floor. Hard.");
								System.out.println("\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream...");
								break LOOP_3;
							}
							else if (input.equalsIgnoreCase("gun")) {
								character.currentHealth = character.move();
								if (character.currentHealth <= 0) {
									gameStatus = false;
									break LOOP_3;
								}
								System.out.println("\nYour hand closes around the butt of the gun right as the alien guards burst through the door. You quickly raise your arms and point the gun at the guards and press the trigger, effectively blowing yourself backwards against the wall due to the sheer force of the recoil. As you are tackled by the guards, you notice with satisfaction that at the very least the blast from your gun has taken out one of them.");
								System.out.println("You laugh and give out a victory shout before you are spun around and a fist meets your face. You grunt in pain as you hit the floor and are met with a kick to the stomach. The aliens seem to be pissed as they take turns punching and kicking you as you curl up into a ball in an attempt to try to protect yourself. The attacks stop and you look up to see a boot coming right at your face. You quickly squeeze your eyes shut right before it makes contact with your face and you feel your body flying through the air before hitting the wall behind you. Hard.");
								System.out.println("\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream...");
								break LOOP_3;
							}
							else if (input.equalsIgnoreCase("desk")) {
								character.currentHealth = character.move();
								if (character.currentHealth <= 0) {
									gameStatus = false;
									break LOOP_3;
								}
								System.out.println("\nYou manage to hide next to a desk right as the aliens burst through the door. You shut your eyes and desperately hope that you won't be found. However, your hope fades as you are grabbed by the neck and roughly hauled to your feet. You open your eyes and are met with a fist flying at your face. You quickly squeeze your eyes shut before it makes contact with your face and you feel yourself falling onto the floor.");
								System.out.println("\nTHUMP! Your eyes shoot open and you find yourself face to face with... your bed...? You look down at yourself and realize that you are on the floor with your legs tangled in your blankets. You let out a sigh of relief as you realize that you must have been having a nightmare. You untangle your legs from your blankets and get back into bed, relieved that it was all a dream...");
								break LOOP_3;
							}
							else {
								System.out.println("Command not recognized. Please try again.\n");
								fail = false;
							}
						}
					}
					else {
						System.out.println("Command not recognized. Please try again.\n");
					}
				}
			}
			else if (input.equalsIgnoreCase("sneak inside")) {
				character.currentHealth = character.move();
				if (character.currentHealth <= 0) {
					gameStatus = false;
					break LOOP_3;
				}
				System.out.println("\nYou quietly sneak around the guard and reach your hand out for the door handle. You carefully turn the handle and open the door, only to realize that doing so has created a loud noise.\nThe guard's eyes quickly shoot open and sees you right away. You are quickly overpowered by the guard who proceeds to eleminate the threat, you.");
				gameStatus = false;
				break LOOP_3;
			}
			else {
				System.out.println("Command not recognized. Please try again.\n");
				input = in.nextLine();
			}
		}
		
		// Game Over
		if (!gameStatus) {
			System.out.println("You ran out of HP. Better luck next time!\nGAME OVER!");
		}
		else {
			System.out.println("You did it! You managed to survive!\nAchievement Unlocked!\nSURVIVOR");
		}
	}
    // Method explains what happens if the player types in "status" during any time in the game
    public static void status(String command, Player person)  {
        if (statusCheck(command)) {
			System.out.println("You currently have " + person.playerCurrentHP() + " HP and " + person.playerCurrentPotions() + " potions.");
        }
    }
    // Method checks to see if the player typed in "status"
    public static Boolean statusCheck(String prompt) {
        if (prompt.equalsIgnoreCase("Status")) {
            return true;
        }
        else {
            return false;
        }
    }
}
