// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/model/doctor_model.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/widgets/snackbar_widget.dart';
import 'package:medheal/view/admin/admin_widgets.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/controller/notification_provider.dart';
import 'package:medheal/controller/authentication_provider.dart';

class DoctorAddingScreen extends StatelessWidget {
  const DoctorAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminProvider = Provider.of<DoctorProvider>(context, listen: false);
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: interHeadText(
          text: 'Add Doctors',
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: size.height * .02),
                Consumer<DoctorProvider>(
                  builder: (context, value, child) => Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: const Color(0xFFE3E3E3),
                        backgroundImage: value.doctorImage != null
                            ? Image.file(value.doctorImage!).image
                            : const AssetImage(
                                'assets/avatar-removebg-preview.png'),
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .95,
                  child: Form(
                    key: authProvider.doctorAddFormKey,
                    child: adminDoctorAddFields(size, context, adminProvider),
                  ),
                ),
                elevatedButtonWidget(
                  buttonHeight: size.height * .058,
                  buttonWidth: size.width * .9,
                  buttonText: 'Add Doctor',
                  onPressed: () async {
                    if (authProvider.doctorAddFormKey.currentState!
                        .validate()) {
                      int rating =
                          int.parse(adminProvider.doctorRatingController.text);

                      if (rating > 5) {
                        SnackBarWidget().showErrorSnackbar(
                            context, 'Rating should be 5 or less');
                      } else {
                        await addData(context, adminProvider);

                        await Provider.of<NotificationProvider>(context,
                                listen: false)
                            .addNotification(
                                doctorName:
                                    adminProvider.doctorNameController.text,
                                category: adminProvider.selectedCategory!);

                        adminProvider.setLoading(false);
                        authProvider.doctorAddFormKey.currentState!.reset();
                        adminProvider.clearDoctorAddingControllers();
                      }
                    }
                  },
                ),
                SizedBox(height: size.height * .02)
              ],
            ),
          ),
        ),
        Consumer<DoctorProvider>(
          builder: (context, value, child) {
            return value.isLoading
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'ADDING DOCTOR PLEASE WAIT... ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ]),
    );
  }

  Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<DoctorProvider>(context, listen: false);
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
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> addData(context, DoctorProvider adminProvider) async {
    final pickedImage = adminProvider.doctorImage;
    if (pickedImage != null) {
      adminProvider.setLoading(true);
      final image = await adminProvider.uploadImage(
          File(pickedImage.path), adminProvider.imageName);

      final newDoctor = DoctorModel(
        image: image,
        fullName: adminProvider.doctorNameController.text,
        age: adminProvider.doctorAgeController.text,
        gender: adminProvider.selectedGender,
        category: adminProvider.selectedCategory,
        position: adminProvider.selectedPosition,
        aboutDoctor: adminProvider.doctorAboutController.text,
        startTime: adminProvider.doctorAppointmentTimeController.text,
        endTime: adminProvider.doctorAppointmentEndTimeController.text,
        patients: adminProvider.doctorPatientsController.text,
        experience: adminProvider.doctorExperienceController.text,
        rating: int.parse(adminProvider.doctorRatingController.text),
        wishList: [],
      );

      await adminProvider.addDoctor(newDoctor);

      SnackBarWidget()
          .showSuccessSnackbar(context, 'Doctor Added Successfully');
    } else {
      SnackBarWidget()
          .showErrorSnackbar(context, 'failed to add, try one more');
    }
  }
}
