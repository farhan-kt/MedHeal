import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/view/user/home/category.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/user_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/view/user/profile/favourite_doctors.dart';
import 'package:provider/provider.dart';

Widget homeCategoryAvatar(context, imagePath, {category, circleRadius}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryScreen(category: category)));
    },
    child: Column(
      children: [
        CircleAvatar(
          radius: circleRadius,
          backgroundColor:
              const Color.fromARGB(255, 101, 176, 191).withOpacity(0.5),
          child: ClipOval(
            child: Center(
              child: SizedBox(
                width: 40,
                height: 47,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        poppinsText(
          text: category,
          fontSize: 14,
          color: const Color(0xFF101828),
        )
      ],
    ),
  );
}

Widget doctorDetailsExperienceContainer(
    {height, width, valueText, headText, bool rating = false}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 245, 241, 241),
      ),
      borderRadius: BorderRadius.circular(18),
      color: const Color.fromARGB(255, 245, 241, 241),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          poppinsHeadText(
            textAlign: TextAlign.center,
            text: valueText,
            color: const Color(0xFF1995AD),
            fontSize: 14,
          ),
          const SizedBox(width: 2),
          if (rating)
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            )
        ]),
        poppinsSmallText(
          textAlign: TextAlign.center,
          text: headText,
          color: const Color(0xFF778293),
        ),
      ],
    ),
  );
}

Widget homeCategory(
  context,
  Size size, {
  circleAvatarRadius,
}) {
  return SizedBox(
    height: size.height * .275,
    width: size.width * .9,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homeCategoryAvatar(
              context,
              'assets/users.png',
              category: 'General',
              circleRadius: circleAvatarRadius,
            ),
            homeCategoryAvatar(context, 'assets/tooth.png',
                category: 'Dentist', circleRadius: circleAvatarRadius),
            homeCategoryAvatar(context, 'assets/ear.png',
                category: 'Otology', circleRadius: circleAvatarRadius),
            homeCategoryAvatar(context, 'assets/eye.png',
                category: 'Cardiology', circleRadius: circleAvatarRadius),
          ],
        ),
        SizedBox(height: size.height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homeCategoryAvatar(context, 'assets/small-intestine.png',
                category: 'Intestine', circleRadius: circleAvatarRadius),
            homeCategoryAvatar(context, 'assets/pediatrics.png',
                category: 'Pediatric', circleRadius: circleAvatarRadius),
            homeCategoryAvatar(context, 'assets/herbal-treatment.png',
                category: 'Herbal', circleRadius: circleAvatarRadius),
            homeCategoryAvatar(context, 'assets/more.png',
                category: 'More', circleRadius: circleAvatarRadius),
          ],
        ),
      ],
    ),
  );
}

Widget homeAppBar(Size size, context) {
  final firebaseauth = FirebaseAuth.instance.currentUser;
  ImageProvider? imageprovider;
  if (firebaseauth != null && firebaseauth.photoURL != null) {
    imageprovider = NetworkImage(firebaseauth.photoURL.toString());
  } else {
    imageprovider = const AssetImage("assets/avatar-removebg-preview.png");
  }
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    SizedBox(
      child: Consumer<AuthenticationProvider>(
        builder: (context, value, child) {
          return Row(
            children: [
              CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color.fromARGB(255, 143, 189, 198),
                  backgroundImage: value.currentUser?.image != null
                      ? NetworkImage(value.currentUser?.image ?? '')
                      : imageprovider),
              SizedBox(width: size.width * .02),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                poppinsSmallText(
                  text: 'Welcome',
                  color: const Color.fromARGB(255, 155, 141, 143),
                ),
                poppinsHeadText(
                  text: value.currentUser?.userName!.toUpperCase() ?? 'unknown',
                  color: const Color(0xFF1D1617),
                  fontSize: 14,
                ),
              ]),
            ],
          );
        },
      ),
    ),
    SizedBox(
      child: Row(children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(EneftyIcons.notification_bing_outline),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavouriteDoctorsScreen(),
              ),
            );
          },
          icon: const Icon(EneftyIcons.heart_outline),
        ),
      ]),
    ),
  ]);
}

