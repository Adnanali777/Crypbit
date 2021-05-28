import 'package:crypto_app/blocs/cryptobloc.dart';
import 'package:crypto_app/models/crytomodel.dart';
import 'package:crypto_app/resources/network_calls.dart';
import 'package:crypto_app/resources/repository.dart';
import 'package:crypto_app/ui/widgets/infotile.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Crypbit'),
      ),
      body: StreamBuilder(
        stream: bloc.allcurrency,
        builder: (context, AsyncSnapshot<List<CryptoModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var price = NumberFormat.currency(
                          decimalDigits: 2, symbol: '\$', locale: 'en_us')
                      .format(double.parse(snapshot.data[index].price));
                  var perchng = snapshot.data[index].oneDayChange * 100;
                  var mcap = NumberFormat.compact()
                      .format(double.parse(snapshot.data[index].marketCap));
                  return InfoTile(
                    name: snapshot.data[index].name,
                    id: snapshot.data[index].id,
                    imageurl: snapshot.data[index].logoUrl,
                    price: price,
                    mcap: mcap,
                    change: perchng,
                  );
                });
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
