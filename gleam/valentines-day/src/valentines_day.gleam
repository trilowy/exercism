// please define the 'Approval' custom type
pub type Approval {
  Yes
  No
  Maybe
}

// please define the 'Cuisine' custom type
pub type Cuisine {
  Korean
  Turkish
}

// please define the 'Genre' custom type
pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

// please define the 'Activity' custom type
pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Movie(Romance) -> Yes
    Restaurant(Korean) -> Yes
    Restaurant(Turkish) -> Maybe
    Walk(km) if km > 11 -> Yes
    Walk(km) if km > 6 -> Maybe
    _ -> No
  }
}
