import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medheal/widgets/text_widgets.dart';

Widget loginTypePoppinsText({text}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 15));
}

Widget loginTypeOutlinedButton(size, {text, EdgeInsets? padding}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.white, width: 1.8),
    ),
    onPressed: () {},
    child: Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
      child: poppinsText(
        text: text,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    ),
  );
}
