# bingo-simulator
R Studio Project that simulates a BINGO game

This project is a simulation of a Bingo game implemented in R. Each player is assigned a unique Bingo sheet, and numbers are drawn randomly until a player (or players) wins by marking all numbers in a row, column, or diagonal. The game continues until a winner is declared.

- CSV Input: Player data is read from a CSV file.
- Player Setup: Each player is assigned a unique Bingo sheet and a corresponding "hit" matrix to track their progress.
- Game Logic: Numbers are drawn randomly, and players' Bingo sheets are updated accordingly. The game checks for a winner after each draw.
- User Interaction: The game prompts the user to press Enter to continue to the next round until a winner is found.

How It Works

1. Load Player Data: Reads player information from a CSV file and assigns each player a unique ID.
2. Generate Bingo Sheets: Each player receives a random 5x5 Bingo sheet with unique numbers.
3. Track Progress: A "hit" matrix is created for each player to track marked numbers.
4. Game Loop: 
   - A random number is drawn.
   - Each player’s Bingo sheet is checked and updated if the number is on their sheet.
   - The game checks for a Bingo (a complete row, column, or diagonal of marked numbers).
5. Declare Winner: Once a player wins, the game announces the winner(s) and ends.

How to Run

1. Ensure you have a CSV file with player data, including first and last names.
2. Run the R script.
3. Follow the prompts to draw numbers and proceed through the game until a winner is declared.

Notes

- The game continues until at least one player achieves Bingo.
- In case of multiple winners, the game will announce all winners.

Dependencies

- R (no additional packages required)

License

This project is open-source and available under the MIT License.
