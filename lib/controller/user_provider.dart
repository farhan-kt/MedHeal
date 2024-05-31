import 'package:flutter/material.dart';
import 'package:medheal/view/user/authentication/authentication_navigate.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController userBookingDateController = TextEditingController();
  TextEditingController userBookingResheduledController =
      TextEditingController();

  // Future<void> goToLoginType(context) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const AuthenticationNavigate()),
  //   );
  // }
}
