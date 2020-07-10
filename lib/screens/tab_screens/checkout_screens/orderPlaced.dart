import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mollet/main.dart';
import 'package:mollet/utils/colors.dart';
import 'package:mollet/widgets/allWidgets.dart';
import 'package:mollet/widgets/tabsLayout.dart';

class OrderPlaced extends StatefulWidget {
  OrderPlaced({Key key}) : super(key: key);

  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryWhiteSmoke,
      appBar: primaryAppBar(
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: MColors.primaryWhiteSmoke,
          ),
          onPressed: () {},
        ),
        null,
        MColors.primaryWhiteSmoke,
        null,
        false,
        null,
      ),
      body: primaryContainer(
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Thank you!",
                    style: boldFont(MColors.textDark, 20.0),
                  ),
                  SizedBox(width: 5.0),
                  Container(
                    child: Icon(Icons.check_circle_outline,
                        color: Colors.green, size: 20.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Center(
                child: Text(
                  "Your order has been successfully placed",
                  style: normalFont(MColors.textGrey, 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                "assets/images/orderPlaced.svg",
                height: 150,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "An order confirmation and purchase reciept will be sent to your email.",
                style: normalFont(MColors.textGrey, 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Your purchased items will be delivered to",
                    style: normalFont(MColors.textGrey, 16),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Apt 1902, Bela Monte Condo, Rua João Pedro, Centro",
                    style: boldFont(MColors.textGrey, 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            primaryButtonPurple(
              Text("Great!", style: boldFont(MColors.primaryWhite, 16.0)),
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MyApp(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
