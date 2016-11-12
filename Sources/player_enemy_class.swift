import Foundation

public class Player
{
  public var health: Int
  public var attack: Int
  public var defense: Int
  public var speed: Int
  public var name: String

  init()
  {
    self.health = 0
    self.attack = 0
    self.defense = 0
    self.speed = 0
    self.name = ""
  }

  init(_ name: String)
  {
    self.health = rollDice(20...25)
    self.attack = rollDice()
    self.defense = rollDice()
    self.speed = rollDice()
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
      "HP = \(self.health) / 25\n" +
      "Attack = \(self.attack) / 6\n" +
      "Defense = \(self.defense) / 6\n" +
      "Speed = \(self.speed) / 6"
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

    init(type: String = "regular")
    {
      if type == "rock"{
        self.health = rollDice(25...30)
        self.attack = rollDice(3...6)
        self.defense = rollDice(3...6)
        self.speed = rollDice(0...1)
        self.gimmick = "Gets a crit on rock attacks, not very fast"
      }else{
        self.health = rollDice(3...5)
        self.attack = rollDice(0...3)
        self.defense = rollDice(0...3)
        self.speed = rollDice(0...3)
        self.gimmick = "Just a cretin"
      }

    }
  }