Widget homeUpcomingAppointment(Size size, context) {
  return Container(
    height: size.height * .19,
    width: size.width * .88,
    decoration: BoxDecoration(
        color: const Color(0xFF1995AD),
        border: Border.all(color: const Color.fromARGB(255, 199, 212, 226)),
        borderRadius: BorderRadius.circular(18)),
    child: Padding(
      padding: EdgeInsets.only(
        top: size.height * .01,
        bottom: size.height * .01,
        left: size.width * .014,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFFFFFFF),
            backgroundImage: AssetImage('assets/avatar-removebg-preview.png'),
          ),
          title: poppinsHeadText(
            text: 'DR Farhan',
            color: const Color(0xFFFFFFFF),
            fontSize: 14,
          ),
          subtitle: Row(children: [
            poppinsSmallText(
              text: 'Dentist | ',
              color: const Color(0xFFFFFFFF),
            ),
            poppinsSmallText(
              text: 'BDS',
              color: const Color(0xFFFFFFFF),
            ),
          ]),
          trailing: PopupMenuButton(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
              color: const Color(0xFFA1D6E2),
              onSelected: (value) {
                if (value == 'reshedule') {
                } else if (value == 'cancel') {}
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      onTap: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) {
                            return showBottom(size, context);
                          },
                        );
                      },
                      child:
                          poppinsText(text: 'Reshedule', color: Colors.black),
                      value: 'reshedule'),
                  PopupMenuItem(
                      onTap: () {
                        confirmationDialog(context, size,
                            dialogWidth: size.width * .6,
                            dialogheight: size.height * .16,
                            height: size.height * .02,
                            alertMessage:
                                'Are You Sure to cancel your Appointment ?',
                            confirmText: 'Confirm',
                            onPressedConfirm: () {});
                      },
                      child: poppinsText(
                          text: 'Cancel Booking', color: Colors.black),
                      value: 'cancel'),
                ];
              }),
        ),
        Row(children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * .02),
            child: Container(
              height: size.height * .055,
              width: size.width * .35,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 24, 130, 151),
                ),
                borderRadius: BorderRadius.circular(18),
                color: const Color.fromARGB(255, 24, 130, 151),
              ),
              child: Row(children: [
                SizedBox(width: size.width * .02),
                Image.asset('assets/home calendar.png'),
                SizedBox(width: size.width * .002),
                poppinsText(
                  text: 'Sep 10, 2023',
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFFFFFF),
                )
              ]),
            ),
          ),
          SizedBox(width: size.width * .05),
          Container(
            height: size.height * .055,
            width: size.width * .28,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 24, 130, 151),
              ),
              borderRadius: BorderRadius.circular(18),
              color: const Color.fromARGB(255, 24, 130, 151),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/home time.png',
                    height: size.width * .06,
                    width: size.width * .06,
                  ),
                  poppinsText(
                      text: '05:00 PM',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF))
                ]),
          ),
        ])
      ]),
    ),
  );
}

Widget doctorDetailsTimeButton({
  VoidCallback? onPressed,
  time,
  required bool isSelected,
}) {
  Color buttonColor = isSelected ? Colors.black : Color(0xFF1995AD);
  return OutlinedButton(
    style: ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(color: buttonColor, width: 1.2),
      ),
    ),
    onPressed: onPressed,
    child: poppinsHeadText(
      textAlign: TextAlign.center,
      text: time,
      color: buttonColor,
      fontSize: 14,
    ),
  );
}

Widget doctorDetailsExperienceRow(Size size, {patient, experience, rating}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    doctorDetailsExperienceContainer(
        height: size.height * .07,
        width: size.width * .27,
        valueText: patient,
        headText: 'Patients'),
    SizedBox(width: size.width * .04),
    doctorDetailsExperienceContainer(
        height: size.height * .07,
        width: size.width * .27,
        valueText: '$experience Yrs',
        headText: 'Experience'),
    SizedBox(width: size.width * .04),
    doctorDetailsExperienceContainer(
        rating: true,
        height: size.height * .07,
        width: size.width * .27,
        valueText: rating.toString(),
        headText: 'Rating'),
  ]);
}
