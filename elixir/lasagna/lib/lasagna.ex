defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(elapsed_minutes) do
    expected_minutes_in_oven() - elapsed_minutes
  end

  def preparation_time_in_minutes(nb_of_layers) do
    nb_of_layers * 2
  end

  def total_time_in_minutes(nb_of_layers, min_in_oven) do
    preparation_time_in_minutes(nb_of_layers) + min_in_oven
  end

  def alarm() do
    "Ding!"
  end
end
