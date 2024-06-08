import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: health, ..) if health > 0 -> None
    Player(level: level, ..) if level >= 10 ->
      Some(Player(..player, health: 100, mana: Some(100)))
    _ -> Some(Player(..player, health: 100))
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player {
    Player(mana: Some(mana), ..) if mana < cost -> #(player, 0)
    Player(mana: Some(mana), ..) -> #(
      Player(..player, mana: Some(mana - cost)),
      cost * 2,
    )
    Player(mana: None, health: health, ..) -> #(
      Player(..player, health: int.max(0, health - cost)),
      0,
    )
  }
}
