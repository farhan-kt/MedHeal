import 'package:flutter/material.dart';
import 'package:medheal/view/user/appointment/widgets_appointment.dart';

const double circleAvatarRadiusFraction = 0.1;

class CancelledAppointments extends StatelessWidget {
  const CancelledAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .02),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                appointmentScheduledContainer(size, context,
                    circleAvatarRadius: circleAvatarRadius, isUpcoming: false),
                SizedBox(height: size.height * .02),
              ],
            );
          },
        ),
      ),
    );
  }
}
