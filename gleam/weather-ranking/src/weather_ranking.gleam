import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(left), Celsius(right) -> float.compare(left, right)
    Fahrenheit(left), Fahrenheit(right) -> float.compare(left, right)
    Fahrenheit(left), Celsius(right) ->
      fahrenheit_to_celsius(left) |> float.compare(right)
    Celsius(left), Fahrenheit(right) ->
      fahrenheit_to_celsius(right) |> float.compare(left, _)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(fn(t1, t2) {
    compare_temperature(t1.temperature, t2.temperature)
  })
}
