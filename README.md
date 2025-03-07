# hangman
ODIN hangman project
# Hangman Game in Ruby

## Overview
This is a command-line Hangman game written in Ruby. The game randomly selects a word from a list, and the player must guess letters to complete the word before running out of attempts. The game includes features to save progress and load previously saved games.

## Features
- Randomly selects a word (5-12 characters long) from `google-10000-english-no-swears.txt`.
- Displays:
  - Remaining incorrect guesses.
  - Correctly guessed letters in their positions (e.g., `_ r o g r a _ _ i n g`).
  - Incorrectly guessed letters.
- Case-insensitive letter input.
- Option to save the game at any turn.
- Option to load a previously saved game upon startup.

## Game Rules
1. The game randomly selects a word from the word list.
2. The player is given **6 incorrect guesses** before losing the game.
3. The player guesses one letter at a time.
4. If the guessed letter is in the word, it is revealed in its correct position(s).
5. If the guessed letter is incorrect, it is added to the incorrect letters list, and the number of remaining incorrect guesses decreases.
6. The game continues until the player either:
   - Correctly guesses the word (win).
   - Runs out of incorrect guesses (lose).
7. At any turn, the player can choose to save the game.
8. When starting the program, the player has the option to load a saved game and continue playing from the exact state where they left off.

## How to Play
1. Run the program.
2. Choose to start a new game or load a saved game.
3. If starting a new game, a word is randomly selected.
4. Guess letters one at a time.
5. Continue guessing until the word is complete or the player runs out of guesses.
6. At any time, enter the save command to save progress.
7. If the game is lost, the correct word is revealed.
8. Play again or exit.

## Save and Load Feature
- **Save:** At the start of any turn, the player can enter a command to save their progress.
- **Load:** When launching the game, the player can choose to load a previously saved game and resume from the exact state where they left off.

## Requirements
- Ruby (latest stable version recommended)
- `google-10000-english-no-swears.txt` word list file (ensure it is in the correct location)

## Future Enhancements
- Implementing difficulty levels (e.g., easy, medium, hard based on word length or guess count).
- Adding a graphical representation of the Hangman using ASCII art.
- Multiplayer mode.

---

This README provides a structured overview of the game. Let me know if any changes are needed before proceeding with development!

