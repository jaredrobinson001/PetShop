import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/utils/colors.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

//SCAFFOLDS-----------------------------------
Widget primaryContainer(
  Widget containerChild,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    color: MColors.primaryWhiteSmoke,
    child: containerChild,
  );
}
//--------------------------------------------

//APPBARS-------------------------------------

Widget primaryAppBar(
  Widget leading,
  Widget title,
  Color backgroundColor,
  PreferredSizeWidget bottom,
  bool centerTile,
  List<Widget> actions,
) {
  return AppBar(
    brightness: Brightness.light,
    elevation: 0.0,
    backgroundColor: backgroundColor,
    leading: leading,
    title: title,
    bottom: bottom,
    centerTitle: centerTile,
    actions: actions,
  );
}

Widget primarySliverAppBar(
  Widget leading,
  Widget title,
  Color backgroundColor,
  PreferredSizeWidget bottom,
  bool centerTile,
  bool floating,
  bool pinned,
  List<Widget> actions,
  double expandedHeight,
  Widget flexibleSpace,
) {
  return SliverAppBar(
    brightness: Brightness.light,
    elevation: 0.0,
    backgroundColor: backgroundColor,
    leading: leading,
    title: title,
    bottom: bottom,
    centerTitle: centerTile,
    floating: floating,
    pinned: pinned,
    actions: actions,
    expandedHeight: expandedHeight,
    flexibleSpace: flexibleSpace,
  );
}
//--------------------------------------------

//FONTS---------------------------------------
TextStyle boldFont(Color color, double size) {
  return GoogleFonts.montserrat(
    color: color,
    fontSize: size,
    fontWeight: FontWeight.w600,
  );
}

TextStyle normalFont(Color color, double size) {
  return GoogleFonts.montserrat(
    color: color,
    fontSize: size,
  );
}
//--------------------------------------------

//BUTTONS-------------------------------------
Widget primaryButtonPurple(
  Widget buttonChild,
  void Function() onPressed,
) {
  return SizedBox(
    width: double.infinity,
    height: 50.0,
    child: RawMaterialButton(
      elevation: 0.0,
      hoverElevation: 0.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
      fillColor: MColors.primaryPurple,
      child: buttonChild,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget primaryButtonWhiteSmoke(
  Widget buttonChild,
  void Function() onPressed,
) {
  return SizedBox(
    width: double.infinity,
    height: 50.0,
    child: RawMaterialButton(
      elevation: 0.0,
      hoverElevation: 0.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
      fillColor: MColors.primaryWhiteSmoke,
      child: buttonChild,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget listTileButton(
  void Function() onPressed,
  String iconImage,
  String listTileName,
  Color color,
) {
  return SizedBox(
    height: 60.0,
    width: double.infinity,
    child: RawMaterialButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            iconImage,
            height: 20,
            color: MColors.textGrey,
          ),
          SizedBox(width: 15.0),
          Expanded(
            child: Text(
              listTileName,
              style: normalFont(color, 14.0),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: MColors.textGrey,
            size: 16.0,
          ),
        ],
      ),
    ),
  );
}
//-------------------------------------------

//TEXTFIELDS--------------------------------

Widget primaryTextField(
  TextEditingController controller,
  String initialValue,
  String labelText,
  void Function(String) onsaved,
  bool enabled,
  String Function(String) validator,
  bool obscureText,
  bool autoValidate,
  bool enableSuggestions,
  TextInputType keyboardType,
  List<TextInputFormatter> inputFormatters,
  Widget suffix,
  double textfieldBorder,
) {
  return TextFormField(
    controller: controller,
    initialValue: initialValue,
    onSaved: onsaved,
    enabled: enabled,
    validator: validator,
    obscureText: obscureText,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    autovalidate: autoValidate,
    enableSuggestions: enableSuggestions,
    style: normalFont(
      enabled == true ? MColors.textDark : MColors.textGrey,
      16.0,
    ),
    cursorColor: MColors.primaryPurple,
    decoration: InputDecoration(
      suffixIcon: Padding(
        padding: EdgeInsets.only(
          right: suffix == null ? 0.0 : 15.0,
          left: suffix == null ? 0.0 : 15.0,
        ),
        child: suffix,
      ),
      labelText: labelText,
      labelStyle: normalFont(null, 14.0),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
      fillColor: MColors.primaryWhite,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: textfieldBorder == 0.0 ? Colors.transparent : MColors.textGrey,
          width: textfieldBorder,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: MColors.primaryPurple,
          width: 1.0,
        ),
      ),
    ),
  );
}

Widget searchTextField(
  TextEditingController controller,
  String initialValue,
  String labelText,
  void Function(String) onsaved,
  void Function(String) onChanged,
  bool enabled,
  String Function(String) validator,
  bool obscureText,
  bool autoValidate,
  bool enableSuggestions,
  TextInputType keyboardType,
  List<TextInputFormatter> inputFormatters,
  Widget suffix,
  double textfieldBorder,
) {
  return TextFormField(
    controller: controller,
    initialValue: initialValue,
    onSaved: onsaved,
    onChanged: onChanged,
    enabled: enabled,
    validator: validator,
    obscureText: obscureText,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    autovalidate: autoValidate,
    enableSuggestions: enableSuggestions,
    style: normalFont(
      enabled == true ? MColors.textDark : MColors.textGrey,
      16.0,
    ),
    cursorColor: MColors.primaryPurple,
    decoration: InputDecoration(
      suffixIcon: Padding(
        padding: EdgeInsets.only(
          right: suffix == null ? 0.0 : 15.0,
          left: suffix == null ? 0.0 : 15.0,
        ),
        child: suffix,
      ),
      labelText: labelText,
      labelStyle: normalFont(null, 14.0),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
      fillColor: MColors.primaryWhite,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: textfieldBorder == 0.0 ? Colors.transparent : MColors.textGrey,
          width: textfieldBorder,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: MColors.primaryPurple,
          width: 1.0,
        ),
      ),
    ),
  );
}
//-------------------------------------------

