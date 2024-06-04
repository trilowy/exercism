import gleam/int

pub fn convert(number: Int) -> String {
  let divisible_by_3 = number % 3 == 0
  let divisible_by_5 = number % 5 == 0
  let divisible_by_7 = number % 7 == 0

  case divisible_by_3, divisible_by_5, divisible_by_7 {
    False, False, False -> int.to_string(number)
    _, _, _ ->
      sound(divisible_by_3, "Pling")
      <> sound(divisible_by_5, "Plang")
      <> sound(divisible_by_7, "Plong")
  }
}

fn sound(is_divisible: Bool, sound: String) -> String {
  case is_divisible {
    True -> sound
    _ -> ""
  }
}
