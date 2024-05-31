import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/view/user/authentication/fill_profile.dart';
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
    final authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final firebaseauth = FirebaseAuth.instance.currentUser;
    ImageProvider? imageprovider;
    if (firebaseauth != null && firebaseauth.photoURL != null) {
      imageprovider = NetworkImage(firebaseauth.photoURL.toString());
    } else {
      imageprovider = const AssetImage("assets/avatar-removebg-preview.png");
    }
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.1, horizontal: size.width * .03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                poppinsHeadText(
                  text: 'My Profile',
                  fontSize: 20,
                ),
                SizedBox(
                  height: size.height * .041,
                  width: size.width * .2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1995AD),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FillProfileScreen()));
                    },
                    child: poppinsText(
                      text: 'Edit',
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: circleAvatarRadius,
              backgroundColor: const Color.fromARGB(255, 143, 189, 198),
              backgroundImage: imageprovider,
            ),
            SizedBox(width: size.width * .02),
            Consumer<AuthenticationProvider>(
              builder: (context, value, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    poppinsHeadText(
                      text: value.currentUser?.userName ?? 'Unknown',
                      color: const Color(0xFF1D1617),
                      fontSize: 15,
                    ),
                    SizedBox(height: size.height * .008),
                    poppinsHeadText(
                      text: value.currentUser?.email ?? 'unknown',
                      fontSize: 15,
                      color: const Color(0xFF888888),
                    ),
                  ]),
            ),
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
                  authenticationProvider.logOut();
                  authenticationProvider.googleSignOut();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
