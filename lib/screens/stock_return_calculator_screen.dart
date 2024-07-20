import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/stock_provider.dart';
import '../widgets/stock_input_form.dart';
import '../widgets/return_display.dart';

class StockReturnCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Return Calculator'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Stock Return Calculator Info'),
                  content: Text('Enter details to calculate stock return.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Calculate Stock Return',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StockInputForm(
                  onSubmit: (symbol, purchaseDate, sellDate, quantity) {
                    stockProvider.calculateStockReturn(symbol, purchaseDate, sellDate, quantity);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            if (stockProvider.isLoading)
              Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary))
            else if (stockProvider.errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Failed to fetch stock data',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              )
            else if (stockProvider.stockReturn != null)
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ReturnDisplay(stockReturn: stockProvider.stockReturn!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
