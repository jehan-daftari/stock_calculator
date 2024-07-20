import 'package:http/http.dart' as http;
import 'dart:convert';

class StockService {
  final String apiKey = 'VTKTBY56ZXZYIVH8';

  Future<List<String>> fetchAvailableSymbols() async {
    await Future.delayed(Duration(seconds: 1)); // Simulating async delay
    return ['AAPL', 'GOOGL', 'AMZN', 'TSLA', 'MSFT']; // Example list
  }

  Future<Map<String, dynamic>?> fetchStockData(String symbol, DateTime date) async {
    final dateString = date.toIso8601String().substring(0, 10);
    final url = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      print('API Request URL: $url');
      print('API Response Status Code: ${response.statusCode}');
      print('API Response Body: ${response.body}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['Time Series (Daily)'][dateString];
      } else {
        print('Failed to load stock data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching stock data: $e');
      return null;
    }
  }
}
