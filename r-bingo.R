# Read CSV into R
players <- read.csv("~/programming-fundamentals/data/players.csv", header=TRUE)

# Adding a row into the Players dataframe
players$id <- 1:nrow(players)  

# Creating a vector called "player_names" 
player_names <- paste(players$First.Name, players$"Last.Name", sep = " ")

# Creating a random bingo sheet for the players
create_bingo_sheet <- function() {
  return(matrix(sample(1:99, 25, replace=FALSE), nrow=5, ncol=5))
}

# Creating a 5x5 matrix that represents FALSE values - bingo values that have not been called yet
create_hit_matrix <- function() {
  return(matrix(FALSE, nrow=5, ncol=5))
}

# Giving each player a bingo sheet
players$bingo_sheet <- lapply(1:nrow(players), function(x) create_bingo_sheet())

# Giving each player a "hit" matrix
players$hit_matrix <- lapply(1:nrow(players), function(x) create_hit_matrix())

# Updating hits on the player's bingo matrices
update_hits <- function(number, bingo_sheet, hit_matrix) {
  hit_matrix[bingo_sheet == number] <- TRUE
  return(hit_matrix)
}

# Checking if there is a win in any column, row or diagonal line of the player's matrices
check_bingo <- function(hit_matrix) {
  row_bingo <- apply(hit_matrix, 1, all)
  col_bingo <- apply(hit_matrix, 2, all)
  diag_bingo <- all(diag(hit_matrix)) || all(diag(hit_matrix[5:1, ]))
  return(any(row_bingo, col_bingo, diag_bingo))
}

# A variable to indicate current game progress
game_on <- TRUE

# Creating a WHILE loop until "game_on" variable becomes FALSE - indicating a winner
while(game_on) {
  drawn_number <- sample(1:99, 1)
  cat("The next number is:", drawn_number, "\n")
  
  possible_winners <- c()
  
  for(i in 1:nrow(players)) {
    players$hit_matrix[[i]] <- update_hits(drawn_number, players$bingo_sheet[[i]], players$hit_matrix[[i]])
    
    if(drawn_number %in% players$bingo_sheet[[i]]) {
      cat(player_names[i], "has hit the number", drawn_number, "\n")
    }
    
    if(check_bingo(players$hit_matrix[[i]])) {
      possible_winners <- c(possible_winners, players$id[i])
    }
  }
  
  if(length(possible_winners) > 0) {
    game_on <- FALSE
    cat("Bingo!\n")
    if(length(possible_winners) == 1) {
      cat(player_names[possible_winners], "has won.\n")
    } else {
      winner_names <- paste(player_names[possible_winners], sep=" ", collapse=" and ")
      cat(winner_names, "have won.\n")
    }
  } else {
    readline(prompt="Press enter to continue to the next round.")
  }
}

# NOTE: Keep pressing enter to keep the game going until a winner appears!

