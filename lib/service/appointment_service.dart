import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medheal/model/appointment_model.dart';

class AppointmentService {
  String appointments = 'appointment';
  late CollectionReference<AppointmentModel> appointment;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  AppointmentService() {
    appointment = firebaseFirestore
        .collection(appointments)
        .withConverter<AppointmentModel>(fromFirestore: (snapshot, options) {
      return AppointmentModel.fromJson(snapshot.id, snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }

  // Future<void> addAppointment(AppointmentModel data) async {
  //   try {
  //     // await appointment.add(data);
  //     DocumentReference docRef = await appointment.add(data);
  //     data.id = docRef.id;
  //     await docRef.set(data);
  //   } catch (error) {
  //     log('error during adding appointment :$error');
  //   }
  // }

  Future<bool> isTimeSlotAvailable(
      String docId, String date, String time) async {
    final querySnapshot = await appointment
        .where('docId', isEqualTo: docId)
        .where('date', isEqualTo: date)
        .where('time', isEqualTo: time)
        .get();
    return querySnapshot.docs.isEmpty;
  }

  Future<void> addAppointment(AppointmentModel data) async {
    try {
      final isAvailable =
          await isTimeSlotAvailable(data.docId!, data.date!, data.time!);
      if (isAvailable) {
        DocumentReference docRef = await appointment.add(data);
        data.id = docRef.id;
        await docRef.set(data);
      } else {
        throw Exception("Time slot is already booked");
      }
    } catch (error) {
      log('Error during adding appointment: $error');
      throw error;
    }
  }

  Future<void> deleteAppointment(String id) async {
    try {
      await appointment.doc(id).delete();
    } catch (error) {
      log('error during deleting appointment :$error');
    }
  }

  Future<List<AppointmentModel>> getAllAppointments() async {
    final snapshot = await appointment.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateAppointment(String id, AppointmentModel data) async {
    try {
      await appointment.doc(id).update(
            data.toJson(),
          );
    } catch (e) {
      log("error in updating appointment : $e");
    }
  }
}
