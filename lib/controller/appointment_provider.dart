import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medheal/model/appointment_model.dart';
import 'package:medheal/service/appointment_service.dart';
import 'package:medheal/service/doctor_service.dart';

class AppointmentProvider extends ChangeNotifier {
  TextEditingController userBookingDateController = TextEditingController();
  TextEditingController userBookingResheduledController =
      TextEditingController();

  AppointmentService appointmentService = AppointmentService();

  final appointmentFormKey = GlobalKey<FormState>();

  List<AppointmentModel> allAppointmentList = [];
  bool isLoading = false;

  String? selectedDate;
  String? selectedTime;

  void setSelectedTime(String time) {
    if (selectedTime == time) {
      selectedTime = null;
    } else {
      selectedTime = time;
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setSelectedDate(String date) {
    selectedDate = date;
    notifyListeners();
  }

  Future<bool> addAppointment(
      AppointmentModel data, Function(String) onError) async {
    setLoading(true);
    bool success = false;
    try {
      await appointmentService.addAppointment(data);
      clearAppointmentControllers();
      await getAllAppointments();
      success = true;
    } catch (error) {
      log('Error during adding appointment: $error');
      onError('Slot is already booked');
    }
    setLoading(false);
    return success;
  }

  Future<void> deleteAppointment(String id) async {
    setLoading(true);
    await appointmentService.deleteAppointment(id);
    await getAllAppointments();
    setLoading(false);
  }

  Future<void> getAllAppointments() async {
    setLoading(true);
    allAppointmentList = await appointmentService.getAllAppointments();
    setLoading(false);
  }

  Future<void> updateAppointment(String id, AppointmentModel data) async {
    setLoading(true);
    await appointmentService.updateAppointment(id, data);
    await getAllAppointments();
    setLoading(false);
  }

  void clearAppointmentControllers() {
    userBookingDateController.clear();
    userBookingResheduledController.clear();
    selectedTime = null;
    notifyListeners();
  }

  final DoctorService doctorService = DoctorService();

  // Future<void> getUserAppointments() async {
  //   setLoading(true);
  //   try {
  //     String userId = FirebaseAuth.instance.currentUser!.uid;
  //     List<AppointmentModel> allAppointments =
  //         await appointmentService.getAllAppointments();
  //     List<AppointmentModel> userAppointments = allAppointments
  //         .where((appointment) => appointment.uId == userId)
  //         .toList();

  //     allAppointmentList = userAppointments;
  //   } catch (error) {
  //     log('Error fetching user appointments: $error');
  //   }
  //   setLoading(false);
  // }

  Future<List<AppointmentModel>> getUserAppointments() async {
    setLoading(true);
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      List<AppointmentModel> allAppointments =
          await appointmentService.getAllAppointments();
      List<AppointmentModel> userAppointments = allAppointments
          .where((appointment) => appointment.uId == userId)
          .toList();

      setLoading(false);
      return userAppointments;
    } catch (error) {
      setLoading(false);
      log('Error fetching user appointments: $error');
      throw error; // Rethrow the error to handle it in the UI
    }
  }

  List<AppointmentModel> canceledAppointmentList = [];

  Future<void> cancelAppointment(String id, Function(String) onError) async {
    try {
      AppointmentModel appointment =
          allAppointmentList.firstWhere((app) => app.id == id);
      appointment.status = 'canceled';
      await appointmentService.updateAppointment(id, appointment);
      await getAllAppointments();
      canceledAppointmentList.add(appointment);
      onError('Appointment cancelled');
    } catch (error) {
      log('Error during canceling appointment: $error');
    }
  }
}
