pub fn is_armstrong_number(num: u32) -> bool {
    let str_num = num.to_string();
    let size = str_num.len().try_into().expect("to convert usize into u32");

    let armstrong: u32 = str_num
        .chars()
        .map(|c| c.to_digit(10).expect("to convert char into u32"))
        .map(|n| n.pow(size))
        .fold(0, |acc, n| acc.saturating_add(n));

    armstrong == num
}
