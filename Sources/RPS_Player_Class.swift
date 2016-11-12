  public class Player {
    public var health: Int
    public var attack: Int
    public var defense: Int
    public var speed: Int

    init(health: Int, attack: Int, defense: Int, speed: Int){
      self.health = health
      self.attack = attack
      self.defense = defense
      self.speed = speed
    }
  }

  public class Enemy{
    public var health: Int
    public var attack: Int
    public var defense: Int
    public var speed: Int
    public var gimmick: String

    init(health: Int, attack: Int, defense: Int, speed: Int, gimmick: String){
      self.health = health
      self.attack = attack
      self.defense = defense
      self.speed = speed
      self.gimmick = gimmick
    }
  }
