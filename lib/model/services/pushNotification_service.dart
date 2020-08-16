import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mollet/model/services/auth_service.dart';

Future initialise() async {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Platform.isIOS
      ? _fcm.requestNotificationPermissions(IosNotificationSettings())
      : _fcm.configure(
          onMessage: (Map<String, dynamic> message) async {
            print("onMessage $message");
          },
          onResume: (Map<String, dynamic> message) async {
            print("onResume $message");
          },
          onLaunch: (Map<String, dynamic> message) async {
            print("onLaunch-= $message");
          },
        );
}

mockNotifications() async {
  final db = Firestore.instance;

  String senderAvatar = "assets/images/footprint.png";
  String senderName = "Pet Shop Team";
  String sentTime = "11 Aug, 2020";
  String notificationTitle = "Order placed";
  String notificationBody =
      "Woof! Your order has been recieved by the Pet Shop, We will process everything for you. Sit back and relax. woof!";
  final uEmail = await AuthService().getCurrentEmail();

  await db
      .collection("userNotifications")
      .document(uEmail)
      .collection("notMessage")
      .document()
      .setData({
    'senderAvatar': senderAvatar,
    'senderName': senderName,
    'sentTime': sentTime,
    'notificationTitle': notificationTitle,
    'notificationBody': notificationBody,
    'notID': "",
    'isRead': "false"
  }).then((value) async {
    var notIDref = await db
        .collection("userNotifications")
        .document(uEmail)
        .collection("notMessage")
        .getDocuments();
    notIDref.documents.forEach((document) {
      var _notId = document.documentID;
      var _ref = db
          .collection("userNotifications")
          .document(uEmail)
          .collection("notMessage");

      _ref.document(_notId).updateData({
        'notID': _notId,
      });
    });
  });
}
