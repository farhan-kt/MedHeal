import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';

successDialogBox(context, size,
    {elevatedButtonHeight,
    elevatedButtonWidth,
    height,
    width,
    dialogheight,
    dialogWidth,
    headMessage,
    subText,
    required bool? isAppointment}) {
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
                  radius: size.width * .15,
                  backgroundColor: const Color(0xFF1995AD),
                  backgroundImage:
                      const AssetImage('assets/avatar-removebg-preview.png')),
              SizedBox(height: height),
              poppinsHeadText(
                  textAlign: TextAlign.center,
                  text: headMessage,
                  fontSize: 20,
                  color: const Color(0xFF1995AD)),
              SizedBox(height: height),
              SizedBox(
                width: width,
                child: poppinsText(
                    textAlign: TextAlign.center,
                    text: subText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF101828)),
              ),
              SizedBox(height: height),
              isAppointment!
                  ? SizedBox(
                      height: elevatedButtonHeight,
                      width: elevatedButtonWidth,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1995AD),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserBottomBar()));
                          },
                          child: poppinsText(
                              text: 'OK',
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    )
                  : const CircularProgressIndicator(
                      color: Color(0xFF1995AD),
                    )
            ]),
          ),
        ));
      });
}
