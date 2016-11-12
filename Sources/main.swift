import Foundation

enum GameState {
  case begin
  case instructions
  case play
  case gameOver
}

struct RPS {
  static let rock: String = "rock"
  static let paper: String = "paper"
  static let scissors: String = "scissors"
}

var gameState: GameState = .begin
var player: Player = Player()
var playerName: String = ""
var hasQuit = false

func gameLoop(){
  while !hasQuit{
    switch gameState{
      case .begin:
        startGame()
      case .instructions:
        handleInstructions()
        printRandomSeparator()
      case .play:
        break
      case .gameOver:
        break
    }
  }
}

func startGame(){
  printRandomSeparator()
  print("Hi, hello, welcome to the terminal Rock/Paper/Scissors Game")
  printRandomSeparator()
  prompt()
  printRandomSeparator()
}

func prompt(){
  print("What is your name?")
  let name = getInput()
  if name != ""{
    player = Player.init(name)
    gameState = .instructions
  }else{
    print("Why you playing games?")
    prompt()
  }
}

func printInstructions(){
  let instructions = "This game is a survival of\n" +
                      "wits. You must defend your life\n" +
                      "using only your fists... flex them into\n" +
                      "the shape of a rock, a piece of paper,\n" +
                      "two fingers extended- poised to cut.\n" +
                      "Stay alive by guessing correctly and smiting\n" +
                      "your foes, earning the loot they drop. If your\n" +
                      "HP drops to 0, you perish- recover your HP with\n" +
                      "consecutive successful attacks. Type 'r', 'p', or 's'\n" +
                      "to attack with the respective fist form.\n"
  printRandomSeparator()
  print(instructions)
  printRandomSeparator()
}

func handleInstructions(){
  player.showStats()
  print(
    "Ok boyfriend, er- \(player.name)- if you know how to play\n" +
    "then type 'p' to start, if you would like to\n" +
    "read the instructions, type 'i',\n" +
    "if you would like to quit, type 'q'."
  )

  let option = getInput()
  if option == "q" || option == "quit"{
    hasQuit = true
  }else if option == "i"{
    printInstructions()
  }else if option == "p"{
    gameState = .play
  }else{
    print("Not a valid option, please try again.")
    hasQuit = true
  }
}

gameLoop()
