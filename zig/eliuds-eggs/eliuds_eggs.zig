pub fn eggCount(number: usize) usize {
    return @popCount(number);
    // var egg_count: usize = 0;
    // var n = number;
    //
    // while (n != 0) {
    //     egg_count += n & 1;
    //     n >>= 1;
    // }
    //
    // return egg_count;
}
