import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medheal/view/user/appointment/cancelled_appointment.dart';
import 'package:medheal/view/user/appointment/completed_appointment.dart';
import 'package:medheal/view/user/appointment/upcoming_appointment.dart';
import 'package:medheal/widgets/text_widgets.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          title: poppinsText(
              text: 'My Appointment',
              color: const Color(0xFF101828),
              fontSize: 20,
              fontWeight: FontWeight.w600),
          bottom: TabBar(
              labelColor: Color(0xFF1995AD),
              unselectedLabelColor: Color(0xFF778293),
              labelStyle:
                  GoogleFonts.poppins(fontSize: 14, color: Color(0xFFC778293)),
              indicatorColor: Color(0xFF1995AD),
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: 'Upcoming',
                ),
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Cancelled',
                ),
              ]),
        ),
        body: TabBarView(children: [
          UpcomingAppointments(),
          CompletedAppointments(),
          CancelledAppointments()
        ]),
      ),
    );
  }
}
