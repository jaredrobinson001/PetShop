import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/utils/colors.dart';

//BUTTONS-------------------------------------
Widget primaryButtonPurple(
  Widget buttonChild,
  void Function() onPressed,
) {
  return SizedBox(
    width: double.infinity,
    height: 60.0,
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
    height: 60.0,
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
//-------------------------------------------

//PROGRESS INDICATOR-------------------------

Widget progressIndicator(Color color) {
  return Container(
    child: Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        backgroundColor: color,
      ),
    ),
  );
}
//------------------------------------------

//FONTSIZES---------------------------------
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
//-------------------------------------------

//TEXTFIELDS---------------------------------
Widget primaryTextField(
  String initialValue,
  String labelText,
  void Function(String) onsaved,
  String Function(String) validator,
  bool obscureText,
  bool autoValidate,
  bool enableSuggestions,
  TextInputType keyboardType,
  List<TextInputFormatter> inputFormatters,
  Widget suffix,
) {
  return TextFormField(
    initialValue: initialValue,
    onSaved: onsaved,
    validator: validator,
    obscureText: obscureText,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    autovalidate: autoValidate,
    enableSuggestions: enableSuggestions,
    style: normalFont(MColors.textDark, 16.0),
    decoration: InputDecoration(
      suffix: suffix,
      labelText: labelText,
      labelStyle: normalFont(null, 16.0),
      contentPadding: new EdgeInsets.symmetric(horizontal: 25.0),
      fillColor: MColors.primaryWhite,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0.00,
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