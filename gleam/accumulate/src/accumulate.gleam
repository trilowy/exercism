pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [elem, ..rest] -> [fun(elem), ..accumulate(rest, fun)]
  }
}
