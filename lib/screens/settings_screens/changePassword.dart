import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/utils/textFieldFormaters.dart';
import 'package:mollet/utils/colors.dart';
import 'package:mollet/widgets/allWidgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String password;
  bool _autoValidate = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryWhiteSmoke,
      appBar: primaryAppBar(
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: MColors.textGrey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          "Change password",
          style: boldFont(MColors.primaryPurple, 18.0),
        ),
        MColors.primaryWhiteSmoke,
        null,
        true,
        <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              "Save",
              style: boldFont(MColors.primaryPurple, 16.0),
            ),
          )
        ],
      ),
      body: primaryContainer(
        SingleChildScrollView(
          child: Form(
            child: Container(
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Current Password",
                          style:
                              GoogleFonts.montserrat(color: MColors.textGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          autovalidate: _autoValidate,
                          validator: PasswordValiditor.validate,
                          onSaved: (val) => password = val,
                          decoration: InputDecoration(
                            suffix: SizedBox(
                              height: 20.0,
                              width: 35.0,
                              child: RawMaterialButton(
                                onPressed: _toggle,
                                child: new Text(
                                  _obscureText ? "Show" : "Hide",
                                  style: TextStyle(
                                    color: MColors.primaryPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            labelText: "",
                            contentPadding:
                                new EdgeInsets.symmetric(horizontal: 25.0),
                            fillColor: MColors.primaryWhite,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: MColors.textGrey,
                                width: 0.50,
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
                          obscureText: _obscureText,
                          style: GoogleFonts.montserrat(
                              fontSize: 17.0, color: MColors.textDark),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "New Password",
                          style:
                              GoogleFonts.montserrat(color: MColors.textGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          autovalidate: _autoValidate,
                          validator: PasswordValiditor.validate,
                          onSaved: (val) => password = val,
                          decoration: InputDecoration(
                            suffix: SizedBox(
                              height: 20.0,
                              width: 35.0,
                              child: RawMaterialButton(
                                onPressed: _toggle,
                                child: new Text(
                                  _obscureText ? "Show" : "Hide",
                                  style: TextStyle(
                                    color: MColors.primaryPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            labelText: "",
                            contentPadding:
                                new EdgeInsets.symmetric(horizontal: 25.0),
                            fillColor: MColors.primaryWhite,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: MColors.textGrey,
                                width: 0.50,
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
                          obscureText: _obscureText,
                          style: GoogleFonts.montserrat(
                              fontSize: 17.0, color: MColors.textDark),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Confirm Password",
                          style:
                              GoogleFonts.montserrat(color: MColors.textGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          autovalidate: _autoValidate,
                          validator: PasswordValiditor.validate,
                          onSaved: (val) => password = val,
                          decoration: InputDecoration(
                            suffix: SizedBox(
                              height: 20.0,
                              width: 35.0,
                              child: RawMaterialButton(
                                onPressed: _toggle,
                                child: new Text(
                                  _obscureText ? "Show" : "Hide",
                                  style: TextStyle(
                                    color: MColors.primaryPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            labelText: "",
                            contentPadding:
                                new EdgeInsets.symmetric(horizontal: 25.0),
                            fillColor: MColors.primaryWhite,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: MColors.textGrey,
                                width: 0.50,
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
                          obscureText: _obscureText,
                          style: GoogleFonts.montserrat(
                              fontSize: 17.0, color: MColors.textDark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
