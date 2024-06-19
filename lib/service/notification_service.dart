import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medheal/model/notification_model.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/service/appointment_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String notifications = 'notification';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late CollectionReference<NotificationModel> notification;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('medheal');

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
      payload: payload,
    );
  }

  Future<void> checkAndNotifyUpcomingAppointments(context) async {
    final appointmentService = AppointmentService();
    final now = DateTime.now();
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final upcomingAppointments =
        await appointmentService.getUserAppointments(userId);

    for (var appointment in upcomingAppointments) {
      if (appointment.status == 'canceled') {
        continue;
      }

      List<String> dateParts = appointment.date!.split('/');
      int day = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int year = int.parse(dateParts[2]);

      List<String> timeParts = appointment.time!.split(RegExp(r'[:\s]'));
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);
      String period = timeParts[2].toUpperCase();

      if (period == 'PM' && hour != 12) {
        hour += 12;
      } else if (period == 'AM' && hour == 12) {
        hour = 0;
      }

      DateTime appointmentDateTime = DateTime(year, month, day, hour, minute);
      Duration difference = appointmentDateTime.difference(now);

      if (difference.inHours < 1 && difference.inMinutes > 0) {
        try {
          int notificationId = appointment.id.hashCode;
          final docName =
              await Provider.of<DoctorProvider>(context, listen: false)
                  .getDoctorById(appointment.docId!);

          await showNotification(
            id: notificationId,
            title: 'Upcoming Appointment',
            body:
                'You have an appointment with Dr. ${docName?.fullName} at ${appointment.time}',
          );
        } catch (e) {
          log('Error showing notification for appointment id ${appointment.id}: $e');
        }
      }
    }
  }

  NotificationService() {
    notification = firebaseFirestore
        .collection(notifications)
        .withConverter<NotificationModel>(fromFirestore: (snapshot, options) {
      return NotificationModel.fromJson(snapshot.id, snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }

  Future<void> notifyAllUsers({
    required String doctorName,
    required String category,
  }) async {
    final usersSnapshot = await firebaseFirestore.collection('user').get();
    for (var userDoc in usersSnapshot.docs) {
      String userId = userDoc.id;
      NotificationModel notification = NotificationModel(
        recieverId: userId,
        title: 'New Doctor Appointed',
        body: 'Dr.$doctorName is appointed for $category',
      );
      await addNotification(notification);
    }
  }

  Future<void> addNotification(NotificationModel data) async {
    try {
      DocumentReference docRef = await notification.add(data);
      data.id = docRef.id;
      await docRef.set(data);
    } catch (error) {
      log('Error during adding appointment: $error');
      rethrow;
    }
  }

  Future<List<NotificationModel>> getAllNotification() async {
    final snapshot = await notification.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      await notification.doc(notificationId).delete();
    } catch (error) {
      log('Error deleting notification with id $notificationId: $error');
      rethrow;
    }
  }

  Future<void> updateNotificationReadStatus(
      String notificationId, bool read) async {
    try {
      await notification.doc(notificationId).update({'read': read});
    } catch (error) {
      log('Error updating read status for notification with id $notificationId: $error');
      rethrow;
    }
  }
}
