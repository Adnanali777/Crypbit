import 'package:crypto_app/ui/screens/home.dart';
import 'package:crypto_app/ui/widgets/currencyselect.dart';
import 'package:crypto_app/utils/currencies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandScreen extends StatefulWidget {
  @override
  _LandScreenState createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  List<String> _curr = Currencies().curr;
  String _selectedcurr = 'Bitcoin';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.17,
          ),
          Container(
            height: size.height * 0.3,
            width: size.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/appbar.png'), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Welcome to ',
              style: GoogleFonts.quicksand(
                  color: Colors.black, fontSize: 19, letterSpacing: 1.2),
            ),
            TextSpan(
              text: 'Crypbit',
              style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 19,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold),
            ),
          ])),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'We are here to keep you updated with all the latest trends in cryptomarket',
              style: GoogleFonts.quicksand(
                  color: Colors.black, fontSize: 18, letterSpacing: 1.2),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please select a currency of your choice',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontSize: 17, letterSpacing: 1),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              height: size.height * 0.082,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: DropdownButtonFormField(
                  style:
                      GoogleFonts.quicksand(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                  value: _selectedcurr,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedcurr = newValue;
                    });
                  },
                  items: _curr.map((gender) {
                    return DropdownMenuItem(
                      child: new Text(gender),
                      value: gender,
                    );
                  }).toList(),
                ),
              )),
          SizedBox(
            height: 15,
          ),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Home(
                          selectedcurr: _selectedcurr,
                        )));
              },
              color: Color(0xff8760FB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Go',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              )),
        ],
      ),
    );
  }
}
