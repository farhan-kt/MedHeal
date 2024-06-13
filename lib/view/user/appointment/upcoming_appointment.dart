import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/model/doctor_model.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/user_widgets.dart';
import 'package:medheal/model/appointment_model.dart';
import 'package:medheal/helper/loading_indicator.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/controller/appointment_provider.dart';
import 'package:medheal/view/user/appointment/widgets_appointment.dart';

const double circleAvatarRadiusFraction = 0.117;

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({super.key});

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppointmentProvider>(context, listen: false)
          .getUserAppointments();
    });
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext localContext) {
    Size size = MediaQuery.of(localContext).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    final doctorProvider =
        Provider.of<DoctorProvider>(localContext, listen: false);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .02),
        child: Consumer<AppointmentProvider>(
          builder: (context, appointmentProvider, child) {
            if (appointmentProvider.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF1995AD)));
            }
            List<AppointmentModel> upcomingAppointments = appointmentProvider
                .allAppointmentList
                .where((appointment) =>
                    isAppointmentUpcoming(
                        appointment.date!, appointment.time!) &&
                    (appointment.status == null ||
                        appointment.status != 'canceled'))
                .toList();

            if (upcomingAppointments.isEmpty) {
              return Center(
                  child: poppinsHeadText(
                text: 'No upcoming appointments',
                color: const Color(0xFF1995AD),
              ));
            }
            return ListView.builder(
              itemCount: upcomingAppointments.length,
              itemBuilder: (context, index) {
                final appointment = upcomingAppointments[index];
                return FutureBuilder<DoctorModel?>(
                  future: doctorProvider.getDoctorById(appointment.docId!),
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
                          appointmentScheduledContainer(size, localContext,
                              circleAvatarRadius: circleAvatarRadius,
                              appointment: appointment,
                              doctor: doctor!,
                              isUpcoming: true, onPressed: () {
                            showBottomSheet(
                              context: localContext,
                              builder: (context) {
                                return showBottom(size, localContext,
                                    appointment: appointment, doctor: doctor);
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
