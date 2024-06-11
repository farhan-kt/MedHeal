import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/controller/appointment_provider.dart';
import 'package:medheal/model/appointment_model.dart';
import 'package:medheal/model/doctor_model.dart';
import 'package:medheal/view/user/user_widgets.dart';
import 'package:medheal/view/user/appointment/widgets_appointment.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

const double circleAvatarRadiusFraction = 0.1;

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    Provider.of<AppointmentProvider>(context, listen: false)
        .getUserAppointments();
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .02),
        child: Consumer<AppointmentProvider>(
          builder: (context, appointmentProvider, child) {
            if (appointmentProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            List<AppointmentModel> upcomingAppointments = appointmentProvider
                .allAppointmentList
                .where((appointment) =>
                    isAppointmentUpcoming(appointment.date!, appointment.time!))
                .toList();

            if (upcomingAppointments.isEmpty) {
              return Center(
                  child: poppinsHeadText(
                text: 'No upcoming appointments',
                color: const Color(0xFF1995AD),
              ));
            }
            // return ListView.builder(
            //   itemCount: upcomingAppointments.length,
            //   itemBuilder: (context, index) {
            //     final appointment = upcomingAppointments[index];
            //     final doctor = doctorProvider.getDoctorById(appointment.docId!);
            //     return Column(
            //       children: [
            //         appointmentScheduledContainer(size, context,
            //             circleAvatarRadius: circleAvatarRadius,
            //             appointment: appointment,
            //             doctor: doctor,
            //             isUpcoming: true, onPressed: () {
            //           showBottomSheet(
            //             context: context,
            //             builder: (context) {
            //               return showBottom(size, context);
            //             },
            //           );
            //         }),
            //         SizedBox(height: size.height * .02),
            //       ],
            //     );
            //   },
            // );
            return ListView.builder(
              itemCount: upcomingAppointments.length,
              itemBuilder: (context, index) {
                final appointment = upcomingAppointments[index];
                return FutureBuilder<DoctorModel?>(
                  future: doctorProvider.getDoctorById(appointment.docId!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final doctor = snapshot.data;
                      return Column(
                        children: [
                          appointmentScheduledContainer(size, context,
                              circleAvatarRadius: circleAvatarRadius,
                              appointment: appointment,
                              doctor: doctor!,
                              isUpcoming: true, onPressed: () {
                            showBottomSheet(
                              context: context,
                              builder: (context) {
                                return showBottom(size, context);
                              },
                            );
                          }),
                          SizedBox(height: size.height * .02),
                        ],
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  bool isAppointmentUpcoming(String appointmentDate, String appointmentTime) {
    List<String> timeParts = appointmentTime.split(RegExp(r'[:\s]'));
    int appointmentHour = int.parse(timeParts[0]);
    int appointmentMinute = int.parse(timeParts[1]);
    bool isPM = timeParts[2].toUpperCase() == 'PM';

    List<String> dateParts = appointmentDate.split('/');
    String formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';

    if (isPM && appointmentHour != 12) {
      appointmentHour += 12;
    } else if (!isPM && appointmentHour == 12) {
      appointmentHour = 0;
    }

    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int currentMinute = now.minute;

    DateTime currentDate = DateTime.now().toLocal();
    DateTime appointmentDateTime = DateTime.parse(formattedDate);
    if (appointmentDateTime.isAfter(currentDate) ||
        (appointmentDateTime.isAtSameMomentAs(currentDate) &&
            (appointmentHour > currentHour ||
                (appointmentHour == currentHour &&
                    appointmentMinute > currentMinute)))) {
      return true;
    } else {
      return false;
    }
  }
}
