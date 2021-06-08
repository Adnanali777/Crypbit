import 'package:crypto_app/models/crytomodel.dart';
import 'package:crypto_app/resources/repository.dart';
import 'package:crypto_app/ui/widgets/infotile.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<CryptoModel> _filtered = [];
  List<CryptoModel> allcurr = [];

  bool isLoading = false;

  @override
  void initState() {
    getalldata();

    super.initState();
  }

  Future getalldata() async {
    setState(() => isLoading = true);
    Repository().fetchallcurrencies().then((data) {
      setState(() {
        allcurr = data;
        isLoading = false;
      });
    });
  }

  void _searchcountries(String value) {
    setState(() {
      _filtered = allcurr.where((e) => e.name.toLowerCase() == value).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Center(
            child: SpinKitSquareCircle(
              color: Color(0xff8760FB),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.062,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.grey[400],
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Icon(Icons.search),
                                ),
                                hintText: "Search for another currency",
                                hintStyle: TextStyle(
                                    fontSize: 17, color: Colors.grey[500]),
                                border: InputBorder.none),
                            onChanged: (value) {
                              _searchcountries(value);
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _filtered = [];
                              });
                            },
                            icon: Icon(Icons.cancel)),
                      ],
                    ),
                  ),
                  _filtered.isNotEmpty
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _filtered.length,
                          itemBuilder: (context, index) {
                            var price = NumberFormat.currency(
                                    decimalDigits: 2,
                                    symbol: '\$',
                                    locale: 'en_us')
                                .format(double.parse(_filtered[index].price));
                            var perchng = _filtered[index].oneDayChange * 100;
                            var mcap = NumberFormat.compact().format(
                                double.parse(_filtered[index].marketCap));
                            var finalchng =
                                double.parse((perchng).toStringAsFixed(2));
                            return InfoTile(
                              name: _filtered[index].name,
                              id: _filtered[index].id,
                              imageurl: _filtered[index].logoUrl,
                              price: price,
                              mcap: mcap,
                              change: finalchng,
                              reqcurr: true,
                            );
                          })
                      : SizedBox(
                          width: 10,
                        ),
                ],
              ),
            ));
  }
}
