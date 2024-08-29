import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = int.digits(number, 10)
  let power = list.length(digits)

  let result =
    digits
    |> list.map(int_power(_, power))
    |> int.sum

  result == number
}

fn int_power(number: Int, power: Int) -> Int {
  do_int_power(number, power, 1)
}

fn do_int_power(number: Int, power: Int, acc: Int) -> Int {
  case power {
    0 -> acc
    _ -> do_int_power(number, power - 1, acc * number)
  }
}
