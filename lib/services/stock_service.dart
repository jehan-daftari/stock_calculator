import 'package:http/http.dart' as http;
import 'dart:convert';

class StockService {
  final String apiKey = 'VTKTBY56ZXZYIVH8';

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
        if (data.containsKey('Time Series (Daily)')) {
          final dailyData = data['Time Series (Daily)'][dateString];
          if (dailyData != null) {
            return {
              'open': double.parse(dailyData['1. open']),
              'high': double.parse(dailyData['2. high']),
              'low': double.parse(dailyData['3. low']),
              'close': double.parse(dailyData['4. close']),
              'volume': int.parse(dailyData['5. volume']),
            };
          }
        }
        print('Data not found for $dateString');
        return null;
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
