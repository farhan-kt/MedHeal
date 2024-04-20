import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget categoryCircle(
  context,
  imagePath, {
  category,
}) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.045,
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
      color: Color.fromARGB(255, 245, 241, 241),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        poppinsText(
            textAlign: TextAlign.center,
            text: valueText,
            color: Color(0xFF1995AD),
            fontSize: 14,
            fontWeight: FontWeight.w600),
        poppinsText(
          textAlign: TextAlign.center,
          text: headText,
          fontSize: 12,
          color: Color(0xFF778293),
        ),
      ],
    ),
  );
}
