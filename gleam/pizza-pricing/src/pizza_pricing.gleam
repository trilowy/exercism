// please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_price(pizza, 0)
}

fn do_pizza_price(pizza: Pizza, price: Int) -> Int {
  case pizza {
    Margherita -> 7 + price
    Caprese -> 9 + price
    Formaggio -> 10 + price
    ExtraSauce(pizza) -> do_pizza_price(pizza, price + 1)
    ExtraToppings(pizza) -> do_pizza_price(pizza, price + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [_] -> 3 + do_order_price(order, 0)
    [_, _] -> 2 + do_order_price(order, 0)
    _ -> do_order_price(order, 0)
  }
}

fn do_order_price(order: List(Pizza), price: Int) -> Int {
  case order {
    [] -> price
    [pizza, ..pizzas] -> do_order_price(pizzas, price + pizza_price(pizza))
  }
}
