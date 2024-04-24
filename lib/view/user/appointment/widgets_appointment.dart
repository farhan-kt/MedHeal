import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget appointmentBookingContainer(size,
    {circleAvatarRadius, bool? isUpcoming}) {
  return Container(
    // height: size.height * .248,
    // width: size.width * .93,
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(color: const Color(0xFFFFFFFF)),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: size.height * .03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: circleAvatarRadius,
                backgroundColor: const Color.fromARGB(255, 226, 84, 84),
                // backgroundColor: Color(0xFFE3E3E3),
                backgroundImage:
                    const AssetImage('assets/avatar-removebg-preview.png'),
              ),
              SizedBox(
                width: size.width * .035,
              ),
              SizedBox(
                height: size.height * .085,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    poppinsText(
                      text: 'Dr. Jennie Thorn',
                      color: const Color(0xFF1D1617),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    poppinsSmallText(
                      text: 'Dentist',
                      color: const Color(0xFF7B6F72),
                    ),
                    Row(
                      children: [
                        poppinsSmallText(
                          text: 'Aug 17, 2023 | ',
                          color: const Color(0xFF7B6F72),
                        ),
                        poppinsText(
                          text: '11:00 AM',
                          color: const Color(0xFF7B6F72),
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 240, 236, 236),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (isUpcoming!)
                OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Color(0xFFED3443), width: 1.2)),
                  ),
                  onPressed: () {},
                  child: poppinsText(
                    text: 'Cancel Booking',
                    color: const Color(0xFFED3443),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              SizedBox(
                width: size.width * (isUpcoming ? .4 : .8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1995AD),
                  ),
                  onPressed: () {},
                  child: poppinsText(
                    text: isUpcoming ? 'Reschedule' : 'Book Again',
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
