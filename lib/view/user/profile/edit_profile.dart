// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/view/user/user_widgets.dart';
import 'package:medheal/model/authentication_model.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/view/user/authentication/auth_widgets.dart';

class ProfileEditScreen extends StatefulWidget {
  final AuthenticationProvider value;
  final UserModel user;
  final ImageProvider? imageProvider;
  const ProfileEditScreen({
    super.key,
    required this.value,
    required this.user,
    this.imageProvider,
  });

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController userNameEditController = TextEditingController();
  TextEditingController ageEditController = TextEditingController();
  TextEditingController phoneEditController = TextEditingController();
  ImageProvider? _imageProvider;

  @override
  void initState() {
    super.initState();
    userNameEditController.text = widget.value.currentUser?.userName ?? '';
    ageEditController.text = widget.value.currentUser?.age ?? '';
    phoneEditController.text = widget.value.currentUser?.phoneNumber ?? '';
    if (widget.value.currentUser?.image != null) {
      _imageProvider = NetworkImage(widget.value.currentUser?.image ?? '');
    } else {
      _imageProvider = widget.imageProvider;
    }
    widget.value.selectedGender = widget.value.currentUser?.gender ?? '';
  }

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
          text: 'Edit Profile',
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
                Consumer<AuthenticationProvider>(
                  builder: (context, value, child) => CircleAvatar(
                      radius: 80,
                      backgroundColor: const Color.fromARGB(255, 143, 189, 198),
                      backgroundImage: value.profileImage != null
                          ? Image.file(value.profileImage!).image
                          : _imageProvider),
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
                      onPressed: () {
                        pickImage(context);
                      },
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
                shape: MaterialStateProperty.all(
                  BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                buttonHeight: size.height * .058,
                buttonWidth: size.width * .9,
                buttonText: 'UPDATE',
                onPressed: () async {
                  if (authProvider.fillAccountFormkey.currentState!
                      .validate()) {
                    await updateUser(context, widget.user, authProvider);
                    authProvider.clearFillProfileControllers();
                    Navigator.pop(context);
                    successDialogBox(context, size,
                        isAppointment: false,
                        headMessage: 'Profile Updated!',
                        height: size.height * .02,
                        width: size.width * .8,
                        dialogheight: size.height * .4,
                        dialogWidth: size.width * .2,
                        subText:
                            '${widget.value.currentUser?.userName ?? ''}, your profile has been updated. You can also edit your profile in My Profile.');
                  }
                })
          ]),
        ),
      ),
    );
  }

  updateUser(
      context, UserModel user, AuthenticationProvider authProvider) async {
    final pickedImage = authProvider.profileImage;
    if (pickedImage != null) {
      authProvider.setLoading(true);
      final image = await authProvider.uploadImage(
          File(pickedImage.path), authProvider.imageName);

      // final authProvider =
      //     Provider.of<AuthenticationProvider>(context, listen: false);
      user.userName = userNameEditController.text;
      user.age = ageEditController.text;
      user.phoneNumber = phoneEditController.text;
      user.gender = authProvider.selectedGender;
      user.image = image;
      await authProvider.updateUser(
          FirebaseAuth.instance.currentUser!.uid, user);

      Navigator.pop(context);
    }
  }

  Future<void> pickImage(BuildContext context) async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  authProvider.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  authProvider.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
