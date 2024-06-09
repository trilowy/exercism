import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(0, limit - 1)
  |> list.filter(is_duplicate_of_any_factor(_, factors))
  |> int.sum
}

fn is_duplicate_of_any_factor(number: Int, factors: List(Int)) -> Bool {
  list.any(factors, fn(factor) { factor > 0 && number % factor == 0 })
}
