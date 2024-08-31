pub fn egg_count(number: Int) -> Int {
  do_egg_count(number, 0)
}

fn do_egg_count(number: Int, count: Int) -> Int {
  case number {
    0 -> count
    _ -> do_egg_count(number / 2, count + { number % 2 })
  }
}
