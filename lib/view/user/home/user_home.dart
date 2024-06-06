import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/view/user/home/home_widgets.dart';
import 'package:medheal/widgets/all_doctor_container.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';

const double circleAvatarRadiusFraction = 0.091;

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<AdminProvider>(context, listen: false).getAllDoctors();
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;

    final bottomProvider = Provider.of<BottomProvider>(context, listen: false);
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
              homeAppBar(size, context),
              SizedBox(height: size.height * .02),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return homeUpcomingAppointment(size, context);
                },
              ),
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
                  onPressed: () {
                    bottomProvider.userOnTap(2);
                  },
                  child: poppinsHeadText(
                    text: 'SEE ALL',
                    fontSize: 14,
                    color: const Color(0xFF1995AD),
                  ),
                )
              ]),
              SizedBox(height: size.height * .01),
              Consumer<AdminProvider>(
                builder: (context, doctorValue, child) {
                  if (doctorValue.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (doctorValue.allDoctorList.isNotEmpty) {
                      final allDoctor = doctorValue.allDoctorList;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allDoctor.length,
                        itemBuilder: (context, index) {
                          final doctors = allDoctor[index];
                          return Column(
                            children: [
                              AllDoctorsContainer(
                                  size: size,
                                  isAdmin: false,
                                  doctors: doctors,
                                  value: doctorValue,
                                  circleAvatarRadius: circleAvatarRadius),
                              SizedBox(height: size.height * .02),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                          child:
                              Image.asset('assets/no doctors available.png'));
                    }
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
