import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:medheal/view/user/home/home_widgets.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';
import 'package:provider/provider.dart';

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

Widget showBottom(size, context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<String> times = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
  ];
  return Container(
    height: size.height * .5,
    width: size.width * 1,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 183, 226, 235),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .05),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: poppinsHeadText(
                text: 'Reshedule',
                fontSize: 23,
                color: const Color(0xFF1995AD),
              ),
            ),
            SizedBox(height: size.height * .02),
            poppinsHeadText(text: 'Working information'),
            SizedBox(height: size.height * .02),
            Row(
              children: [
                const Icon(
                  EneftyIcons.calendar_2_outline,
                  color: Color(0xFF778293),
                ),
                SizedBox(width: size.width * .02),
                poppinsSmallText(
                    text: 'Monday-Friday, ', color: const Color(0xFF344154)),
                poppinsSmallText(
                    text: '08:00 AM - 21:00 PM',
                    color: const Color(0xFF344154)),
              ],
            ),
            SizedBox(height: size.height * .02),
            poppinsHeadText(text: 'Select Date'),
            SizedBox(height: size.height * .02),
            CustomTextFormField(
              controller: userProvider.userBookingResheduledController,
              hintText: 'Date',
              suffixIcon: const Icon(EneftyIcons.calendar_2_outline),
            ),
            SizedBox(height: size.height * .02),
            poppinsHeadText(
              text: 'Select Hour',
            ),
            SizedBox(height: size.height * .02),
            SizedBox(
                height: size.height * .2,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / .4,
                    crossAxisCount: 3,
                    crossAxisSpacing: size.width * 0.02,
                    mainAxisSpacing: size.height * 0.01,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    String time = times[index];
                    return SizedBox(
                      height: size.height * .0007,
                      width: size.width * .5,
                      child: doctorDetailsTimeButton(
                        onPressed: () {},
                        time: time,
                      ),
                    );
                  },
                )),
            SizedBox(height: size.height * .07),
            SizedBox(
              width: size.width * .9,
              height: size.height * .06,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1995AD),
                  ),
                  onPressed: () {
                    successDialogBox(context, size,
                        isAppointment: true,
                        headMessage: 'Your Appointment Has Been Resheduled',
                        elevatedButtonHeight: size.height * .05,
                        elevatedButtonWidth: size.width * .7,
                        height: size.height * .02,
                        width: size.width * .8,
                        dialogheight: size.height * .45,
                        dialogWidth: size.width * .2,
                        subText:
                            'Your appointment with Dr. Jennie Thorn was Resheduled on Wednesday, August 17, 2023 at 11:00 AM ');
                  },
                  child: poppinsText(
                      text: 'Reshedule Appointment',
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: size.height * .02),
          ],
        ),
      ),
    ),
  );
}