//PROGRESS----------------------------------
Widget progressIndicator(Color color) {
  return Container(
    color: MColors.primaryWhiteSmoke,
    child: Center(
      child: CupertinoActivityIndicator(
        radius: 12.0,
      ),
    ),
  );
}
//-------------------------------------------

//SNACKBARS----------------------------------
void showSimpleSnack(
  String value,
  IconData icon,
  Color iconColor,
  GlobalKey<ScaffoldState> _scaffoldKey,
) {
  _scaffoldKey.currentState.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 1000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              value,
              style: normalFont(null, null),
            ),
          ),
          Icon(
            icon,
            color: iconColor,
          )
        ],
      ),
    ),
  );
}
//-------------------------------------------

//EMPTYCART----------------------------------
Widget emptyScreen(
  String image,
  String title,
  String subTitle,
) {
  return primaryContainer(
    Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                image,
                height: 150,
              ),
            ),
            Container(
              child: Text(
                title,
                style: boldFont(MColors.textDark, 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: Text(
                subTitle,
                style: normalFont(MColors.textGrey, 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// ------------------------------------------

//CART DISMISS-------------------------------
Widget backgroundDismiss(AlignmentGeometry alignment) {
  return Container(
    decoration: BoxDecoration(
      color: MColors.primaryWhiteSmoke,
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    alignment: alignment,
    child: Container(
      height: double.infinity,
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Icon(
        Icons.delete_outline,
        color: Colors.white,
      ),
    ),
  );
}
//-------------------------------------------

//WARNING------------------------------------
Widget warningWidget() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.error_outline,
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                "PLEASE NOTE -  This is a side project by Nifemi. Please do not enter real info. Thank you!",
                style: normalFont(Colors.redAccent, 14.0),
              ),
            ),
          ),
        ],
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.redAccent),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    ),
  );
}
//-------------------------------------------

