import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medheal/model/authentication_model.dart';
import 'package:medheal/view/user/user_widgets.dart';
import 'package:medheal/widgets/snackbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/view/user/authentication/auth_widgets.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({
    super.key,
  });

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  TextEditingController userNameEditController = TextEditingController();
  TextEditingController ageEditController = TextEditingController();
  TextEditingController genderEditController = TextEditingController();
  TextEditingController phoneEditController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   userNameEditController.text = widget.user.userName ?? '';
  //   ageEditController.text = widget.user.age ?? '';
  //   phoneEditController.text = widget.user.phoneNumber ?? '';
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: interHeadText(
          text: 'Fill Profile',
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: size.height * .04),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.orange[400],
                    backgroundImage:
                        const AssetImage('assets/avatar-removebg-preview.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: size.width * .05,
                  child: Container(
                    height: size.height * .04,
                    width: size.width * .08,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        EneftyIcons.edit_2_bold,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * .02),
            SizedBox(
              height: size.height * .45,
              child: Form(
                key: authProvider.fillAccountFormkey,
                child: profileFillFields(size, authProvider,
                    userNameController: userNameEditController,
                    ageController: ageEditController,
                    phoneController: phoneEditController),
              ),
            ),
            SizedBox(height: size.height * .02),
            elevatedButtonWidget(
                buttonHeight: size.height * .058,
                buttonWidth: size.width * .9,
                buttonText: 'UPDATE',
                onPressed: () async {
                  if (authProvider.fillAccountFormkey.currentState!
                      .validate()) {
                    // await updateUser(context, widget.user);
                    authProvider.clearFillProfileControllers();
                    Navigator.pop(context);
                  }

                  successDialogBox(context, size,
                      isAppointment: false,
                      headMessage: 'Profile Updated!',
                      height: size.height * .02,
                      width: size.width * .8,
                      dialogheight: size.height * .4,
                      dialogWidth: size.width * .2,
                      subText:
                          'Your account is ready to use. You will be redirected to the home Page in a few seconds...');
                })
          ]),
        ),
      ),
    );
  }

  updateUser(context, UserModel user) async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    user.userName = userNameEditController.text;
    user.age = ageEditController.text;
    user.phoneNumber = phoneEditController.text;
    user.gender = authProvider.selectedGender;
    await authProvider.updateUser(FirebaseAuth.instance.currentUser!.uid, user);

    Navigator.pop(context);
    SnackBarWidget().showSuccessSnackbar(context, 'User Profile Updated');
  }
}
