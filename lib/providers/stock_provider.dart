import 'package:flutter/foundation.dart';
import 'package:stock_calculator/services/stock_service.dart';
import 'package:stock_calculator/models/stock_return.dart';

class StockProvider with ChangeNotifier {
  final StockService _stockService = StockService();
  StockReturn? _stockReturn;
  String? _errorMessage;
  bool _isLoading = false;

  DateTime? _purchaseDate;
  DateTime? _sellDate;

  StockReturn? get stockReturn => _stockReturn;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  DateTime? get purchaseDate => _purchaseDate;
  DateTime? get sellDate => _sellDate;

  Future<void> calculateStockReturn(String symbol, DateTime purchaseDate, DateTime sellDate, int quantity) async {
    _isLoading = true;
    _errorMessage = null;
    _purchaseDate = purchaseDate;
    _sellDate = sellDate;
    notifyListeners();

    try {
      final purchaseData = await _stockService.fetchStockData(symbol, purchaseDate);
      final sellData = await _stockService.fetchStockData(symbol, sellDate);

      if (purchaseData == null || sellData == null) {
        _errorMessage = 'Failed to fetch stock data for calculation.';
        _stockReturn = null;
      } else {
        final purchasePrice = purchaseData['close'];
        final sellPrice = sellData['close'];

        final profitOrLoss = (sellPrice - purchasePrice) * quantity;

        _stockReturn = StockReturn(
          symbol: symbol,
          purchaseDate: purchaseDate,
          sellDate: sellDate,
          quantity: quantity,
          profitOrLoss: profitOrLoss,
        );

        _errorMessage = null;
      }
    } catch (e) {
      _errorMessage = 'Error calculating stock return: $e';
      _stockReturn = null;
      print('Error calculating stock return: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
