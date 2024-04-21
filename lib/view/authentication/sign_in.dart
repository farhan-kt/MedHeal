import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';

import '../../controller/authentication_provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                    )),
                TextButton(
                    onPressed: () {},
                    child: poppinsText(
                        text: 'Create Account',
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1995AD)))
              ],
            ),
            SizedBox(height: size.height * .04),
            SizedBox(
              width: size.width * .73,
              height: size.height * .15,
              child: poppinsText(
                  text: 'Sign In to Your Account',
                  fontSize: 34,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * .02),
            SizedBox(
              height: size.height * .25,
              child: Form(
                key: authProvider.signInFormkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextFormField(
                      controller: authProvider.signInEmailPasswordController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      controller: authProvider.signInPasswordController,
                      hintText: 'Password',
                      suffixIcon: const Icon(EneftyIcons.eye_outline),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: poppinsText(
                            text: 'Forgot the password?',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1995AD))),
                  ],
                ),
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
                      text: 'Sign In',
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: size.height * .04),
            Row(children: [
              const Flexible(child: Divider(thickness: .8)),
              poppinsText(
                  text: '  or continue with  ',
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              const Flexible(child: Divider(thickness: 1))
            ]),
            SizedBox(height: size.height * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * .065,
                  width: size.width * .2,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 199, 212, 226)),
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
                      border: Border.all(
                          color: const Color.fromARGB(255, 199, 212, 226)),
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
            )
          ],
        ),
      ),
    );
  }
}
