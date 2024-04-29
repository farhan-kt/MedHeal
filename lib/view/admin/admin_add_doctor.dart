import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/snackbar_widget.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/widgets/textformfield_widget.dart';
import 'package:medheal/controller/authentication_provider.dart';

class DoctorAddingScreen extends StatelessWidget {
  const DoctorAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: interHeadText(
          text: 'Add Doctors',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(height: size.height * .02),
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.orange[400],
                  backgroundImage:
                      const AssetImage('assets/avatar-removebg-preview.png'),
                ),
                Positioned(
                    bottom: 0,
                    right: size.width * .05,
                    child: Container(
                      height: size.height * .04,
                      width: size.width * .08,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            EneftyIcons.edit_2_bold,
                            color: Colors.white,
                            size: 18,
                          )),
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 1,
              child: Form(
                  key: authProvider.doctorAddFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: adminProvider.doctorNameController,
                              hintText: 'Full Name',
                              validateMessage: 'Enter Name',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: adminProvider.doctorAgeController,
                              hintText: 'Age',
                              width: size.width * .2,
                              validateMessage: 'Enter Age',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: dropDownTextFormField(context,
                                selectedValue: adminProvider.selectedGender,
                                items: adminProvider.genders,
                                hintText: 'Gender',
                                validatorMessage: 'Select a Gender',
                                onChanged: (String? newValue) {
                              if (newValue != null) {
                                adminProvider.setSelectedGender(newValue);
                              }
                            }),
                          )
                        ],
                      ),
                      dropDownTextFormField(context,
                          selectedValue: adminProvider.selectedCategory,
                          items: adminProvider.category,
                          validatorMessage: 'Select a category',
                          hintText: 'Category', onChanged: (String? newValue) {
                        if (newValue != null) {
                          adminProvider.setSelectedCategory(newValue);
                        }
                      }),
                      dropDownTextFormField(context,
                          selectedValue: adminProvider.selectedPosition,
                          items: adminProvider.position,
                          validatorMessage: 'Select a position',
                          hintText: 'Position', onChanged: (String? newValue) {
                        if (newValue != null) {
                          adminProvider.setSelectedPosition(newValue);
                        }
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: adminProvider.doctorAboutController,
                              // maxLines: 4,
                              labelText: 'About Doctor',
                              validateMessage: 'tPlease fill out this field',
                            ),
                          ),
                        ],
                      ),
                      poppinsHeadText(text: 'Working information'),
                      dropDownTextFormField(context,
                          selectedValue: adminProvider.selectedWorkingDays,
                          items: adminProvider.workingDays,
                          validatorMessage: 'Select working days',
                          hintText: 'working days',
                          onChanged: (String? newValue) {
                        if (newValue != null) {
                          adminProvider.setSelectedWorkingDays(newValue);
                        }
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller:
                                  adminProvider.doctorAppointmentTimeController,
                              labelText: "inspection start time",
                              validateMessage: 'pick inspection time',
                            ),
                          ),
                          SizedBox(width: size.width * .08),
                          Expanded(
                            child: CustomTextFormField(
                              controller: adminProvider
                                  .doctorAppointmentEndTimeController,
                              labelText: 'inspection end time',
                              validateMessage: 'pick inspection end time',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller:
                                  adminProvider.doctorPatientsController,
                              labelText: 'Patients',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: size.width * .08),
                          Expanded(
                            child: CustomTextFormField(
                              controller:
                                  adminProvider.doctorExperienceController,
                              labelText: 'Experience',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: size.width * .08),
                          Expanded(
                            child: CustomTextFormField(
                              controller: adminProvider.doctorRatingController,
                              labelText: 'Rating',
                              validateMessage: 'Enter Rating',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              width: size.width * .9,
              height: size.height * .058,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1995AD)),
                  onPressed: () {
                    if (authProvider.doctorAddFormKey.currentState!
                        .validate()) {
                      int rating =
                          int.parse(adminProvider.doctorRatingController.text);
                      if (rating > 5) {
                        SnackBarWidget().showErrorSnackbar(
                            context, 'Rating should be 5 or less');
                      } else {
                        adminProvider.clearDoctorAddingControllers();
                      }
                    }
                  },
                  child: poppinsText(
                      text: 'Add Doctor',
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: size.height * .02)
          ]),
        ),
      ),
    );
  }
}
