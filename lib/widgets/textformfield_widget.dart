import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medheal/widgets/text_widgets.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final int? maxLines;
  final double? width;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? validateMessage;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? focusErrorBorder;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.maxLines,
    this.width,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.validateMessage,
    this.keyboardType,
    required this.controller,
    this.enabledBorder,
    this.focusedBorder,
    this.focusErrorBorder,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateMessage ?? 'Enter value';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xFF98A3B3),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.inter(
          color: const Color(0xFF98A3B3),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        fillColor: const Color.fromARGB(255, 225, 227, 234),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        focusedErrorBorder: focusErrorBorder,
      ),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

Widget dropDownTextFormField(
  context, {
  required String? selectedValue,
  required List<String> items,
  required String validatorMessage,
  required String hintText,
  required void Function(String?)? onChanged,
}) {
  return GestureDetector(
    onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: DropdownButtonFormField<String>(
      icon: const SizedBox.shrink(),
      validator: (value) {
        if (value == null) {
          return validatorMessage;
        } else {
          return null;
        }
      },
      value: selectedValue,
      items: items.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: interSubText(
            text: gender,
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: const Icon(EneftyIcons.arrow_down_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 225, 227, 234),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xFF98A3B3),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        icon: null,
      ),
    ),
  );
}
