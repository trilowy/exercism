pub fn convert(number: Int) -> String {
  case number {
    _ if number >= 1000 -> "M" <> convert(number - 1000)
    _ if number >= 900 -> "CM" <> convert(number - 900)
    _ if number >= 500 -> "D" <> convert(number - 500)
    _ if number >= 400 -> "CD" <> convert(number - 400)
    _ if number >= 100 -> "C" <> convert(number - 100)
    _ if number >= 90 -> "XC" <> convert(number - 90)
    _ if number >= 50 -> "L" <> convert(number - 50)
    _ if number >= 40 -> "XL" <> convert(number - 40)
    _ if number >= 10 -> "X" <> convert(number - 10)
    _ if number >= 9 -> "IX" <> convert(number - 9)
    _ if number >= 5 -> "V" <> convert(number - 5)
    _ if number >= 4 -> "IV" <> convert(number - 4)
    _ if number >= 1 -> "I" <> convert(number - 1)
    _ -> ""
  }
}
