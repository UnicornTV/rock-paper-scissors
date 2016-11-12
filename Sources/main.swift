import Foundation

enum GameState {
  case begin
  case instructions
  case play
  case gameOver
}

var gameState: GameState = .begin
var player: Player = Player()
var rerollCount: Int = 3
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
        battleHUD()
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
    "Ok boyfriend, er- \(player.name)\n" +
    "if you know how to play then type 'p',\n" +
    "if you would like to read the instructions, type 'i',\n" +
    "if you would like to reroll, type 'r',\n" +
    "if you would like to quit, type 'q'."
  )

  let option = getInput()
  if option == "q" || option == "quit"
  {
    hasQuit = true
  }
  else if option == "i"
  {
    printInstructions()
  }
  else if option == "p"
  {
    gameState = .play
  }
  else if option == "r"
  {
    if rerollCount > 0
    {
      player.reroll()
      rerollCount -= 1
      print("\(rerollCount) rerolls left\n")
    }else
    {
      print("Ya used up all ur rerolls. Ya Blew It.\n")
    }
  }
  else{
    print("Not a valid option, please try again.")
    hasQuit = true
  }
}

gameLoop()
