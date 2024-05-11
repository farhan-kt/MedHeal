import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medheal/widgets/snackbar_widget.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';
import 'package:medheal/widgets/admin_bottom_bar.dart';
import 'package:medheal/service/authentication_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController profileEmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final otpFormkey = GlobalKey<FormState>();
  final phoneFormkey = GlobalKey<FormState>();
  final signInFormkey = GlobalKey<FormState>();
  final doctorAddFormKey = GlobalKey<FormState>();
  final fillAccountFormkey = GlobalKey<FormState>();
  final createAccountFormkey = GlobalKey<FormState>();
  final forgotPasswordFormkey = GlobalKey<FormState>();

  final AuthenticationService authenticationService = AuthenticationService();

  Country selectCountry = Country(
      phoneCode: '91',
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "INDIA",
      example: "INDIA",
      displayName: "INDIA",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  void notifyCountryChanged() {
    notifyListeners();
  }

  bool showOtpField = false;

  void showOtpFieldTrue() {
    showOtpField = true;
    notifyListeners();
  }

  String? selectedGender;
  List<String> genders = ['Male', 'Female'];

  bool signInObscureText = true;
  void signInObscureChange() {
    signInObscureText = !signInObscureText;
    notifyListeners();
  }

  bool createAccountObscureText = true;
  void createAccountObscureChange() {
    createAccountObscureText = !createAccountObscureText;
    notifyListeners();
  }

  bool createAccountConfirmObscureText = true;
  void createAccountConfirmObscureChange() {
    createAccountConfirmObscureText = !createAccountConfirmObscureText;
    notifyListeners();
  }

  adminKey(context, SnackBarWidget snackBarWidget, {String? message}) async {
    try {
      if (signInEmailController.text == 'medHeal@gmail.com' &&
          signInPasswordController.text == '12345') {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AdminBottomBar()),
            (route) => false);
        clearSignInControllers();
      } else {
        await emailSignIn(
            signInEmailController.text, signInPasswordController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const UserBottomBar()),
            (route) => false);
        clearSignInControllers();
      }
    } catch (error) {
      snackBarWidget.showErrorSnackbar(context, message!);
    }
  }

  void deniedAdminKey() {
    emailController.text == 'medheal';
  }

  void clearSignInControllers() {
    signInEmailController.clear();
    signInPasswordController.clear();
  }

  void clearCreateAccountControllers() {
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void clearFillProfileControllers() {
    fullNameController.clear();
    ageController.clear();
    profileEmailController.clear();
    phoneNumberController.clear();
    genderController.clear();
  }

  void clearPhoneVerificationController() {
    phoneController.clear();
    otpController.clear();
  }

  Future<UserCredential> accountCreate(String email, String password) async {
    return await authenticationService.userEmailCreate(email, password);
  }

  Future<UserCredential> emailSignIn(String email, String password) async {
    return await authenticationService.userEmailSignIn(email, password);
  }

  Future<void> logOut() async {
    await authenticationService.logOut();
  }

  Future<void> googleSignIn() async {
    await authenticationService.googleSignIn();
    notifyListeners();
  }

  Future<void> googleSignOut() async {
    await authenticationService.googleSignOut();
    notifyListeners();
  }

  Future<void> getOtp(phoneNumber) async {
    await authenticationService.getOtp(phoneNumber);
    notifyListeners();
  }

  Future<void> verifyOtp(otp, context, {error}) async {
    await authenticationService.verifyOtp(otp, context, error);
    notifyListeners();
  }

  Future<void> forgotPassword(context, {email}) async {
    authenticationService.passwordReset(email: email, context: context);
  }
}
