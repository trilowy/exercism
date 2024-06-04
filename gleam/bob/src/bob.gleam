import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  case
    string.is_empty(remark),
    string.ends_with(remark, "?"),
    string.uppercase(remark) == remark
    && string.lowercase(remark) != remark
  {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, _ -> "Sure."
    _, _, True -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}
