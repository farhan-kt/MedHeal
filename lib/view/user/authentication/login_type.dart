import 'package:flutter/material.dart';
import 'package:medheal/view/user/authentication/sign_in.dart';
import 'package:medheal/view/user/authentication/auth_widgets.dart';
import 'package:medheal/view/user/authentication/create_account.dart';

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
              loginTypeTexts(text: 'Your health is our priority.'),
              loginTypeTexts(
                  text: 'Sign in to MedHeal and start your wellness journey.'),
              loginTypeTexts(
                  text: 'We are here to support you every step of the way'),
              SizedBox(height: size.height * .05),
              loginTypeOutlinedButton(
                size,
                text: 'CREATE ACCOUNT',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * .025),
              loginTypeOutlinedButton(
                size,
                text: 'SIGN IN',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
              ),
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
