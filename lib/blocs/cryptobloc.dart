import 'package:crypto_app/models/crytomodel.dart';
import 'package:crypto_app/resources/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class CryptoBlock {
  final _repository = Repository();
  final _currencyfetcher = PublishSubject<List<CryptoModel>>();

  Stream<List<CryptoModel>> get allcurrency => _currencyfetcher.stream;

  fetchAllMovies() async {
    List<CryptoModel> cryptomodel = await _repository.fetchallcurrencies();
    _currencyfetcher.sink.add(cryptomodel);
  }

  dispose() {
    _currencyfetcher.close();
  }
}

final bloc = CryptoBlock();
