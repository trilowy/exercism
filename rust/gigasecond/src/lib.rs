use time::{ext::NumericalDuration, PrimitiveDateTime as DateTime};

const GIGA: i64 = 1_000_000_000;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    start + GIGA.seconds()
}
