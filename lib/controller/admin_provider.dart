import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medheal/model/doctor_model.dart';

class AdminProvider extends ChangeNotifier {
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController doctorAgeController = TextEditingController();
  TextEditingController doctorAboutController = TextEditingController();
  TextEditingController doctorAppointmentTimeController =
      TextEditingController();
  TextEditingController doctorAppointmentEndTimeController =
      TextEditingController();
  TextEditingController doctorPatientsController = TextEditingController();
  TextEditingController doctorExperienceController = TextEditingController();
  TextEditingController doctorRatingController = TextEditingController();

  final doctorAddFormkey = GlobalKey<FormState>();

  String? selectedGender;
  List<String> genders = ['Male', 'Female'];

  String? selectedCategory;
  List<String> category = [
    'MD',
    'MBBS',
    'BDS',
    'ENT',
    'DDS',
    'DMD',
  ];

  String? selectedPosition;
  List<String> position = [
    'Senior Surgeon',
    'Attending Physician',
    'Junior Surgeon',
    'Consultant',
    'Medical Officer'
  ];

  String? selectedWorkingDays;
  List<String> workingDays = [
    'monday - friday',
    'monday - saturday',
    'sunday',
    'weekend',
    'monday, wednesday, friday'
  ];

  void clearDoctorAddingControllers() {
    doctorNameController.clear();
    doctorAgeController.clear();
    doctorAboutController.clear();
    doctorAppointmentTimeController.clear();
    doctorAppointmentEndTimeController.clear();
    doctorPatientsController.clear();
    doctorExperienceController.clear();
    doctorRatingController.clear();
  }

  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;

  final ImagePicker imagePicker = ImagePicker();

  List<DoctorModel> searchList = [];
  List<DoctorModel> allDoctorList = [];
}
