import 'package:flutter/material.dart';
import 'package:medheal/view/user/appointment/appointment_widgets.dart';

const double circleAvatarRadiusFraction = 0.1;

class CompletedAppointments extends StatelessWidget {
  const CompletedAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .02),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              appointmentBookingContainer(size,
                  circleAvatarRadius: circleAvatarRadius, isUpcoming: false),
              SizedBox(height: size.height * .02),
              appointmentBookingContainer(size,
                  circleAvatarRadius: circleAvatarRadius, isUpcoming: false),
              SizedBox(height: size.height * .02),
              appointmentBookingContainer(size,
                  circleAvatarRadius: circleAvatarRadius, isUpcoming: false),
            ],
          ),
        ),
      ),
    );
  }
}
