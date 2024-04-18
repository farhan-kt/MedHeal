import 'package:flutter/material.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                    )),
                TextButton(
                    onPressed: () {},
                    child: poppinsText(
                        text: 'Sign In',
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1995AD)))
              ],
            ),
            SizedBox(height: size.height * .04),
            SizedBox(
              width: size.width * .6,
              height: size.height * .15,
              child: poppinsText(
                  text: 'Create Your Account',
                  fontSize: 34,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * .02),
            CustomTextFormField(
              controller: authProvider.userNameController,
              hintText: 'User Name',
              height: size.height * 0.09,
            )
          ],
        ),
      ),
    );
  }
}
