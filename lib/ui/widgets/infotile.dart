import 'package:flutter/material.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.3,
        width: size.width * 1,
        margin: EdgeInsets.symmetric(
            vertical: size.height * 0.2, horizontal: size.width * 0.03),
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.025, horizontal: size.width * 0.045),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 19,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Bitcoin', style: constants.nametextStyle),
                SizedBox(
                  width: size.width * 0.5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'BTC',
                    style: constants.idtextstyle,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text('\$32,377.03', style: constants.pricetextstyle),
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
                  '1.2M',
                  style: constants.mcaptextstyle,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.03,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '-2.34%',
                  style: constants.percentstyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
