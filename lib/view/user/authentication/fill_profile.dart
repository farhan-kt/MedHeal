import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/view/user/authentication/auth_widgets.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: interHeadText(
          text: 'Fill Profile',
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  radius: 80,
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
              height: size.height * .5,
              child: Form(
                  key: authProvider.fillAccountFormkey,
                  child: profileFillFields(size, authProvider)),
            ),
            SizedBox(height: size.height * .02),
            SizedBox(
              width: size.width * .9,
              height: size.height * .058,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1995AD)),
                  onPressed: () {
                    if (authProvider.fillAccountFormkey.currentState!
                        .validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserBottomBar()),
                          (route) => false);
                    }
                    //  successDialogBox(context, size,
                    //     isAppointment: false,
                    //     headMessage: 'Congratulations!',
                    //     height: size.height * .02,
                    //     width: size.width * .8,
                    //     dialogheight: size.height * .4,
                    //     dialogWidth: size.width * .2,
                    //     subText:
                    //         'Your account is ready to use. You will be redirected to the home Page in a few seconds...');
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
