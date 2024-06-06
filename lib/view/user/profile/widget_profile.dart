import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/view/user/profile/my_profile.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/profile/favourite_doctors.dart';

Widget userProfileScreenContainer(size, context,
    {required height,
    required width,
    sizedBoxWidth,
    required value,
    required imageProvider}) {
  return Container(
    height: height,
    width: width,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        color: const Color(0xFFFFFFFF),
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        poppinsHeadText(text: 'Settings'),
        profileContainerListTile(context,
            title: 'My Profile',
            icon: EneftyIcons.profile_outline,
            suffixIcon: true, onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileDetailsScreen(
                        value: value,
                        imageProvider: imageProvider,
                      )));
        }, iconColor: const Color(0xFF1995AD)),
        profileContainerListTile(context,
            title: "Favourite Doctor's",
            icon: EneftyIcons.heart_outline,
            iconColor: Colors.red,
            suffixIcon: true, onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavouriteDoctorsScreen(),
            ),
          );
        })
      ],
    ),
  );
}

Widget userProfileDetailsListTile(context, {titleText, required valueText}) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    height: size.height * .09,
    width: size.width * .85,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        poppinsText(text: titleText, fontSize: 14, fontWeight: FontWeight.w500),
        const SizedBox(
          height: 2,
        ),
        Container(
          height: size.height * .06,
          width: size.width * .8,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(
              color: const Color(0xFFFFFFFF),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: poppinsHeadText(text: valueText),
        ),
      ],
    ),
  );
}
