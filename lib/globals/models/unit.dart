enum Units {
  kilogram,
  gram,
  liter,
  milliliter,
  piece,
}

class Unit {
  const Unit({
    required this.name,
    required this.symbol,
  });

  final String name;
  final String symbol;
}
