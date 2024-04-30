import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/widgets/snackbar_widget.dart';
import 'package:medheal/view/admin/admin_widgets.dart';
import 'package:medheal/controller/admin_provider.dart';
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
          child: Column(
            children: [
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
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                  child: adminDoctorAddFields(size, context, adminProvider),
                ),
              ),
              elevatedButtonWidget(
                buttonHeight: size.height * .058,
                buttonWidth: size.width * .9,
                buttonText: 'Add Doctor',
                onPressed: () {
                  if (authProvider.doctorAddFormKey.currentState!.validate()) {
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
              ),
              SizedBox(height: size.height * .02)
            ],
          ),
        ),
      ),
    );
  }
}
