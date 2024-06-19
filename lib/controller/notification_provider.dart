import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medheal/model/notification_model.dart';
import 'package:medheal/service/notification_service.dart';

class NotificationProvider extends ChangeNotifier {
  String appointments = 'notification';
  List<NotificationModel> allNotification = [];
  User? user = FirebaseAuth.instance.currentUser;
  late CollectionReference<NotificationModel> appointment;
  NotificationService notificationService = NotificationService();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> checkAppointmentsForNotification(context) async {
    await notificationService.checkAndNotifyUpcomingAppointments(context);
  }

  Future<void> checkForNotification(context) async {
    if (hasUnreadNotifications()) {
      await notificationService.showNotification(
        title: 'You have unread notifications',
        body: 'Check your notifications for updates.',
      );
    }
  }

  void getAllNotification() async {
    allNotification = await notificationService.getAllNotification();
    notifyListeners();
  }

  void deleteNotification(notificationId) async {
    await notificationService.deleteNotification(notificationId);
    notifyListeners();
  }

  Future<void> updateNotificationReadStatus(
      String notificationId, bool read) async {
    try {
      await notificationService.updateNotificationReadStatus(
          notificationId, read);
      getAllNotification();
    } catch (error) {
      log('Error updating read status for notification: $error');
    }
  }

  Future<void> addNotification({
    required String category,
    required String doctorName,
  }) async {
    setLoading(true);
    try {
      await notificationService.notifyAllUsers(
        doctorName: doctorName,
        category: category,
      );
      getAllNotification();
    } catch (error) {
      log('Error during adding doctor and notifying users: $error');
    }
    setLoading(false);
  }

  bool hasUnreadNotifications() {
    return allNotification.any((notification) =>
        notification.recieverId == user?.uid && notification.read == false);
  }
}
