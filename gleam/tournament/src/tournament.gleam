import gleam/dict.{type Dict}
import gleam/int
import gleam/list
import gleam/option.{None, Some}
import gleam/order.{type Order, Eq, Gt, Lt}
import gleam/string

const header = "Team                           | MP |  W |  D |  L |  P"

type Score {
  Score(
    team: String,
    matches_played: Int,
    matches_won: Int,
    matches_drawn: Int,
    matches_lost: Int,
    points: Int,
  )
}

pub fn tally(input: String) -> String {
  string.split(input, "\n")
  |> list.fold(dict.new(), parse_line)
  |> dict.values
  |> list.sort(compare)
  |> list.map(to_string)
  |> list.fold(header, fn(acc, score) { acc <> "\n" <> score })
}

fn parse_line(scores: Dict(String, Score), line: String) -> Dict(String, Score) {
  case string.is_empty(line) {
    True -> dict.new()
    False -> {
      let assert [team_1, team_2, result] = string.split(line, ";")

      let #(team_1_score, team_2_score) = case result {
        "win" -> #(team_win(team_1), team_loose(team_2))
        "draw" -> #(team_draw(team_1), team_draw(team_2))
        "loss" -> #(team_loose(team_1), team_win(team_2))
        _ -> panic as "Can’t parse match result"
      }

      scores
      |> add_score(team_1_score)
      |> add_score(team_2_score)
    }
  }
}

fn add_score(scores: Dict(String, Score), score: Score) -> Dict(String, Score) {
  dict.upsert(scores, score.team, fn(existing_score) {
    case existing_score {
      None -> score
      Some(existing_score) ->
        Score(
          ..score,
          matches_played: score.matches_played + existing_score.matches_played,
          matches_won: score.matches_won + existing_score.matches_won,
          matches_drawn: score.matches_drawn + existing_score.matches_drawn,
          matches_lost: score.matches_lost + existing_score.matches_lost,
          points: score.points + existing_score.points,
        )
    }
  })
}

fn team_win(team: String) -> Score {
  Score(
    team,
    matches_played: 1,
    matches_won: 1,
    matches_drawn: 0,
    matches_lost: 0,
    points: 3,
  )
}

fn team_loose(team: String) -> Score {
  Score(
    team,
    matches_played: 1,
    matches_won: 0,
    matches_drawn: 0,
    matches_lost: 1,
    points: 0,
  )
}

fn team_draw(team: String) -> Score {
  Score(
    team,
    matches_played: 1,
    matches_won: 0,
    matches_drawn: 1,
    matches_lost: 0,
    points: 1,
  )
}

fn compare(score_1: Score, score_2: Score) -> Order {
  case int.compare(score_1.points, score_2.points) {
    Lt -> Gt
    Eq -> string.compare(score_1.team, score_2.team)
    Gt -> Lt
  }
}

fn to_string(score: Score) -> String {
  string.pad_right(score.team, to: 30, with: " ")
  <> " | "
  <> score.matches_played |> int.to_string |> string.pad_left(to: 2, with: " ")
  <> " | "
  <> score.matches_won |> int.to_string |> string.pad_left(to: 2, with: " ")
  <> " | "
  <> score.matches_drawn |> int.to_string |> string.pad_left(to: 2, with: " ")
  <> " | "
  <> score.matches_lost |> int.to_string |> string.pad_left(to: 2, with: " ")
  <> " | "
  <> score.points |> int.to_string |> string.pad_left(to: 2, with: " ")
}
