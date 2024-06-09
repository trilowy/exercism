import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let is_trade_possible_and_interesting =
    set.contains(collection, my_card) && !set.contains(collection, their_card)

  let collection =
    collection
    |> set.delete(my_card)
    |> set.insert(their_card)

  #(is_trade_possible_and_interesting, collection)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(with: set.intersection)
  |> result.unwrap(or: set.new())
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(from: set.new(), with: set.union)
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(keeping: string.starts_with(_, "Shiny "))
}
