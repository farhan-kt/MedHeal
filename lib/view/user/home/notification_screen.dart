import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/controller/notification_provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final notificationProvider = Provider.of<NotificationProvider>(context);
    notificationProvider.getAllNotification();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 238, 240, 242),
        title: poppinsText(
            text: 'Notification',
            color: const Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final notifications = provider.allNotification
              .where((notification) => notification.recieverId == user!.uid)
              .toList();

          if (notifications.isEmpty) {
            return Center(
                child: poppinsHeadText(
              text: 'No Notification Found',
              fontSize: 20,
              color: const Color(0xFF1995AD),
            ));
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              final isRead = notification.read ?? false;
              final textColor = isRead ? Colors.grey[500] : Colors.black;

              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: ListTile(
                        title: poppinsText(
                            text: notification.title ?? '',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: textColor),
                        subtitle: poppinsText(
                            text: notification.body ?? '', color: textColor),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  notificationProvider
                                      .updateNotificationReadStatus(
                                          notification.id!, true);
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: textColor,
                                )),
                            IconButton(
                                onPressed: () {
                                  notificationProvider
                                      .deleteNotification(notification.id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        )),
                  ),
                  const Row(
                    children: [
                      Divider(),
                    ],
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
