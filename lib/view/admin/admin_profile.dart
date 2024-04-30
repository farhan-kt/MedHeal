import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';
import 'package:medheal/view/user/authentication/login_type.dart';

const double circleAvatarRadiusFraction = 0.18;

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: circleAvatarRadius,
              backgroundColor: const Color(0xFFA1D6E2),
              backgroundImage:
                  const AssetImage('assets/avatar-removebg-preview.png'),
            ),
            SizedBox(height: size.height * .001),
            poppinsHeadText(
                text: 'MedHeal', color: const Color(0xFF1995AD), fontSize: 20),
            poppinsHeadText(
                textAlign: TextAlign.center,
                text: 'Kochi',
                color: const Color(0xFF888888),
                fontSize: 14),
            SizedBox(height: size.height * .03),
            profileScreenContainer(
              context,
              containerHeight: size.height * .25,
              containerWidth: size.width * .95,
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
