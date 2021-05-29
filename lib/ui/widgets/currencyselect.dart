import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Currselect extends StatefulWidget {
  @override
  _CurrselectState createState() => _CurrselectState();
}

class _CurrselectState extends State<Currselect> {
  List<String> _curr = ['Bitcoin', 'Ethereum', 'Ripple'];
  String _selectedcurr = 'Bitcoin';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.082,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: DropdownButtonFormField(
            style: GoogleFonts.quicksand(color: Colors.black, fontSize: 18),
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
        ));
    ;
  }
}
