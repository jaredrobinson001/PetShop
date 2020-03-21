import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mollet/widgets/provider.dart';

class HomeScreen extends StatefulWidget {
  final homeScreen;
  HomeScreen(this.homeScreen);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Stream<QuerySnapshot> getUsersNameStreamSnapshot(
      BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance
        .collection('userData')
        .document(uid)
        .collection('usersName')
        .snapshots()
        .asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: MColors.primaryWhiteSmoke,
      child: SingleChildScrollView(
        child: Container(
          color: MColors.primaryWhiteSmoke,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Hi ",
                          style: GoogleFonts.montserrat(
                              fontSize: 22.0,
                              color: MColors.primaryPurple,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        child: StreamBuilder(
                            stream: getUsersNameStreamSnapshot(context),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Text(
                                  "Human",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 22.0,
                                      color: MColors.primaryPurple,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                );
                              } else {
                                return Text(
                                  snapshot.data.documents[0]['name'],
                                  style: GoogleFonts.montserrat(
                                      fontSize: 22.0,
                                      color: MColors.primaryPurple,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                  // ),
                                );
                              }
                            }),
                      ),
                      Container(
                        child: Text(
                          ",",
                          style: GoogleFonts.montserrat(
                              fontSize: 22.0,
                              color: MColors.textDark,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 30.0),
                  child: Text(
                    "What would you like to do today?",
                    style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        color: MColors.textDark,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  color: MColors.primaryWhiteSmoke,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            height: 165.0,
                            decoration: BoxDecoration(
                              color: MColors.dashBlue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SvgPicture.asset(
                                    "assets/images/petfood.svg",
                                    //Icons made by "https://www.flaticon.com/authors/photo3idea-studio"
                                    height: 80,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Shop trusted stores for Pet food",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 25.0,
                                        color: MColors.textGrey,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            height: 165.0,
                            decoration: BoxDecoration(
                              color: MColors.dashPurple,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SvgPicture.asset(
                                    "assets/images/veterinarian.svg",
                                    height: 80,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Book a Vet appointment",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 25.0,
                                        color: MColors.textGrey,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            height: 165.0,
                            decoration: BoxDecoration(
                              color: MColors.dashAmber,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SvgPicture.asset(
                                    "assets/images/petsitter.svg",
                                    height: 80,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Hire a professional Petsitter",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 25.0,
                                        color: MColors.textGrey,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: MBottomNavBar(MBottomNavBar),
        ),
      ),
    );
  }
}
