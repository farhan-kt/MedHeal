import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: poppinsText(
            text: 'My Profile',
            color: const Color(0xFF101828),
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}