import 'package:flutter/material.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTile extends StatefulWidget {
  String imageurl;
  String name;
  String id;
  String price;
  String mcap;
  double change;
  InfoTile(
      {this.change, this.id, this.imageurl, this.mcap, this.name, this.price});

  @override
  _InfoTileState createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  @override
  Widget build(BuildContext context) {
    var finalchng = double.parse((widget.change).toStringAsFixed(2));
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 1,
      margin: EdgeInsets.symmetric(
          vertical: size.height * 0.03, horizontal: size.width * 0.02),
      padding: EdgeInsets.fromLTRB(size.width * 0.045, size.height * 0.025,
          size.width * 0.001, size.height * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 19,
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text('${widget.name}', style: constants.nametextStyle),
              ),
              SizedBox(
                width: size.width * 0.5,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  '${widget.id}',
                  style: constants.idtextstyle,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Text('${widget.price}', style: constants.pricetextstyle),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Market Cap:',
                style: GoogleFonts.quicksand(fontSize: 15),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                '${widget.mcap}',
                style: constants.mcaptextstyle,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: size.height * 0.03,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                color: widget.change > 0 ? Colors.green[400] : Colors.red[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '$finalchng' + '%',
                  style: constants.percentstyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
