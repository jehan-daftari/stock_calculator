import 'package:flutter/material.dart';

class TransactionHistoryItem extends StatelessWidget {
  final String symbol;
  final DateTime purchaseDate;
  final DateTime sellDate;
  final int quantity;
  final double profitOrLoss;

  TransactionHistoryItem({
    required this.symbol,
    required this.purchaseDate,
    required this.sellDate,
    required this.quantity,
    required this.profitOrLoss,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Symbol: $symbol',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Purchase Date: ${purchaseDate.toString()}',
          style: TextStyle(fontSize: 14),
        ),
        Text(
          'Sell Date: ${sellDate.toString()}',
          style: TextStyle(fontSize: 14),
        ),
        Text(
          'Quantity: $quantity',
          style: TextStyle(fontSize: 14),
        ),
        Text(
          'Profit/Loss: ${profitOrLoss.toString()}',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
