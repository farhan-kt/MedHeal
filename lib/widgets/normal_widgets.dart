import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/home/doctor_detail_screen.dart';

Widget allDoctorsContainer(Size size, context,
    {bool? isAdmin, circleAvatarRadius}) {
  return isAdmin == true
      ? Container(
          height: size.height * .16,
          width: size.width * .93,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(
              color: const Color(0xFFFFFFFF),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: size.height * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: circleAvatarRadius,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      const AssetImage('assets/avatar-removebg-preview.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    poppinsHeadText(
                      text: 'Dr. Jennie Thorn',
                      color: const Color(0xFF1D1617),
                      fontSize: 14,
                    ),
                    Row(children: [
                      poppinsSmallText(
                        text: 'Dentist | ',
                      ),
                      poppinsSmallText(
                        text: 'BDS Surgeon',
                      )
                    ]),
                    poppinsSmallText(
                      text: '5Y+ Experience',
                    )
                  ],
                ),
                SizedBox(width: size.width * .1),
                IconButton(
                  onPressed: () {
                    confirmationDialog(
                      context,
                      size,
                      dialogheight: size.height * .12,
                      alertMessage: 'Confirm to delete the doctor',
                      confirmText: 'Delete',
                      onPressedConfirm: () {},
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Color(0xFFF24E1E),
                  ),
                )
              ],
            ),
          ),
        )
      : GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DoctorDetailScreen()));
          },
          child: Container(
            height: size.height * .16,
            width: size.width * .93,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              border: Border.all(
                color: const Color(0xFFFFFFFF),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: size.height * .03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: circleAvatarRadius,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        const AssetImage('assets/avatar-removebg-preview.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      poppinsHeadText(
                        text: 'Dr. Jennie Thorn',
                        color: const Color(0xFF1D1617),
                        fontSize: 14,
                      ),
                      Row(children: [
                        poppinsSmallText(
                          text: 'Dentist | ',
                        ),
                        poppinsSmallText(
                          text: 'BDS Surgeon',
                        )
                      ]),
                      poppinsSmallText(
                        text: '5Y+ Experience',
                      )
                    ],
                  ),
                  SizedBox(width: size.width * .1),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      EneftyIcons.heart_outline,
                      size: 28,
                      color: Color(0xFF1995AD),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
}

Widget elevatedButtonWidget(
    {onPressed,
    double? buttonHeight,
    double? buttonWidth,
    String? buttonText,
    bgColor,
    shape}) {
  return SizedBox(
    height: buttonHeight,
    width: buttonWidth,
    child: ElevatedButton(
      style: ButtonStyle(
        shape: shape,
        backgroundColor: MaterialStateProperty.all(
          bgColor ?? const Color(0xFF1995AD),
        ),
      ),
      onPressed: onPressed,
      child: poppinsHeadText(
        text: buttonText ?? 'Button',
        textAlign: TextAlign.center,
        color: Colors.white,
      ),
    ),
  );
}

Widget profileContainerListTile(BuildContext context,
    {required String title,
    bool? suffixIcon,
    onTap,
    required IconData icon,
    Color? iconColor}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: size.width * .02),
          poppinsSmallText(
            text: title,
          )
        ]),
        suffixIcon ?? false
            ? const Icon(Icons.arrow_forward_ios_rounded,
                color: Color(0xFF888888))
            : const SizedBox()
      ],
    ),
  );
}

Widget profileScreenContainer(context,
    {required containerHeight,
    required containerWidth,
    required bool? isAdmin,
    required onTap}) {
  return Container(
    height: containerHeight,
    width: containerWidth,
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
        poppinsHeadText(text: 'Others'),
        profileContainerListTile(context,
            title: 'About Us',
            suffixIcon: true,
            icon: EneftyIcons.info_circle_outline,
            iconColor: const Color(0xFF1995AD)),
        isAdmin!
            ? const SizedBox()
            : profileContainerListTile(context,
                title: 'Customer Service',
                suffixIcon: true,
                icon: EneftyIcons.headphone_outline,
                iconColor: const Color(0xFF1995AD)),
        profileContainerListTile(context,
            title: 'Log Out',
            suffixIcon: false,
            icon: EneftyIcons.logout_outline,
            iconColor: Colors.red,
            onTap: onTap),
      ],
    ),
  );
}

Widget doctorDetailsShowingContainer(context, size, {width}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DoctorDetailScreen()));
    },
    child: Container(
      height: size.height * .16,
      width: width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 193, 225, 234),
          border: Border.all(color: const Color.fromARGB(255, 199, 212, 226)),
          borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: size.height * .03),
        child: Row(children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/avatar-removebg-preview.png'),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                poppinsHeadText(
                  text: 'Dr. Jennie Thorn',
                  color: const Color(0xFF1D1617),
                  fontSize: 14,
                ),
                poppinsText(
                    text: 'Dentist',
                    color: const Color(0xFF101828),
                    fontSize: 12),
                Row(
                  children: [
                    Icon(
                      EneftyIcons.location_outline,
                      size: size.width * .048,
                      color: const Color(0xFF1995AD),
                    ),
                    poppinsText(
                        text: 'Royal Hospital, kerala',
                        color: const Color(0xFF101828),
                        fontSize: 12),
                  ],
                ),
              ])
        ]),
      ),
    ),
  );
}

confirmationDialog(
  context,
  size, {
  elevatedButtonHeight,
  elevatedButtonWidth,
  height,
  width,
  dialogheight,
  dialogWidth,
  alertMessage,
  subText,
  required confirmText,
  onPressedConfirm,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: SizedBox(
          height: dialogheight,
          width: dialogWidth,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height),
                poppinsText(
                  textAlign: TextAlign.center,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  text: alertMessage,
                  color: Colors.black,
                ),
                SizedBox(height: height),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: poppinsHeadText(
                          text: 'Back', color: const Color(0xFF1995AD))),
                  TextButton(
                    onPressed: onPressedConfirm,
                    child: poppinsHeadText(
                      text: confirmText,
                      color: Colors.red,
                    ),
                  ),
                ])
              ]),
        ));
      });
}
