import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget doctorDetailsTimeButton({onPressed, time}) {
  return OutlinedButton(
      onPressed: onPressed,
      child: poppinsText(
          textAlign: TextAlign.center,
          text: time,
          color: const Color(0xFF1995AD),
          fontSize: 14,
          fontWeight: FontWeight.w600));
}

appointmentDialogBox(
  context, {
  elevatedButtonHeight,
  elevatedButtonWidth,
  height,
  width,
  dialogheight,
  dialogWidth,
}) {
  final double avatarRadius = MediaQuery.of(context).size.width * 0.15;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: SizedBox(
          height: dialogheight,
          width: dialogWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(height: height),
              CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: const Color(0xFF1995AD),
                  backgroundImage:
                      const AssetImage('assets/avatar-removebg-preview.png')),
              SizedBox(height: height),
              poppinsText(
                  textAlign: TextAlign.center,
                  text: 'Your Appointment Has Been Confirmed',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1995AD)),
              SizedBox(height: height),
              SizedBox(
                width: width,
                child: poppinsText(
                    textAlign: TextAlign.center,
                    text:
                        'Your appointment with Dr. Jennie Thorn on Wednesday, August 17, 2023 at 11:00 AM',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF101828)),
              ),
              SizedBox(height: height),
              SizedBox(
                height: elevatedButtonHeight,
                width: elevatedButtonWidth,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1995AD),
                    ),
                    onPressed: () {},
                    child: poppinsText(
                        text: 'OK',
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            ]),
          ),
        ));
      });
}
