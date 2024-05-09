import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/widgets/snackbar_widget.dart';
import '../../../controller/authentication_provider.dart';
import 'package:medheal/view/user/authentication/auth_widgets.dart';
import 'package:medheal/view/user/authentication/create_account.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        authProvider.clearSignInControllers();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      )),
                  TextButton(
                    onPressed: () {
                      authProvider.clearSignInControllers();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen(),
                        ),
                      );
                    },
                    child: poppinsHeadText(
                      text: 'Create Account',
                      fontSize: 19,
                      color: const Color(0xFF1995AD),
                    ),
                  )
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
                height: size.height * .27,
                child: Form(
                  key: authProvider.signInFormkey,
                  child: signInTextFormField(authProvider),
                ),
              ),
              SizedBox(height: size.height * .02),
              elevatedButtonWidget(
                  buttonHeight: size.height * .058,
                  buttonWidth: size.width * .9,
                  buttonText: 'Sign In',
                  onPressed: () async {
                    if (authProvider.signInFormkey.currentState!.validate()) {
                      authProvider.adminKey(context, SnackBarWidget(),
                          message: 'Incorrect email or password');
                    }
                  }),
              SizedBox(height: size.height * .04),
              Row(children: [
                const Flexible(
                  child: Divider(thickness: .8),
                ),
                poppinsText(
                    text: '  or continue with  ',
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                const Flexible(
                  child: Divider(thickness: 1),
                )
              ]),
              SizedBox(height: size.height * .03),
              authenticationBoxRow(size, context,
                  authenticationProvider: authProvider),
            ],
          ),
        ),
      ),
    );
  }
}
