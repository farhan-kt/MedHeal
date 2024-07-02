import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';

class UserBottomBar extends StatelessWidget {
  const UserBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      body: Consumer<BottomProvider>(
          builder: (context, value, child) =>
              value.userScreens[value.userCurrentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 238, 240, 242)),
          height: size.height * .09,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Consumer<BottomProvider>(
              builder: (context, value, child) => BottomNavigationBar(
                unselectedFontSize: 11,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                onTap: value.userOnTap,
                backgroundColor: const Color(0xFFFFFFFF),
                currentIndex: value.userCurrentIndex,
                selectedItemColor: const Color(0xFF1995AD),
                unselectedItemColor: const Color(0xFF98A3B3),
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 0
                        ? Image.asset(
                            'assets/home_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/home.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Home',
                      color: const Color(0xFF98A3B3),
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 1
                        ? Image.asset(
                            'assets/appointment_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/appointment.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Appointments',
                      color: const Color(0xFF98A3B3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 2
                        ? Image.asset(
                            'assets/doctors_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/doctors.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Doctors',
                      color: const Color(0xFF98A3B3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 3
                        ? Image.asset(
                            'assets/profile_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/profile.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Profile',
                      color: const Color(0xFF98A3B3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ).data,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
