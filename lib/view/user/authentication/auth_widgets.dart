import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';
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
                ? interSubText(
                    text: value,
                    color: const Color(0xFF1A1A1A),
                    fontWeight: value == 'Male' || value == 'Female'
                        ? FontWeight.w400
                        : FontWeight.normal,
                  )
                : interSubText(
                    text: 'Gender',
                    color: const Color(0xFF98A3B3),
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

Widget loginTypeTexts({text}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 15));
}

Widget loginTypeOutlinedButton(Size size, {text, onPressed}) {
  return SizedBox(
    width: size.width * 0.75,
    height: size.height * .063,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.8),
      ),
      onPressed: onPressed,
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

Widget profileFillFields(size, AuthenticationProvider authProvider) {
  return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    CustomTextFormField(
      controller: authProvider.fullNameController,
      hintText: 'Full Name',
    ),
    CustomTextFormField(
      controller: authProvider.ageController,
      hintText: 'Age',
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
                    ? interSubText(
                        text: gender,
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
                suffixIcon: const Icon(EneftyIcons.arrow_down_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 225, 227, 234),
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
  ]);
}

Widget authenticationBoxRow(Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: size.height * .065,
        width: size.width * .2,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 199, 212, 226)),
            borderRadius: BorderRadius.circular(18)),
        child: Transform.scale(
          scale: 0.5,
          child: Image.network(
            'https://cdn.iconscout.com/icon/free/png-256/free-google-1772223-1507807.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      SizedBox(width: size.width * .1),
      Container(
        height: size.height * .065,
        width: size.width * .2,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 199, 212, 226)),
            borderRadius: BorderRadius.circular(18)),
        child: Transform.scale(
          scale: 0.55,
          child: Image.network(
            'https://cdn-icons-png.freepik.com/256/100/100313.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    ],
  );
}

Widget createAccountTextFormFields(
  AuthenticationProvider authProvider,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CustomTextFormField(
        controller: authProvider.userNameController,
        hintText: 'User Name',
        validateMessage: 'Enter User Name',
      ),
      CustomTextFormField(
        controller: authProvider.emailController,
        hintText: 'Email',
        validateMessage: 'Enter Email',
        keyboardType: TextInputType.emailAddress,
      ),
      CustomTextFormField(
        controller: authProvider.passwordController,
        hintText: 'Password',
        obscureText: authProvider.createAccountObscureText,
        suffixIcon: IconButton(
          onPressed: () {
            authProvider.createAccountObscureChange();
          },
          icon: Icon(authProvider.createAccountObscureText
              ? EneftyIcons.eye_slash_outline
              : EneftyIcons.eye_outline),
        ),
        validateMessage: 'Enter password',
      ),
      CustomTextFormField(
        controller: authProvider.confirmPasswordController,
        hintText: 'Confirm Password',
        obscureText: authProvider.createAccountConfirmObscureText,
        suffixIcon: IconButton(
          onPressed: () {
            authProvider.createAccountConfirmObscureChange();
          },
          icon: Icon(authProvider.createAccountConfirmObscureText
              ? EneftyIcons.eye_slash_outline
              : EneftyIcons.eye_outline),
        ),
        validateMessage: 'Renter Your Password',
      ),
    ],
  );
}

Widget signInTextFormField(AuthenticationProvider authProvider) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CustomTextFormField(
        controller: authProvider.signInEmailController,
        hintText: 'Email',
        keyboardType: TextInputType.emailAddress,
      ),
      const SizedBox(height: 5),
      Consumer<AuthenticationProvider>(
        builder: (context, value, child) => CustomTextFormField(
          controller: value.signInPasswordController,
          hintText: 'Password',
          obscureText: value.signInObscureText,
          suffixIcon: IconButton(
            onPressed: () {
              value.signInObscureChange();
            },
            icon: Icon(value.signInObscureText
                ? EneftyIcons.eye_slash_outline
                : EneftyIcons.eye_outline),
          ),
        ),
      ),
      TextButton(
          onPressed: () {},
          child: poppinsText(
              text: 'Forgot the password?',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1995AD))),
    ],
  );
}
