String addZeroIfLessThanTen(number) {
  return '${"$number".length < 2 ? "0$number" : number}';
}
