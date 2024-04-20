import 'package:flutter/material.dart';
import 'package:medheal/view/authentication/login_widgets.dart';

class LoginTypeScreen extends StatelessWidget {
  const LoginTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 86, 185, 205),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .17,
              ),
              Image.asset(
                'assets/sign In.png',
                fit: BoxFit.cover,
              ),
              loginTypePoppinsText(text: 'Your health is our priority.'),
              loginTypePoppinsText(
                  text: 'Sign in to MedHeal and start your wellness journey.'),
              loginTypePoppinsText(
                  text: 'We are here to support you every step of the way'),
              SizedBox(height: size.height * .05),
              loginTypeOutlinedButton(size,
                  text: 'CREATE ACCOUNT',
                  width: size.width * 0.75,
                  height: size.height * .063),
              SizedBox(height: size.height * .025),
              loginTypeOutlinedButton(size,
                  text: 'SIGN IN',
                  width: size.width * 0.75,
                  height: size.height * .063),
              SizedBox(
                height: size.height * .01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
