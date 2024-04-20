import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget loginTypePoppinsText({text}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 15));
}

Widget loginTypeOutlinedButton(size, {text, double? width, double? height}) {
  return SizedBox(
    width: width,
    height: height,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.8),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: poppinsText(
          textAlign: TextAlign.center,
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    ),
  );
}
