pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number > 0 {
    False -> Error(NonPositiveNumber)
    True -> Ok(calc_steps(number, 0))
  }
}

fn calc_steps(number: Int, step: Int) -> Int {
  case number {
    1 -> step
    _ if number % 2 == 0 -> calc_steps(number / 2, step + 1)
    _ -> calc_steps(number * 3 + 1, step + 1)
  }
}
