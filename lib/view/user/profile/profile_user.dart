import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/view/user/profile/profile_widgets.dart';

const double circleAvatarRadiusFraction = 0.07;

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: poppinsText(
            text: 'My Profile',
            color: const Color(0xFF101828),
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              children: [
                CircleAvatar(
                    radius: circleAvatarRadius,
                    backgroundColor: const Color.fromARGB(255, 143, 189, 198),
                    backgroundImage:
                        const AssetImage('assets/avatar-removebg-preview.png')),
                SizedBox(width: size.width * .02),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      poppinsHeadText(
                        text: 'Farhan',
                        color: const Color(0xFF1D1617),
                        fontSize: 15,
                      ),
                      SizedBox(height: size.height * .008),
                      poppinsSmallText(
                        text: '12',
                        color: const Color(0xFF888888),
                      ),
                    ]),
              ],
            ),
            SizedBox(height: size.height * .03),
            userProfileScreenContainer(size,
                height: size.height * .13,
                width: size.width * .9,
                sizedBoxWidth: size.width * .02),
            SizedBox(height: size.height * .03),
            profileScreenContainer(context,
                containerHeight: size.height * .26,
                containerWidth: size.width * .9,
                isAdmin: false)
          ])),
    );
  }
}
