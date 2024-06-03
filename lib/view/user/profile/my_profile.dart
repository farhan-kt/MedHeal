import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/profile/profile_widgets.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/view/user/authentication/fill_profile.dart';

const double circleAvatarRadiusFraction = 0.18;

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 234, 234),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * .07, horizontal: size.width * .015),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
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
                              builder: (context) => FillProfileScreen()));
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
            Consumer<AuthenticationProvider>(builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .075),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: circleAvatarRadius,
                        backgroundColor:
                            const Color.fromARGB(255, 143, 189, 198),
                        backgroundImage: const AssetImage(
                            'assets/avatar-removebg-preview.png')),
                    SizedBox(height: size.height * .02),
                    userProfileDetailsListTile(context,
                        titleText: 'USER',
                        valueText: value.currentUser?.userName ?? 'unknown'),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: userProfileDetailsListTile(context,
                              titleText: 'AGE',
                              valueText: value.currentUser?.age ?? ''),
                        ),
                        SizedBox(
                          width: size.width * .1,
                        ),
                        Flexible(
                          child: userProfileDetailsListTile(context,
                              titleText: 'GENDER',
                              valueText: value.currentUser?.gender ?? ''),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    userProfileDetailsListTile(context,
                        titleText: 'PHONE',
                        valueText: '+91 ${value.currentUser?.phoneNumber}'),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    userProfileDetailsListTile(
                      context,
                      titleText: 'EMAIL',
                      valueText: value.currentUser?.email ?? 'unknown',
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
