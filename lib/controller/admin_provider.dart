import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medheal/model/doctor_model.dart';
import 'package:medheal/service/doctor_service.dart';

class AdminProvider extends ChangeNotifier {
  DoctorService doctorService = DoctorService();

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

  File? doctorImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;

  final ImagePicker imagePicker = ImagePicker();

  List<DoctorModel> searchList = [];
  List<DoctorModel> allDoctorList = [];

  void addCar(DoctorModel data) async {
    await doctorService.addDoctor(data);

    notifyListeners();
    getAllDoctors();
  }

  void deleteCar(String id) async {
    await doctorService.deleteDoctor(id);
    getAllDoctors();
  }

  void getAllDoctors() async {
    allDoctorList = await doctorService.getAllDoctors();

    notifyListeners();
  }

  Future<String> uploadImage(image, imageName) async {
    try {
      if (image != null) {
        String downloadUrl = await doctorService.uploadImage(imageName, image);
        log(downloadUrl);
        notifyListeners();
        return downloadUrl;
      } else {
        log('image is null');
        return '';
      }
    } catch (e) {
      log('got an error of $e');
      rethrow;
    }
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      doctorImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }
}
