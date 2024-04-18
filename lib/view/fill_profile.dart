import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';
import 'package:medheal/controller/authentication_provider.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: interText(text: 'Fill Profile'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: poppinsText(
                  text: 'Skip',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1995AD)))
        ],
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
                CircleAvatar(
                  radius: 90,
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
            SizedBox(height: size.height * .02),
            SizedBox(
              height: size.height * .45,
              child: Form(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextFormField(
                        controller: authProvider.fullNameController,
                        hintText: 'Full Name',
                        height: size.height * .075,
                      ),
                      CustomTextFormField(
                        controller: authProvider.dobController,
                        hintText: 'Date of Birth',
                        height: size.height * .075,
                        suffixIcon: const Icon(EneftyIcons.calendar_2_outline),
                      ),
                      CustomTextFormField(
                        controller: authProvider.profileEmailController,
                        hintText: 'Email',
                        height: size.height * .075,
                      ),
                      CustomTextFormField(
                        controller: authProvider.phoneNumberController,
                        hintText: ' Phone Number',
                        height: size.height * .075,
                      ),
                      CustomTextFormField(
                        controller: authProvider.genderController,
                        hintText: 'Gender',
                        height: size.height * .075,
                        suffixIcon: const Icon(EneftyIcons.arrow_down_outline),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: size.height * .02),
            SizedBox(
              width: size.width * .9,
              height: size.height * .058,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1995AD)),
                  onPressed: () {},
                  child: poppinsText(
                      text: 'CONTINUE',
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
          ]),
        ),
      ),
    );
  }
}
