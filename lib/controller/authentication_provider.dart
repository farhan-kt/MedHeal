import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  String selectedGender = 'Male';
  final List<String> Genders = ['Male', 'Female'];
  void setSelectedGender(String value) {
    selectedGender = value;
    notifyListeners();
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController signInEmailPasswordController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController profileEmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final signInFormkey = GlobalKey<FormState>();
  final doctorAddFormKey = GlobalKey<FormState>();
  final createAccountFormkey = GlobalKey<FormState>();
}
