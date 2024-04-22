import 'package:flutter/material.dart';
import 'package:medheal/view/user/authentication/auth_widgets.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';
import 'package:medheal/controller/authentication_provider.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: interText(
            text: 'Fill Profile',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
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
                      ),
                      CustomTextFormField(
                        controller: authProvider.dobController,
                        hintText: 'Date of Birth',
                        suffixIcon: const Icon(EneftyIcons.calendar_2_outline),
                      ),
                      CustomTextFormField(
                        controller: authProvider.profileEmailController,
                        hintText: 'Email',
                      ),
                      CustomTextFormField(
                        controller: authProvider.phoneNumberController,
                        hintText: ' Phone Number',
                      ),
                      Consumer<AuthenticationProvider>(
                        builder: (context, authValue, child) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          height: size.height * .075,
                          width: size.width * .9,
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: DropdownButtonFormField<String>(
                              icon: const SizedBox.shrink(),
                              validator: (value) {
                                if (value == null) {
                                  return 'select your gender';
                                } else {
                                  return null;
                                }
                              },
                              value: authValue.selectedGender,
                              items: authValue.genders.map((String gender) {
                                return DropdownMenuItem<String>(
                                  value: gender,
                                  child: gender == 'Male' || gender == 'Female'
                                      ? interText(
                                          text: gender,
                                          color: const Color(0xFF1A1A1A),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )
                                      : null,
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  authValue.setSelectedGender(newValue);
                                }
                              },
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                      EneftyIcons.arrow_down_outline),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 225, 227, 234),
                                  hintText: 'Gender',
                                  hintStyle: GoogleFonts.inter(
                                    color: const Color(0xFF98A3B3),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  icon: null),
                            ),
                          ),
                        ),
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
                  onPressed: () {
                    dialogBox(context,
                        height: size.height * .02,
                        width: size.width * .8,
                        dialogheight: size.height * .4,
                        dialogWidth: size.width * .2);
                  },
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
