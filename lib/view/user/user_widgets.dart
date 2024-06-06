import 'package:flutter/material.dart';
import 'package:medheal/payment.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:medheal/view/user/home/home_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';

successDialogBox(context, Size size,
    {elevatedButtonHeight,
    elevatedButtonWidth,
    height,
    width,
    doctorName,
    bookingTime,
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
            child: Column(
              children: [
                SizedBox(height: height),
                CircleAvatar(
                  radius: size.width * .15,
                  backgroundColor: const Color(0xFF1995AD),
                  backgroundImage:
                      const AssetImage('assets/avatar-removebg-preview.png'),
                ),
                SizedBox(height: height),
                poppinsHeadText(
                  textAlign: TextAlign.center,
                  text: headMessage,
                  fontSize: 20,
                  color: const Color(0xFF1995AD),
                ),
                if (!isAppointment!) ...[
                  SizedBox(height: height),
                  SizedBox(
                    width: width,
                    child: poppinsText(
                      textAlign: TextAlign.center,
                      text: subText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF101828),
                    ),
                  ),
                ],
                SizedBox(height: height),
                isAppointment
                    ? Column(
                        children: [
                          elevatedButtonWidget(
                              buttonHeight: elevatedButtonHeight,
                              buttonWidth: elevatedButtonWidth,
                              onPressed: () {
                                appointmentDialogBox(context, size,
                                    doctorName: doctorName,
                                    bookingTime: bookingTime);
                              },
                              buttonText: 'Direct Pay'),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          elevatedButtonWidget(
                              buttonHeight: elevatedButtonHeight,
                              buttonWidth: elevatedButtonWidth,
                              onPressed: () {
                                int amount = 20000;
                                RazorPay razorPayInstance = RazorPay();
                                razorPayInstance.razorPay(amount.toString());
                              },
                              buttonText: 'Payment'),
                        ],
                      )
                    : elevatedButtonWidget(
                        buttonHeight: size.height * .06,
                        buttonText: 'OK',
                        buttonWidth: size.width * .5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
              ],
            ),
          ),
        ),
      );
    },
  );
}

appointmentDialogBox(routeContext, Size size, {doctorName, bookingTime}) {
  return showDialog(
    context: routeContext,
    builder: (context) {
      return AlertDialog(
        title: SizedBox(
          height: size.height * .43,
          width: size.width * .2,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: size.height * .02),
                CircleAvatar(
                  radius: size.width * .15,
                  backgroundColor: const Color(0xFF1995AD),
                  backgroundImage:
                      const AssetImage('assets/avatar-removebg-preview.png'),
                ),
                SizedBox(height: size.height * .02),
                poppinsHeadText(
                  textAlign: TextAlign.center,
                  text: 'Your Appointment Has Been Confirmed',
                  fontSize: 20,
                  color: const Color(0xFF1995AD),
                ),
                SizedBox(height: size.height * .02),
                SizedBox(
                  width: size.width * .8,
                  child: poppinsText(
                    textAlign: TextAlign.center,
                    text:
                        'Your appointment with Dr. $doctorName on Wednesday, August 17, 2023 at $bookingTime  ',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF101828),
                  ),
                ),
                SizedBox(height: size.height * .02),
                elevatedButtonWidget(
                    buttonHeight: size.height * .05,
                    buttonWidth: size.width * .7,
                    onPressed: () {
                      Navigator.pop(routeContext);
                      Navigator.pop(routeContext);
                    },
                    buttonText: 'OK')
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget showBottom(Size size, context) {
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
  return Stack(children: [
    Container(
      height: size.height * .6,
      width: size.width * 1,
      decoration: const BoxDecoration(
        color: Color(0xFFA1D6E2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
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
                    text: 'Monday-Friday, ',
                    color: const Color(0xFF344154),
                  ),
                  poppinsSmallText(
                    text: '08:00 AM - 21:00 PM',
                    color: const Color(0xFF344154),
                  ),
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
                height: size.height * .22,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
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
                      height: size.height * .01,
                      width: size.width * .5,
                      child: doctorDetailsTimeButton(
                        onPressed: () {},
                        time: time,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * .07),
              SizedBox(height: size.height * .02),
            ],
          ),
        ),
      ),
    ),
    Positioned(
      bottom: size.height * .01,
      left: size.width * .08,
      child: Row(
        children: [
          elevatedButtonWidget(
              buttonHeight: size.height * .06,
              buttonWidth: size.width * .22,
              bgColor: const Color(0xFF1995AD),
              buttonText: 'Back',
              onPressed: () {
                Navigator.pop(context);
              }),
          SizedBox(
            width: size.width * .02,
          ),
          elevatedButtonWidget(
            buttonHeight: size.height * .06,
            buttonWidth: size.width * .65,
            bgColor: const Color(0xFF1995AD),
            buttonText: 'Reshedule Appointment',
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
          ),
        ],
      ),
    )
  ]);
}
