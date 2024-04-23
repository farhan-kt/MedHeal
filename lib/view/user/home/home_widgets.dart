import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medheal/view/user/home/doctor_detail_screen.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget categoryCircle(context, imagePath, {category, circleRadius}) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
          radius: circleRadius,
          backgroundColor: const Color(0xFF1995AD).withOpacity(0.5),
          backgroundImage: AssetImage(imagePath),
        ),
        poppinsText(
            text: category, fontSize: 14, color: const Color(0xFF101828))
      ],
    ),
  );
}

Widget doctorDetailsContainer({height, width, valueText, headText}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 245, 241, 241)),
      borderRadius: BorderRadius.circular(18),
      color: const Color.fromARGB(255, 245, 241, 241),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        poppinsText(
            textAlign: TextAlign.center,
            text: valueText,
            color: const Color(0xFF1995AD),
            fontSize: 14,
            fontWeight: FontWeight.w600),
        poppinsText(
          textAlign: TextAlign.center,
          text: headText,
          fontSize: 12,
          color: const Color(0xFF778293),
        ),
      ],
    ),
  );
}

Widget homeCategory(context, size, {circleAvatarRadius}) {
  return SizedBox(
    height: size.height * .275,
    width: size.width * .9,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'General', circleRadius: circleAvatarRadius),
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'Dentist', circleRadius: circleAvatarRadius),
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'Otology', circleRadius: circleAvatarRadius),
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'Cardiology', circleRadius: circleAvatarRadius),
          ],
        ),
        SizedBox(height: size.height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'Intestine', circleRadius: circleAvatarRadius),
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'Pediatric', circleRadius: circleAvatarRadius),
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'Herbal', circleRadius: circleAvatarRadius),
            categoryCircle(context, 'assets/avatar-removebg-preview.png',
                category: 'More', circleRadius: circleAvatarRadius),
          ],
        )
      ],
    ),
  );
}

Widget homeAppBar(size) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    SizedBox(
      child: Row(
        children: [
          const CircleAvatar(
              radius: 25,
              backgroundColor: Color.fromARGB(255, 143, 189, 198),
              backgroundImage:
                  AssetImage('assets/avatar-removebg-preview.png')),
          SizedBox(width: size.width * .02),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            poppinsText(
              text: 'Welcome',
              color: const Color.fromARGB(255, 155, 141, 143),
              fontSize: 12,
            ),
            poppinsText(
                text: 'Farhan',
                color: const Color(0xFF1D1617),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ]),
        ],
      ),
    ),
    SizedBox(
      child: Row(children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(EneftyIcons.notification_bing_outline)),
        IconButton(
            onPressed: () {}, icon: const Icon(EneftyIcons.heart_outline)),
      ]),
    )
  ]);
}

Widget homeUpcomingSchedule(size) {
  return Container(
    height: size.height * .19,
    width: size.width * .88,
    decoration: BoxDecoration(
        color: const Color(0xFF1995AD),
        border: Border.all(color: const Color.fromARGB(255, 199, 212, 226)),
        borderRadius: BorderRadius.circular(18)),
    child: Padding(
        padding: EdgeInsets.only(
          top: size.height * .01,
          bottom: size.height * .01,
          left: size.width * .014,
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ListTile(
            leading: const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFFFFFFF),
                backgroundImage:
                    AssetImage('assets/avatar-removebg-preview.png')),
            title: poppinsText(
                text: 'DR Farhan',
                color: const Color(0xFFFFFFFF),
                fontSize: 14,
                fontWeight: FontWeight.w600),
            subtitle: Row(children: [
              poppinsText(
                text: 'Dentist | ',
                fontSize: 12,
                color: const Color(0xFFFFFFFF),
              ),
              poppinsText(
                text: 'BDS',
                fontSize: 12,
                color: const Color(0xFFFFFFFF),
              ),
            ]),
            trailing: PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                ),
                color: Colors.grey,
                onSelected: (value) {
                  if (value == 'reshedule') {
                  } else if (value == 'cancel') {}
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        child: poppinsText(
                            text: 'Reshedule', color: const Color(0xFFFFFFFF)),
                        value: 'reshedule'),
                    PopupMenuItem(
                        child: poppinsText(
                            text: 'Cancel Booking',
                            color: const Color(0xFFFFFFFF)),
                        value: 'cancel'),
                  ];
                }),
          ),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: Container(
                height: size.height * .055,
                width: size.width * .35,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 24, 130, 151)),
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 24, 130, 151)),
                child: Row(children: [
                  SizedBox(width: size.width * .02),
                  Image.asset('assets/home calendar.png'),
                  SizedBox(width: size.width * .002),
                  poppinsText(
                      text: 'Sep 10, 2023',
                      overflow: TextOverflow.ellipsis,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFFFFFF))
                ]),
              ),
            ),
            SizedBox(width: size.width * .05),
            Container(
              height: size.height * .055,
              width: size.width * .28,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 24, 130, 151)),
                  borderRadius: BorderRadius.circular(18),
                  color: const Color.fromARGB(255, 24, 130, 151)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/home time.png',
                      height: size.width * .06,
                      width: size.width * .06,
                    ),
                    poppinsText(
                        text: '05:00 PM',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF))
                  ]),
            ),
          ])
        ])),
  );
}

Widget homeTopDoctors(context, size) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DoctorDetailScreen()));
    },
    child: Container(
      height: size.height * .16,
      width: size.width * .9,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 193, 225, 234),
          border: Border.all(color: const Color.fromARGB(255, 199, 212, 226)),
          borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: size.height * .03),
        child: Row(children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/avatar-removebg-preview.png'),
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
  );
}
