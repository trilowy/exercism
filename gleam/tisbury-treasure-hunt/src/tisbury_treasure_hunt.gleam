pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(p1, p2) = place_location
  #(p2, p1)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  case treasures {
    [] -> 0
    [treasure, ..other_treasures] ->
      case treasure_location_matches_place_location(place.1, treasure.1) {
        True -> 1 + count_place_treasures(place, other_treasures)
        False -> count_place_treasures(place, other_treasures)
      }
  }
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure.0, place.0, desired_treasure.0 {
    "Brass Spyglass", "Abandoned Lighthouse", _ -> True
    "Amethyst Octopus", "Stormy Breakwater", desired_treasure
      if desired_treasure == "Crystal Crab"
      || desired_treasure == "Glass Starfish"
    -> True
    "Vintage Pirate Hat", "Harbor Managers Office", desired_treasure
      if desired_treasure == "Model Ship in Large Bottle"
      || desired_treasure == "Antique Glass Fishnet Float"
    -> True
    _, _, _ -> False
  }
}
