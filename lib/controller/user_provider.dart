import 'package:flutter/material.dart';
import 'package:medheal/view/user/authentication/login_type.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  TextEditingController userBookingDateController = TextEditingController();
  TextEditingController userBookingResheduledController =
      TextEditingController();

  Future<void> goToLoginType(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginTypeScreen()),
    );
  }
}
