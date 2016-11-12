import Foundation

struct RPS {
  static let rock: String = "r"
  static let paper: String = "p"
  static let scissors: String = "s"
}

func battleHUD()
{
    let one = spawnEnemy()
    print("A wild \(one.name) has appeared! What will you do?")
    printRandomSeparator()
    battle(one)
}


func spawnEnemy() -> Enemy
{
    return Enemy()
}

func battle(_ enemy: Enemy)
{
  let input = getInput()
  if input == "q"
  {
    hasQuit = true
  }else if input == RPS.rock
  {
      printRandomSeparator()
      player.attackChoice = RPS.rock
      damageCalc(player, enemy)
      battle(enemy)
    }else if input == RPS.paper
    {
      printRandomSeparator()
      player.attackChoice = RPS.paper
      damageCalc(player, enemy)
      battle(enemy)
    }else if input == RPS.scissors
    {
      printRandomSeparator()
      player.attackChoice = RPS.scissors
      damageCalc(player, enemy)
      battle(enemy)
    }

  }


func damageCalc(_ player: Player, _ enemy: Enemy)
{
  enemy.attacks()

  if player.speed > enemy.speed
  {
    enemy.health -= (player.attack - enemy.defense)
    print("Your attacker's health is now \(enemy.health)")
    if enemy.health > 0{
      player.health -= enemy.attack
      print("Your health is now \(player.health)")
    }
  }else
  {
    player.health -= (enemy.attack - player.defense)
    print("Your health is now \(player.health)")
    enemy.health -= (player.attack - enemy.defense)
    print("Your attacker's health is now \(enemy.health)")
  }
}
