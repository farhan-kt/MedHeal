import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

poppinsText({text, color, fontWeight, double? fontSize, textAlign}) {
  return Text(text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color, fontWeight: fontWeight, fontSize: fontSize));
}

poppinsHeadText({text, textAlign}) {
  return Text(text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: const Color(0xFF101828),
          fontWeight: FontWeight.w600,
          fontSize: 16));
}

poppinsSmallText({text, color, fontWeight}) {
  return Text(text,
      // overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(color: color, fontSize: 12));
}

interHeadText({text}) {
  return Text(text,
      style: GoogleFonts.inter(
          color: const Color(0xFF1A1A1A),
          fontWeight: FontWeight.bold,
          fontSize: 20));
}

interSubText({text, color, fontWeight}) {
  return Text(text,
      style: GoogleFonts.inter(
          color: color ?? Color(0xFF1A1A1A),
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: 14));
}
