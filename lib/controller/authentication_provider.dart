import 'package:flutter/material.dart';
import 'package:medheal/view/user/authentication/fill_profile.dart';
import 'package:medheal/widgets/admin_bottom_bar.dart';
import 'package:medheal/widgets/snackbar_widget.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';

class AuthenticationProvider extends ChangeNotifier {
  String selectedGender = 'Male';
  final List<String> genders = ['Male', 'Female'];
  void setSelectedGender(String value) {
    selectedGender = value;
    notifyListeners();
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController profileEmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final signInFormkey = GlobalKey<FormState>();
  final doctorAddFormKey = GlobalKey<FormState>();
  final createAccountFormkey = GlobalKey<FormState>();
  final fillAccountFormkey = GlobalKey<FormState>();

  void adminKey(context) {
    if (signInEmailController.text == 'medHeal' &&
        signInPasswordController.text == '12345') {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AdminBottomBar()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const UserBottomBar()),
          (route) => false);
    }
  }

  void deniedAdminKey() {
    emailController.text == 'medheal';
  }

  void clearSignInControllers() {
    signInEmailController.clear();
    signInPasswordController.clear();
  }

  void clearAccountCreateControllers() {
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
