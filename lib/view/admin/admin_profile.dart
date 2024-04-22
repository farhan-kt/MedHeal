import 'package:flutter/material.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/widgets/text_widgets.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: poppinsText(
            text: 'My Profile',
            color: const Color(0xFF101828),
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(255, 143, 189, 198),
                        backgroundImage:
                            AssetImage('assets/avatar-removebg-preview.png')),
                    SizedBox(width: size.width * .02),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          poppinsText(
                              text: 'Farhan',
                              color: const Color(0xFF1D1617),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          poppinsSmallText(
                            text: '12',
                            color: Color(0xFF888888),
                          ),
                        ]),
                  ],
                ),
                SizedBox(
                  height: size.height * .041,
                  width: size.width * .2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1995AD),
                    ),
                    onPressed: () {},
                    child: poppinsText(
                      text: 'Edit',
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .03),
            profileScreenContainer(context,
                containerHeight: size.height * .25,
                containerWidth: size.width * .9,
                isAdmin: false)
          ])),
    );
  }
}
