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

const double circleAvatarRadiusFraction = 0.12;

class CancelledAppointments extends StatefulWidget {
  const CancelledAppointments({super.key});

  @override
  State<CancelledAppointments> createState() => _CancelledAppointmentsState();
}

class _CancelledAppointmentsState extends State<CancelledAppointments> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppointmentProvider>(context, listen: false)
          .getUserCanceledAppointments();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;

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

            List<AppointmentModel> canceledAppointments =
                appointmentProvider.canceledAppointmentList;

            if (canceledAppointments.isEmpty) {
              return Center(
                  child: poppinsHeadText(
                text: 'No canceled appointments',
                color: const Color(0xFF1995AD),
              ));
            }

            final doctorProvider =
                Provider.of<DoctorProvider>(context, listen: false);

            return ListView.builder(
              itemCount: canceledAppointments.length,
              itemBuilder: (context, index) {
                final appointment = canceledAppointments[index];
                return FutureBuilder<DoctorModel?>(
                  future: doctorProvider.getDoctorById(appointment.docId!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return loadingIndicator(size,
                          circleHeight: size.height * .15,
                          circleWidth: size.width * .3);
                    }
                    if (!snapshot.hasData) {
                      return const SizedBox.shrink();
                    }
                    final doctor = snapshot.data!;
                    return Column(
                      children: [
                        appointmentScheduledContainer(
                          size,
                          context,
                          circleAvatarRadius: circleAvatarRadius,
                          appointment: appointment,
                          doctor: doctor,
                          isUpcoming: false,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorDetailScreen(
                                          value: doctorProvider,
                                          userId: appointment.uId!,
                                          doctors: doctor,
                                        )));
                          },
                        ),
                        SizedBox(height: size.height * .02),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
