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
  String selectedcurr;
  Home({this.selectedcurr});
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
    Size size = MediaQuery.of(context).size;
    bloc.fetchAllMovies();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder(
        stream: bloc.allcurrency,
        builder: (context, AsyncSnapshot<List<CryptoModel>> snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: size.width * 0.3,
                  backgroundColor: Colors.grey[200],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'CRYPBIT',
                      style: constants.appbarstyle,
                    ),
                    centerTitle: true,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    print(widget.selectedcurr);
                    var price = NumberFormat.currency(
                            decimalDigits: 2, symbol: '\$', locale: 'en_us')
                        .format(double.parse(snapshot.data[index].price));
                    var perchng = snapshot.data[index].oneDayChange * 100;
                    var mcap = NumberFormat.compact()
                        .format(double.parse(snapshot.data[index].marketCap));
                    var finalchng = double.parse((perchng).toStringAsFixed(2));
                    return InfoTile(
                      name: snapshot.data[index].name,
                      id: snapshot.data[index].id,
                      imageurl: snapshot.data[index].logoUrl,
                      price: price,
                      mcap: mcap,
                      change: finalchng,
                      curr: widget.selectedcurr,
                    );
                  }, childCount: snapshot.data.length),
                ),
              ],
            );
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
