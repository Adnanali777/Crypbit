import 'package:crypto_app/models/crytomodel.dart';
import 'package:crypto_app/resources/network_calls.dart';

class Repository {
  CurrencyApiProvider _currencyApiProvider = CurrencyApiProvider();

  Future<List<CryptoModel>> fetchallcurrencies() =>
      _currencyApiProvider.getCurrencies();
}
