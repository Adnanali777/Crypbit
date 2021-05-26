import 'package:crypto_app/models/crytomodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:intl/intl.dart';

class CurrencyApiProvider {
  static final _key = '7e2b3169a3af6ec3e8d9dfa4dfcc213be76cb8fe';

  Future<List<CryptoModel>> getCurrencies() async {
    final url =
        'https://api.nomics.com/v1/currencies/ticker?key=7e2b3169a3af6ec3e8d9dfa4dfcc213be76cb8fe&interval=1d,30d&convert=EUR&per-page=100&page=1';

    List<CryptoModel> result;

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('API fetched');
      }
      final body = json.decode(response.body) as List;
      result = body.map((e) => CryptoModel.fromJson(e)).toList();
      /*result.forEach((e) {
        print(NumberFormat.compact().format(double.parse(e.marketCap)));
      });*/
      result.forEach((e) {
        print(NumberFormat.currency(
                decimalDigits: 3, symbol: '\$', locale: 'en_us')
            .format(double.parse(e.price)));
      });
    } catch (e) {
      print(e.toString());
    }

    return result;
  }
}
