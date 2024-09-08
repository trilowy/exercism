import gleam/string

pub fn recite(
  start_bottles start_bottles: Int,
  take_down take_down: Int,
) -> String {
  case take_down {
    1 -> recite_one_verse(start_bottles)

    _ ->
      recite_one_verse(start_bottles)
      <> "\n\n"
      <> recite(start_bottles - 1, take_down - 1)
  }
}

fn recite_one_verse(start_bottles start_bottles: Int) -> String {
  let start =
    number_to_string(start_bottles)
    |> string.capitalise

  let take = number_to_string(start_bottles - 1)

  case start_bottles {
    1 -> {
      start <> " green bottle hanging on the wall,
" <> start <> " green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be " <> take <> " green bottles hanging on the wall."
    }

    2 -> {
      start <> " green bottles hanging on the wall,
" <> start <> " green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be " <> take <> " green bottle hanging on the wall."
    }

    _ -> {
      start <> " green bottles hanging on the wall,
" <> start <> " green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be " <> take <> " green bottles hanging on the wall."
    }
  }
}

fn number_to_string(number: Int) -> String {
  case number {
    0 -> "no"
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"
    _ -> "ten"
  }
}
