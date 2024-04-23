import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController doctorAgeController = TextEditingController();
  TextEditingController aboutDoctorController = TextEditingController();
  TextEditingController doctorAppointmentTimeController =
      TextEditingController();
  TextEditingController doctorAppointmentEndTimeController =
      TextEditingController();
  TextEditingController patientsController = TextEditingController();
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
  final List<String> category = ['MD', 'MBBS', 'BDS'];
  void setSelectedCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  String selectedPosition = 'Senior Surgeon';
  final List<String> position = ['Senior Surgeon', 'Jr Surgeon'];
  void setSelectedPosition(String value) {
    selectedPosition = value;
    notifyListeners();
  }

  String selectedWorkingDays = 'tuesday';
  final List<String> workingDays = ['tuesday', 'monday'];
  void setSelectedWorkingDays(String value) {
    selectedPosition = value;
    notifyListeners();
  }
}
