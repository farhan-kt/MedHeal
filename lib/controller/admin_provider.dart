import 'package:flutter/material.dart';

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

  String selectedGender = 'Male';
  final List<String> genders = ['Male', 'Female'];
  void setSelectedGender(String value) {
    selectedGender = value;
    notifyListeners();
  }

  String selectedCategory = 'MBBS';
  final List<String> category = [
    'MD',
    'MBBS',
    'BDS',
    'ENT',
    'DDS',
    'DMD',
  ];
  void setSelectedCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  String selectedPosition = 'Senior Surgeon';
  final List<String> position = [
    'Senior Surgeon',
    'Attending Physician',
    'Junior Surgeon',
    'Consultant',
    'Medical Officer'
  ];
  void setSelectedPosition(String value) {
    selectedPosition = value;
    notifyListeners();
  }

  String selectedWorkingDays = 'monday - friday';
  final List<String> workingDays = [
    'monday - friday',
    'monday - saturday',
    'sunday',
    'weekend',
    'monday, wednesday, friday'
  ];
  void setSelectedWorkingDays(String value) {
    selectedPosition = value;
    notifyListeners();
  }

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
}
