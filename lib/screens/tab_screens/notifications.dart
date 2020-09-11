import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petShop/model/notifiers/notifications_notifier.dart';

import 'package:petShop/model/services/pushNotification_service.dart';
import 'package:petShop/screens/tab_screens/homeScreen_pages/notificationDetails.dart';
import 'package:petShop/utils/colors.dart';
import 'package:petShop/utils/internetConnectivity.dart';
import 'package:petShop/widgets/allWidgets.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatefulWidget {
  InboxScreen({Key key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future notificationsFuture;

  @override
  void initState() {
    checkInternetConnectivity().then((value) => {
          value == true
              ? () {
                  NotificationsNotifier notificationsNotifier =
                      Provider.of<NotificationsNotifier>(context,
                          listen: false);
                  notificationsFuture = getNotifications(notificationsNotifier);
                }()
              : showNoInternetSnack(_scaffoldKey)
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotificationsNotifier notificationsNotifier =
        Provider.of<NotificationsNotifier>(context);
    var nots = notificationsNotifier.notificationMessageList;

    return Scaffold(
      backgroundColor: MColors.primaryWhiteSmoke,
      body: RefreshIndicator(
        onRefresh: () => getNotifications(notificationsNotifier),
        child: primaryContainer(
          FutureBuilder(
            future: notificationsFuture,
            builder: (c, s) {
              switch (s.connectionState) {
                case ConnectionState.active:
                  return progressIndicator(MColors.primaryPurple);
                  break;
                case ConnectionState.done:
                  return nots.isEmpty
                      ? noNotifications()
                      : notificationsScreen(nots);
                  break;
                case ConnectionState.waiting:
                  return progressIndicator(MColors.primaryPurple);
                  break;
                default:
                  return progressIndicator(MColors.primaryPurple);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget notificationsScreen(nots) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: nots.length,
      itemBuilder: (context, i) {
        var not = nots[i];

        return GestureDetector(
          onTap: () async {
            NotificationsNotifier notificationsNotifier =
                Provider.of<NotificationsNotifier>(context, listen: false);
            var navigationResult = await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => NotificationsDetails(not),
              ),
            );
            if (navigationResult == true) {
              updateNotificationStatusToTrue(not.notID);

              setState(() {
                getNotifications(notificationsNotifier);
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: not.isRead == "true"
                  ? MColors.primaryWhite
                  : MColors.primaryPlatinum,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      height: 35,
                      child: Image.asset(
                        not.senderAvatar,
                        height: 30,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MColors.primaryWhite,
                        border: Border.all(
                          color: MColors.primaryPurple,
                          width: 0.50,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      not.senderName,
                      style: normalFont(MColors.textDark, 14.0),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          not.sentTime,
                          style: normalFont(MColors.textGrey, 12.0),
                        ),
                        SizedBox(width: 5.0),
                        not.isRead == "true"
                            ? Container()
                            : Container(
                                height: 8.0,
                                width: 8.0,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: MColors.primaryPurple,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Text(
                  not.notificationTitle,
                  style: boldFont(MColors.textDark, 14.0),
                ),
                SizedBox(height: 5.0),
                Text(
                  not.notificationBody,
                  style: normalFont(MColors.textDark, 13.0),
                ),
                SizedBox(height: 15.0),
                Text(
                  "$i days ago",
                  style: normalFont(MColors.primaryPurple, 12.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget noNotifications() {
    return emptyScreen(
      "assets/images/noInbox.svg",
      "No Notifications",
      "Messages, promotions and general information from stores, pet news and the Pet Shop team will show up here.",
    );
  }
}
