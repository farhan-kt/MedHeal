import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/model/doctor_model.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/model/appointment_model.dart';
import 'package:medheal/helper/loading_indicator.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/controller/appointment_provider.dart';
import 'package:medheal/view/user/home/doctor_detail_screen.dart';
import 'package:medheal/view/user/appointment/widgets_appointment.dart';

const double circleAvatarRadiusFraction = 0.1;

class CompletedAppointments extends StatelessWidget {
  const CompletedAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .02),
        child: Consumer<AppointmentProvider>(
          builder: (context, appointmentProvider, child) {
            if (appointmentProvider.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xFF1995AD),
              ));
            }
            List<AppointmentModel> completedAppointments = appointmentProvider
                .allAppointmentList
                .where((appointment) => isAppointmentCompleted(
                    appointment.date!, appointment.time!))
                .toList();
            if (completedAppointments.isEmpty) {
              return Center(
                  child: poppinsHeadText(
                text: 'No completed appointments',
                color: const Color(0xFF1995AD),
              ));
            }
            return ListView.builder(
              itemCount: completedAppointments.length,
              itemBuilder: (context, index) {
                final appointments = completedAppointments[index];
                return FutureBuilder<DoctorModel?>(
                  future: doctorProvider.getDoctorById(appointments.docId!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return loadingIndicator(size,
                          circleHeight: size.height * .15,
                          circleWidth: size.width * .3);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final doctor = snapshot.data;
                      return Column(
                        children: [
                          appointmentScheduledContainer(size, context,
                              circleAvatarRadius: circleAvatarRadius,
                              appointment: appointments,
                              doctor: doctor!,
                              isUpcoming: false, onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorDetailScreen(
                                          value: doctorProvider,
                                          userId: appointments.uId!,
                                          doctors: doctor,
                                        )));
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

  bool isAppointmentCompleted(String appointmentDate, String appointmentTime) {
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
    // DateTime currentDate = DateTime(now.year, now.month, now.day);
    DateTime appointmentDateTime = DateTime.parse(formattedDate)
        .add(Duration(hours: appointmentHour, minutes: appointmentMinute));

    return appointmentDateTime.isBefore(now);
  }
}
