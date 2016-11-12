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


let stringOfAst = "**************"
let stringOfHash = "#############"
let stringOfDollar = "$$$$$$$$$$$$$"
let stringOfCarat = "^^^^^^^^^^^^^^"

let separatorArray = [stringOfAst, stringOfHash, stringOfCarat, stringOfDollar]

var gameState: GameState = .begin
var playerName: String = ""
var hasQuit = false

func getInput() -> String{
  let keyboard = FileHandle.standardInput
  let inputData = keyboard.availableData
  let strData = String(data: inputData, encoding: String.Encoding.utf8)!
  return strData.trimmingCharacters(in: CharacterSet.newlines)
}

func rollDice(_ range: ClosedRange<Int> = 1...6) -> Int{
    let min = range.lowerBound
    let max = range.upperBound
    return Int(arc4random_uniform(UInt32(max - min))) + min
}

func printRandomSep(){
  print(separatorArray[rollDice(0...3)])
}

func gameLoop(){
  while !hasQuit{
    switch gameState{
      case .begin:
        startGame()
      case .instructions:
        handleInstructions()
        printRandomSep()
      case .play:
        break
      case .gameOver:
        break
    }
  }
}

func startGame(){
  printRandomSep()
  print("Hi, hello, welcome to the terminal Rock/Paper/Scissors Game")
  printRandomSep()
  prompt()
  printRandomSep()
}

func prompt(){
  print("What is your name?")
  let name = getInput()
  if name != ""{
    playerName = name
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
  printRandomSep()
  print(instructions)
  printRandomSep()

}

func handleInstructions(){
  print(
    "Ok boyfriend, er- \(playerName)- if you know how to play\n" +
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
