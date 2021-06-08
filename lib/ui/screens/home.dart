import 'dart:async';

import 'package:crypto_app/blocs/cryptobloc.dart';
import 'package:crypto_app/models/crytomodel.dart';
import 'package:crypto_app/resources/repository.dart';
import 'package:crypto_app/services/notifications.dart';
import 'package:crypto_app/ui/screens/currsearch.dart';
import 'package:crypto_app/ui/widgets/infotile.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

final _controller = PageController(
  initialPage: 0,
);

class Pagecontroller extends StatefulWidget {
  String selectedcurr;
  Pagecontroller({this.selectedcurr});

  @override
  _PagecontrollerState createState() => _PagecontrollerState();
}

class _PagecontrollerState extends State<Pagecontroller> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      children: <Widget>[
        Home(
          selectedcurr: widget.selectedcurr,
        ),
        Search(),
      ],
    );
  }
}

class Home extends StatefulWidget {
  String selectedcurr;
  Home({this.selectedcurr});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<bool> initializeController() {
    Completer<bool> completer = new Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  }

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
                    var price = NumberFormat.currency(
                            decimalDigits: 2, symbol: '\$', locale: 'en_us')
                        .format(double.parse(snapshot.data[index].price));
                    var perchng = snapshot.data[index].oneDayChange * 100;
                    var mcap = NumberFormat.compact()
                        .format(double.parse(snapshot.data[index].marketCap));
                    var finalchng = double.parse((perchng).toStringAsFixed(2));
                    bool reqcurr =
                        widget.selectedcurr == snapshot.data[index].name
                            ? true
                            : false;
                    if (reqcurr) {
                      if (snapshot.data[index].oneDayChange < 0) {
                        NotificationService().initialize('Uhhohh :/',
                            '${snapshot.data[index].name} is not doing great');
                      } else {
                        NotificationService().initialize('Yayy :D',
                            '${snapshot.data[index].name} is doing great');
                      }
                    }
                    return InfoTile(
                      name: snapshot.data[index].name,
                      id: snapshot.data[index].id,
                      imageurl: snapshot.data[index].logoUrl,
                      price: price,
                      mcap: mcap,
                      change: finalchng,
                      curr: widget.selectedcurr,
                      reqcurr: reqcurr,
                    );
                  }, childCount: snapshot.data.length),
                ),
              ],
            );
          } else {
            return Center(
              child: SpinKitSquareCircle(
                color: constants.purcolor,
              ),
            );
          }
        },
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 0.054,
        width: MediaQuery.of(context).size.width * 0.29,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FloatingActionButton.extended(
          backgroundColor: constants.purcolor,
          onPressed: () {
            _controller.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          },
          label: Container(
            child: Row(
              children: [
                Text(
                  "Currency",
                  style: TextStyle(fontSize: 12, letterSpacing: 1.1),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.search,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
