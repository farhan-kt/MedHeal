import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medheal/view/user/profile/favourite_doctors.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget userProfileScreenContainer(size, context,
    {required height, required width, sizedBoxWidth}) {
  return Container(
    height: height,
    width: width,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(color: const Color(0xFFFFFFFF)),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          poppinsHeadText(text: 'Settings'),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteDoctorsScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const Icon(
                    EneftyIcons.heart_outline,
                    color: Color(0xFF1995AD),
                  ),
                  SizedBox(width: sizedBoxWidth),
                  poppinsSmallText(
                    text: "Favourite Doctor's",
                  )
                ]),
                const Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF888888))
              ],
            ),
          )
        ]),
  );
}
