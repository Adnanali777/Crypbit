import 'package:crypto_app/models/crytomodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class CurrencyApiProvider {
  static final _key = '83349f157ea7e1cbe94d36f6165427a21c0837ab';

  static Future<List<CryptoModel>> getCurrencies() async {
    final url =
        'https://api.nomics.com/v1/currencies/ticker?key=$_key&interval=1d,30d&convert=EUR&per-page=100&page=1';

    var response = await http.get(Uri.parse(url));
    final body = json.decode(response.body) as List;
    List<CryptoModel> result =
        body.map((item) => CryptoModel.fromJson(item)).toList();
    result.forEach((element) {
      print(element.name);
    });
    return result;
  }
}
