import 'package:flutter/material.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoTile extends StatefulWidget {
  String imageurl;
  String name;
  String id;
  String price;
  String mcap;
  double change;
  String curr;
  bool reqcurr;
  InfoTile(
      {this.curr,
      this.change,
      this.id,
      this.imageurl,
      this.mcap,
      this.name,
      this.reqcurr,
      this.price});

  @override
  _InfoTileState createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isSvg = widget.imageurl.endsWith('.svg');
    return Container(
      height: size.height * 0.3,
      width: size.width * 1,
      margin: EdgeInsets.symmetric(
          vertical: size.height * 0.03, horizontal: size.width * 0.02),
      padding: EdgeInsets.fromLTRB(size.width * 0.045, size.height * 0.025,
          size.width * 0.040, size.height * 0.025),
      decoration: BoxDecoration(
        color: widget.reqcurr ? constants.darkshade : Colors.white,
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
                backgroundColor: Colors.transparent,
                radius: 15,
                child: isSvg
                    ? SvgPicture.network(
                        '${widget.imageurl}',
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        '${widget.imageurl}',
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('${widget.name}',
                  style: widget.reqcurr
                      ? constants.darknametextStyle
                      : constants.nametextStyle),
              Spacer(),
              Text(
                '${widget.id}',
                style: widget.reqcurr
                    ? constants.darkidtextstyle
                    : constants.idtextstyle,
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Text('${widget.price}',
              style: widget.reqcurr
                  ? constants.darkpricetextstyle
                  : constants.pricetextstyle),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Market Cap:',
                style: widget.reqcurr
                    ? GoogleFonts.quicksand(fontSize: 15, color: Colors.white)
                    : GoogleFonts.quicksand(fontSize: 15),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                '${widget.mcap}',
                style: widget.reqcurr
                    ? constants.darkmcaptextstyle
                    : constants.mcaptextstyle,
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
              width: size.width * 0.25,
              decoration: BoxDecoration(
                color: widget.change > 0 ? Colors.green[400] : Colors.red[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: widget.change > 0
                    ? Text(
                        '+' '${widget.change}' + '%',
                        style: widget.reqcurr
                            ? constants.darkpercentstyle
                            : constants.percentstyle,
                      )
                    : Text(
                        '${widget.change}' + '%',
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
