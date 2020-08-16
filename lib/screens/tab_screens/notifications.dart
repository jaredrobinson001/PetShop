import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mollet/model/notifiers/notifications_notifier.dart';

import 'package:mollet/model/services/pushNotification_service.dart';
import 'package:mollet/screens/tab_screens/homeScreen_pages/notificationDetails.dart';
import 'package:mollet/utils/colors.dart';
import 'package:mollet/widgets/allWidgets.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatefulWidget {
  InboxScreen({Key key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  Future notificationsFuture;

  @override
  void initState() {
    NotificationsNotifier notificationsNotifier =
        Provider.of<NotificationsNotifier>(context, listen: false);
    notificationsFuture = getNotifications(notificationsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotificationsNotifier notificationsNotifier =
        Provider.of<NotificationsNotifier>(context, listen: false);
    var nots = notificationsNotifier.notificationMessageList;

    return primaryContainer(
      FutureBuilder(
        future: notificationsFuture,
        builder: (c, s) {
          switch (s.connectionState) {
            case ConnectionState.active:
              return progressIndicator(MColors.primaryPurple);
              break;
            case ConnectionState.done:
              return nots.isEmpty
                  ? emptyScreen(
                      "assets/images/noHistory.svg",
                      "No Orders",
                      "Your past orders, transactions and hires will show up here.",
                    )
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
            var navigationResult = await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => NotificationsDetails(not),
              ),
            );
            if (navigationResult == true) {
              updateNotificationStatusToTrue(not.notID);

              NotificationsNotifier notificationsNotifier =
                  Provider.of<NotificationsNotifier>(context, listen: false);
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
