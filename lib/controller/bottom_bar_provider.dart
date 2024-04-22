import 'package:flutter/material.dart';
import 'package:medheal/view/all_doctors.dart';
import 'package:medheal/view/user/appointment/appointment_tab.dart';
import 'package:medheal/view/user/home/home_user.dart';
import 'package:medheal/view/user/profile/profile_user.dart';

class BottomProvider extends ChangeNotifier {
  int currentIndex = 0;

  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List screens = [
    const UserHomeScreen(),
    const AppointmentScreen(),
    const AllDoctorsScreen(),
    const UserProfileScreen()
  ];
}
