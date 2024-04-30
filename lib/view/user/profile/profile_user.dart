import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';
import 'package:medheal/view/user/profile/profile_widgets.dart';
import 'package:medheal/view/user/authentication/login_type.dart';

const double circleAvatarRadiusFraction = 0.15;

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    final bottomProvider = Provider.of<BottomProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: poppinsHeadText(
          text: 'My Profile',
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CircleAvatar(
              radius: circleAvatarRadius,
              backgroundColor: const Color.fromARGB(255, 143, 189, 198),
              backgroundImage:
                  const AssetImage('assets/avatar-removebg-preview.png'),
            ),
            SizedBox(width: size.width * .02),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  poppinsHeadText(
                    text: 'Farhan',
                    color: const Color(0xFF1D1617),
                    fontSize: 15,
                  ),
                  SizedBox(height: size.height * .008),
                  poppinsSmallText(
                    text: 'farhan@gmail.com',
                    color: const Color(0xFF888888),
                  ),
                ]),
            SizedBox(height: size.height * .03),
            userProfileScreenContainer(size, context,
                height: size.height * .13,
                width: size.width * .9,
                sizedBoxWidth: size.width * .02),
            SizedBox(height: size.height * .03),
            profileScreenContainer(
              context,
              containerHeight: size.height * .26,
              containerWidth: size.width * .9,
              isAdmin: false,
              onTap: () {
                confirmationDialog(context, size,
                    dialogWidth: size.width * .4,
                    height: size.height * .015,
                    alertMessage: 'Are you sure to log out ?',
                    confirmText: 'log Out', onPressedConfirm: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginTypeScreen()),
                      (route) => false);
                  bottomProvider.adminOnTap(0);
                  bottomProvider.userOnTap(0);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
