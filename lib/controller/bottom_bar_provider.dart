import 'package:flutter/material.dart';
import 'package:medheal/view/all_doctors.dart';
import 'package:medheal/view/appointment.dart';
import 'package:medheal/view/home_user.dart';
import 'package:medheal/view/profile_user.dart';

class BottomProvider extends ChangeNotifier {
  int currentIndex = 0;

  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List screens = [
    const UserHomeScreen(),
    const AppointmentScreen(),
    const AllDoctors(),
    const UserProfileScreen()
  ];
}
