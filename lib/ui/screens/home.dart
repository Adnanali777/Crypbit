import 'package:crypto_app/blocs/cryptobloc.dart';
import 'package:crypto_app/models/crytomodel.dart';
import 'package:crypto_app/resources/network_calls.dart';
import 'package:crypto_app/resources/repository.dart';
import 'package:crypto_app/ui/widgets/infotile.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository _repository = Repository();
  @override
  void initState() {
    bloc.fetchAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Crypbit'),
      ),
      body: StreamBuilder(
        stream: bloc.allcurrency,
        builder: (context, AsyncSnapshot<List<CryptoModel>> snapshot) {
          if (snapshot.hasData) {
            return InfoTile();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
