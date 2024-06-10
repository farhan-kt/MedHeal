import 'dart:io';
import 'dart:developer';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medheal/model/authentication_model.dart';
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

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  UserModel? currentUser;
  UserModel? sortedUser;

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
    userNameController.clear();
    ageController.clear();
    emailController.clear();
    phoneNumberController.clear();
    genderController.clear();
    profileImage = null;
    // selectedGender = null;
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

  void googleSignIn(BuildContext context) async {
    try {
      final user = await authenticationService.googleSignIn();
      if (user != null) {
        await authenticationService.addUser(user);
        currentUser = user;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const UserBottomBar(),
          ),
          (route) => false,
        );
        notifyListeners();
      } else {
        throw Exception('User is null');
      }
    } catch (e) {
      log('Sign up with Google error: $e');
    }
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

  // Future<void> forgotPassword(context, {email, Function? success}) async {
  //   authenticationService.passwordReset(
  //       email: email, context: context, snackBarSuccess: success);
  // }

  Future<void> forgotPassword(
    BuildContext context, {
    required String email,
    // required Function snackBarSuccess,
  }) async {
    authenticationService.passwordReset(
      email: email,
      context: context,
      // snackBarSuccess: snackBarSuccess,
      showSnackbar: (message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      ),
    );
  }

  addUser() async {
    final user = UserModel(
      email: emailController.text,
      phoneNumber: phoneController.text,
      userName: userNameController.text,
      age: ageController.text,
      gender: selectedGender,
      uId: firebaseAuth.currentUser!.uid,
    );
    await authenticationService.addUser(user);
    getUser();
  }

  getUser() async {
    currentUser = await authenticationService.getCurrentUser();
    log(currentUser?.phoneNumber ?? "");
    notifyListeners();
  }

  updateUser(userid, UserModel data) async {
    await authenticationService.updateUser(userid, data);
    clearFillProfileControllers();
    notifyListeners();
  }

  getDoctorUser(String uId) async {
    List<UserModel> allUsers = await authenticationService.getAllUser();
    sortedUser = allUsers.firstWhere((element) => element.uId == uId);
    notifyListeners();
  }

  File? profileImage;

  String imageName = DateTime.now().microsecondsSinceEpoch.toString();

  final ImagePicker imagePicker = ImagePicker();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }

  Future<String> uploadImage(image, imageName) async {
    try {
      if (image != null) {
        String downloadUrl =
            await authenticationService.uploadImage(imageName, image);
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
}
