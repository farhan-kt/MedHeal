import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:medheal/view/user/home/doctor_detail_screen.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/home/home_widgets.dart';

const double circleAvatarRadiusFraction = 0.091;

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 240, 242),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .042, vertical: size.height * 0.01),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              homeAppBar(size),
              SizedBox(height: size.height * .02),
              homeUpcomingSchedule(size),
              SizedBox(height: size.height * .02),
              poppinsHeadText(
                text: 'Doctor Speciality',
              ),
              SizedBox(height: size.height * .01),
              homeCategory(context, size,
                  circleAvatarRadius: circleAvatarRadius),
              SizedBox(height: size.height * .01),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                poppinsHeadText(text: 'Top Doctors'),
                TextButton(
                    onPressed: () {},
                    child: poppinsHeadText(
                        text: 'SEE ALL',
                        fontSize: 14,
                        color: const Color(0xFF1995AD)))
              ]),
              SizedBox(height: size.height * .01),
              homeTopDoctors(context, size),
              SizedBox(height: size.height * .02),
              homeTopDoctors(context, size)
            ]),
          ),
        ),
      ),
    );
  }
}
