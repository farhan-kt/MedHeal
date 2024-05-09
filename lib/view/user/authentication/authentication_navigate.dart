import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';
import 'package:medheal/view/user/authentication/login_type.dart';

class AuthenticationNavigate extends StatelessWidget {
  const AuthenticationNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body:
          currentUser != null ? const UserBottomBar() : const LoginTypeScreen(),
    );
  }
}