//SHARE WIDGET-------------------------------
Future shareWidget() {
  return WcFlutterShare.share(
      sharePopupTitle: 'Pet Shop',
      subject: 'Hi!',
      text:
          'Hi, I use Pet Shop to care for my pets fast and easy, Download it here at https://github.com/thenifemi/PetShop and for every download, a dog gets a treat.',
      mimeType: 'text/plain');
}
//-------------------------------------------

//MODAL BAR WIDGET-------------------------------
modalBarWidget() {
  return Container(
    height: 6.0,
    child: Center(
      child: Container(
        width: 50.0,
        height: 6.0,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    ),
  );
}
//-------------------------------------------

//ORDER TRACKER WIDGET-------------------------------
orderTrackerWidget(String status) {
  bool processing = false,
      confirmed = false,
      enRoute = false,
      delivered = false;
  // canceled = false;

  if (status == "processing") {
    processing = true;
  } else if (status == "confirmed") {
    processing = true;
    confirmed = true;
  } else if (status == "enRoute") {
    processing = true;
    confirmed = true;
    enRoute = true;
  } else if (status == "delivered") {
    processing = true;
    confirmed = true;
    enRoute = true;
    delivered = true;
  } else {
    processing = true;
  }
  // } else if (status == "canceled") {
  //   processing = true;
  //   // canceled = true;
  // }
  Widget checkMark() {
    return Icon(
      Icons.check,
      color: MColors.primaryWhite,
      size: 12.0,
    );
  }

  Widget smallDonut() {
    return Container(
      width: 5.0,
      height: 5.0,
      decoration: BoxDecoration(
        color: MColors.primaryWhiteSmoke,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }

  Widget bar(Color color) {
    return Container(
      width: 70.0,
      height: 3.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }

  Widget checkPoint(Color color, Widget center) {
    return Container(
      width: 16.0,
      height: 16.0,
      decoration: BoxDecoration(
        color: processing ? Colors.green : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child:
          Center(child: processing && confirmed ? checkMark() : smallDonut()),
    );
  }

  return Container(
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Processing",
              style: normalFont(
                  processing ? Colors.green : Colors.grey[400], 12.0),
            ),
            SizedBox(width: 40.0),
            Text(
              "confirmed",
              style:
                  normalFont(confirmed ? Colors.green : Colors.grey[400], 12.0),
            ),
            SizedBox(width: 40.0),
            Text(
              "En Route",
              style:
                  normalFont(enRoute ? Colors.green : Colors.grey[400], 12.0),
            ),
            SizedBox(width: 40.0),
            Text(
              "Delivered",
              style:
                  normalFont(delivered ? Colors.green : Colors.grey[400], 12.0),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //PROCESSING
            checkPoint(
              processing ? Colors.green : Colors.grey[400],
              Center(
                  child: processing && confirmed ? checkMark() : smallDonut()),
            ),
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: processing ? Colors.green : Colors.grey[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Center(
                  child: processing && confirmed ? checkMark() : smallDonut()),
            ),
            SizedBox(width: 5.0),
            //bar
            bar(confirmed ? Colors.green : Colors.grey[400]),

            SizedBox(width: 5.0),
            //CONFIRMED
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: confirmed ? Colors.green : Colors.grey[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Center(
                  child: confirmed && enRoute ? checkMark() : smallDonut()),
            ),
            SizedBox(width: 5.0),
            //bar
            bar(enRoute ? Colors.green : Colors.grey[400]),
            SizedBox(width: 5.0),
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: enRoute ? Colors.green : Colors.grey[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Center(
                  child: enRoute && delivered ? checkMark() : smallDonut()),
            ),
            SizedBox(width: 5.0),
            bar(delivered ? Colors.green : Colors.grey[400]),
            SizedBox(width: 5.0),
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: delivered ? Colors.green : Colors.grey[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Center(child: delivered ? checkMark() : smallDonut()),
            ),
          ],
        ),
      ],
    ),
  );
}
//-------------------------------------------
