import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget allDoctorsContainer(size, {bool? isAdmin}) {
  return Container(
    height: size.height * .16,
    width: size.width * .93,
    decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: const Color(0xFFFFFFFF),
        ),
        borderRadius: BorderRadius.circular(18)),
    child: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: size.height * .03),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/avatar-removebg-preview.png'),
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              poppinsText(
                  text: 'Dr. Jennie Thorn',
                  color: const Color(0xFF1D1617),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              Row(children: [
                poppinsText(
                    text: 'Dentist | ',
                    color: const Color(0xFF101828),
                    fontSize: 12),
                poppinsText(
                    text: 'BDS Surgeon',
                    color: const Color(0xFF101828),
                    fontSize: 12)
              ]),
              poppinsText(
                  text: '5Y+ Experience',
                  color: const Color(0xFF101828),
                  fontSize: 12)
            ]),
        SizedBox(width: size.width * .1),
        isAdmin!
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Color(0xFFF24E1E)))
            : IconButton(
                onPressed: () {},
                icon: const Icon(
                  EneftyIcons.heart_outline,
                  size: 28,
                  color: Color(0xFF1995AD),
                ))
      ]),
    ),
  );
}

Widget profileContainer({required containerHeight, required containerWidth}) {
  return Container(
    height: containerHeight,
    width: containerWidth,
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(color: const Color(0xFFFFFFFF)),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      children: [
        poppinsHeadText(text: 'Others'),
      ],
    ),
  );
}
