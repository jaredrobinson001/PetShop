import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:petShop/model/data/notificationMessage.dart';
import 'package:petShop/model/notifiers/notifications_notifier.dart';
import 'package:petShop/model/services/auth_service.dart';

final db = FirebaseFirestore.instance;

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
  String senderAvatar = "assets/images/footprint.png";
  String senderName = "Pet Shop Team";
  String sentTime = "11 Aug, 2020";
  String notificationTitle = "Order placed";
  String notificationBody =
      "Woof! Your order has been recieved by the Pet Shop, We will process everything for you. Sit back and relax. woof!";
  final uEmail = await AuthService().getCurrentEmail();

  await db
      .collection("userNotifications")
      .doc(uEmail)
      .collection("notMessage")
      .doc()
      .set({
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
        .doc(uEmail)
        .collection("notMessage")
        .get();
    notIDref.docs.forEach((document) {
      var _notId = document.id;
      var _ref = db
          .collection("userNotifications")
          .doc(uEmail)
          .collection("notMessage");

      _ref.doc(_notId).update({
        'notID': _notId,
      });
    });
  });
}

getNotifications(NotificationsNotifier notificationsNotifier) async {
  final uEmail = await AuthService().getCurrentEmail();

  QuerySnapshot notificationsSnapshot = await db
      .collection("userNotifications")
      .doc(uEmail)
      .collection("notMessage")
      .get();

  List<NotificationMessage> _notificationMessageList = [];

  notificationsSnapshot.docs.forEach((document) {
    NotificationMessage notificationMessage =
        NotificationMessage.fromMap(document.data());
    _notificationMessageList.add(notificationMessage);
  });
  notificationsNotifier.notificationMessageList = _notificationMessageList;
}

updateNotificationStatusToTrue(notID) async {
  final uEmail = await AuthService().getCurrentEmail();

  CollectionReference notRef =
      db.collection("userNotifications").doc(uEmail).collection("notMessage");

  await notRef.doc(notID).update({'isRead': "true"});
}
