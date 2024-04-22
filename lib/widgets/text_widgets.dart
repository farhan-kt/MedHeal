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

interText({text, color, double? fontSize, fontWeight}) {
  return Text(text,
      style: GoogleFonts.inter(
          color: color, fontWeight: fontWeight, fontSize: fontSize));
}
