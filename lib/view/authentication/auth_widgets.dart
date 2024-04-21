import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:provider/provider.dart';
import 'package:medheal/controller/authentication_provider.dart';

Widget dropDown(AuthenticationProvider authProvider, context) {
  Size size = MediaQuery.of(context).size;
  return Consumer<AuthenticationProvider>(builder: (context, authValue, child) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: size.height * .075,
      width: size.width * .9,
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null) {
            return "Select your gender";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          fillColor: const Color.fromARGB(255, 225, 227, 234),
          filled: true,
          hintText: 'Gender',
          hintStyle: GoogleFonts.inter(
            color: const Color(0xFF98A3B3),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        value: authValue.selectedGender,
        items: <String?>[null, 'Male', 'Female']
            .map<DropdownMenuItem<String>>((String? value) {
          return DropdownMenuItem<String>(
            value: value,
            child: value != null
                ? interText(
                    text: value,
                    color: const Color(0xFF1A1A1A),
                    fontWeight: value == 'Male' || value == 'Female'
                        ? FontWeight.w400
                        : FontWeight.normal,
                    fontSize: 14,
                  )
                : interText(
                    text: 'Gender',
                    color: const Color(0xFF98A3B3),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            authValue.setSelectedGender(newValue);
          }
        },
      ),
    );
  });
}

Widget loginTypePoppinsText({text}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 15));
}

Widget loginTypeOutlinedButton(size, {text, double? width, double? height}) {
  return SizedBox(
    width: width,
    height: height,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.8),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: poppinsText(
          textAlign: TextAlign.center,
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    ),
  );
}

dialogBox(
  context, {
  height,
  width,
  dialogheight,
  dialogWidth,
}) {
  final double avatarRadius = MediaQuery.of(context).size.width * 0.15;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: SizedBox(
          height: dialogheight,
          width: dialogWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(height: height),
              CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: const Color(0xFF1995AD),
                  backgroundImage:
                      const AssetImage('assets/avatar-removebg-preview.png')),
              SizedBox(height: height),
              poppinsText(
                  text: 'Successful!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1995AD)),
              SizedBox(height: height),
              SizedBox(
                width: width,
                child: poppinsText(
                    textAlign: TextAlign.center,
                    text:
                        'Your account is ready to use. You will be redirected to Home page in a few seconds...',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF101828)),
              ),
              SizedBox(height: height),
              const CircularProgressIndicator(
                color: Color(0xFF1995AD),
              )
            ]),
          ),
        ));
      });
}
