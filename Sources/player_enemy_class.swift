import Foundation

public class Player
{
  public var health: Int
  public var attack: Int
  public var defense: Int
  public var speed: Int
  public var name: String
  public var attackChoice: String

  init()
  {
    self.health = 0
    self.attack = 0
    self.defense = 0
    self.speed = 0
    self.attackChoice = ""
    self.name = ""
  }

  init(_ name: String)
  {
    self.health = rollDice(20...25)
    self.attack = rollDice(4...8)
    self.defense = rollDice(4...8)
    self.speed = rollDice(4...8)
    self.attackChoice = ""
    self.name = name
  }

  func reroll(){
    self.health = rollDice(20...25)
    self.attack = rollDice()
    self.defense = rollDice()
    self.speed = rollDice()
  }

  func showStats(){
    print(
      "It seems as if your stats are:\n" +
      "HP = \(self.health)\n" +
      "Attack = \(self.attack)\n" +
      "Defense = \(self.defense)\n" +
      "Speed = \(self.speed)"
    )
    printRandomSeparator()
  }

}

  public class Enemy
  {
    public var health: Int
    public var attack: Int
    public var defense: Int
    public var speed: Int
    public var gimmick: String
    public var name: String
    public var attackChoice: String

    init(type: String = "regular")
    {
      if type == "rock"{
        self.attackChoice = RPS.rock
        self.name = "Rock Person"
        self.health = rollDice(25...30)
        self.attack = rollDice(3...6)
        self.defense = rollDice(3...6)
        self.speed = rollDice(0...4)
        self.gimmick = "Gets a crit on rock attacks, not very fast"
      }else{
        self.attackChoice = RPS.paper
        self.name = "Cretin"
        self.health = rollDice(3...5)
        self.attack = rollDice(0...3)
        self.defense = rollDice(0...3)
        self.speed = rollDice(0...3)
        self.gimmick = "Just a cretin"
      }

    }

    func showStats(){
      print(
        "It seems as if this enemy has these stats:\n" +
        "HP = \(self.health)\n" +
        "Attack = \(self.attack)\n" +
        "Defense = \(self.defense)\n" +
        "Speed = \(self.speed)"
      )
  }

  func attacks()
  {
      let weapon = rollDice(0...2)
      if weapon == 0
      {
        self.attackChoice = RPS.rock
      }else if weapon == 1
      {
        self.attackChoice = RPS.paper
      }else
      {
        self.attackChoice = RPS.scissors
      }
  }

}
