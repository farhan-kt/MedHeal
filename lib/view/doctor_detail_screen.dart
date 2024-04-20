import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medheal/view/user/home_widgets.dart';
import 'package:medheal/widgets/text_widgets.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: const Color(0xFFFFFFFF),
        title: poppinsText(
            text: 'Dr. Jennie Thorn',
            color: const Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(EneftyIcons.heart_add_outline))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.035, vertical: size.height * 0.02),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * .16,
                width: size.width * .93,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 188, 214, 219),
                    border: Border.all(
                        color: const Color.fromARGB(255, 199, 212, 226)),
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: size.height * .03),
                  child: Row(children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/avatar-removebg-preview.png'),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          poppinsText(
                              text: 'Dr. Jennie Thorn',
                              color: const Color(0xFF1D1617),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          poppinsText(
                              text: 'Dentist',
                              color: const Color(0xFF101828),
                              fontSize: 12),
                          Row(
                            children: [
                              Icon(
                                EneftyIcons.location_outline,
                                size: size.width * .05,
                                color: const Color(0xFF1995AD),
                              ),
                              poppinsText(
                                  text: 'Royal Hospital, kerala',
                                  color: const Color(0xFF101828),
                                  fontSize: 12),
                            ],
                          )
                        ])
                  ]),
                ),
              ),
              SizedBox(height: size.height * .03),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                doctorDetailsContainer(
                    height: size.height * .07,
                    width: size.width * .27,
                    valueText: '180Cm',
                    headText: 'Patient'),
                SizedBox(width: size.width * .04),
                doctorDetailsContainer(
                    height: size.height * .07,
                    width: size.width * .27,
                    valueText: '10Y +',
                    headText: 'Experience'),
                SizedBox(width: size.width * .04),
                doctorDetailsContainer(
                    height: size.height * .07,
                    width: size.width * .27,
                    valueText: '180Cm',
                    headText: 'Rating'),
              ]),
              SizedBox(height: size.height * .03),
              poppinsHeadText(text: 'About me'),
              SizedBox(height: size.height * .02),
              SizedBox(
                child: poppinsSubHeadText(
                    text:
                        'Dr. Jennie Thorn is the most immunologists specialist in Royal Hospital at Phnom penh. She achieved several awards for her wonderful contributing in medical field',
                    color: Color(0xFF344154)),
              ),
              SizedBox(height: size.height * .03),
              poppinsHeadText(text: 'Working information'),
              SizedBox(height: size.height * .02),
            ],
          ),
        ),
      ),
    );
  }
}
