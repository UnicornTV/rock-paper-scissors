import Foundation

let stringOfAst = "**************"
let stringOfHash = "#############"
let stringOfDollar = "$$$$$$$$$$$$$"
let stringOfCarat = "^^^^^^^^^^^^^^"

let separatorArray = [stringOfAst, stringOfHash, stringOfCarat, stringOfDollar]


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


func printRandomSeparator(){
  print(separatorArray[rollDice(0...3)])
}
