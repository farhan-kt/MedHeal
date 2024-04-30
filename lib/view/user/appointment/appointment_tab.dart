// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/view/user/appointment/upcoming_appointment.dart';
import 'package:medheal/view/user/appointment/completed_appointment.dart';
import 'package:medheal/view/user/appointment/cancelled_appointment.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          title: poppinsHeadText(
            text: 'My Appointment',
            fontSize: 20,
          ),
          bottom: TabBar(
              labelColor: const Color(0xFF1995AD),
              unselectedLabelColor: const Color(0xFF778293),
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xffc778293),
              ),
              indicatorColor: const Color(0xFF1995AD),
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
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
        body: const TabBarView(
          children: [
            UpcomingAppointments(),
            CompletedAppointments(),
            CancelledAppointments()
          ],
        ),
      ),
    );
  }
}
