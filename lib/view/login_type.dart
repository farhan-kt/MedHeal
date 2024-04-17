import 'package:flutter/material.dart';
import 'package:medheal/view/login_widgets.dart';

class LoginTypeScreen extends StatelessWidget {
  const LoginTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 86, 185, 205)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/sign In.png',
                fit: BoxFit.cover,
                // height: size.height * .47,
              ),
              loginTypePoppinsText(text: 'Your health is our priority.'),
              loginTypePoppinsText(
                  text: 'Sign in to MedHeal and start your wellness journey.'),
              loginTypePoppinsText(
                  text: 'We are here to support you every step of the way'),
              SizedBox(height: size.height * .02),
              loginTypeOutlinedButton(size,
                  text: 'CREATE ACCOUNT',
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .17,
                      vertical: size.height * .017)),
              SizedBox(height: size.height * .025),
              loginTypeOutlinedButton(size,
                  text: 'SIGN IN',
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .27,
                      vertical: size.height * .016)),
            ],
          ),
        ),
      ),
    );
  }
}
