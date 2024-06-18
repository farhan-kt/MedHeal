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
    final notificationService = NotificationService();
    await notificationService.checkAndNotifyUpcomingAppointments(context);
  }

  void getAllNotification() async {
    allNotification = await notificationService.getAllNotification();

    notifyListeners();
  }

  Future<void> addNotification(NotificationModel data) async {
    setLoading(true);
    try {
      await notificationService.addNotification(data);
      getAllNotification();
    } catch (error) {
      log('Error during adding notification: $error');
    }
    setLoading(false);
  }
}
