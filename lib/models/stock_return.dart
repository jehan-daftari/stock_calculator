class StockReturn {
  final String symbol;
  final DateTime purchaseDate;
  final DateTime sellDate;
  final int quantity;
  final double profitOrLoss;

  StockReturn({
    required this.symbol,
    required this.purchaseDate,
    required this.sellDate,
    required this.quantity,
    required this.profitOrLoss,
  });
}
