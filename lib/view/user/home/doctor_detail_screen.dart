import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/user_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:medheal/view/user/home/home_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        title: poppinsText(
            text: 'Dr. Jennie Thorn',
            color: const Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(EneftyIcons.heart_outline),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.035, vertical: size.height * 0.02),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              doctorDetailsShowingContainer(context, size,
                  width: size.width * .915),
              SizedBox(height: size.height * .03),
              doctorDetailsExperienceRow(size),
              SizedBox(height: size.height * .03),
              poppinsHeadText(text: 'About me'),
              SizedBox(height: size.height * .02),
              SizedBox(
                child: poppinsSmallText(
                    text:
                        'Dr. Jennie Thorn is the most immunologists specialist in Royal Hospital at Phnom penh. She achieved several awards for her wonderful contributing in medical field',
                    color: const Color(0xFF344154)),
              ),
              SizedBox(height: size.height * .03),
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
                controller: userProvider.userBookingDateController,
                hintText: 'Appointment Date',
                suffixIcon: const Icon(EneftyIcons.calendar_2_outline),
              ),
              SizedBox(height: size.height * .02),
              poppinsHeadText(
                text: 'Select Hour',
              ),
              SizedBox(height: size.height * .02),
              SizedBox(
                height: size.height * .1,
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
                ),
              ),
              SizedBox(height: size.height * .04),
              elevatedButtonWidget(
                  buttonHeight: size.height * .06,
                  buttonWidth: size.width * .9,
                  buttonText: 'BOOK APPOINTMENT',
                  onPressed: () {
                    successDialogBox(context, size,
                        isAppointment: true,
                        headMessage: 'Your Appointment Has Been Confirmed',
                        elevatedButtonHeight: size.height * .05,
                        elevatedButtonWidth: size.width * .7,
                        height: size.height * .02,
                        width: size.width * .8,
                        dialogheight: size.height * .45,
                        dialogWidth: size.width * .2,
                        subText:
                            'Your appointment with Dr. Jennie Thorn on Wednesday, August 17, 2023 at 11:00 AM  ');
                  }),
              SizedBox(height: size.height * .02),
            ],
          ),
        ),
      ),
    );
  }
}
