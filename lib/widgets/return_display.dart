import 'package:flutter/material.dart';
import '../models/stock_return.dart';

class ReturnDisplay extends StatelessWidget {
  final StockReturn stockReturn;

  ReturnDisplay({required this.stockReturn});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Stock Symbol: ${stockReturn.symbol}'),
            Text('Purchase Date: ${stockReturn.purchaseDate.toLocal()}'.split(' ')[0]),
            Text('Sell Date: ${stockReturn.sellDate.toLocal()}'.split(' ')[0]),
            Text('Quantity: ${stockReturn.quantity}'),
            Text(
              'Profit/Loss: \$${stockReturn.profitOrLoss.toStringAsFixed(2)}',
              style: TextStyle(
                color: stockReturn.profitOrLoss >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
