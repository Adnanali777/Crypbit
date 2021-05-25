import 'package:crypto_app/resources/network_calls.dart';
import 'package:crypto_app/resources/repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository _repository = Repository();
  @override
  void initState() {
    _repository.fetchallcurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
