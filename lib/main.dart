import 'package:flutter/material.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/view/splash_screen.dart';
import 'package:medheal/view/user/authentication/create_account.dart';
import 'package:medheal/view/user/authentication/fill_profile.dart';
import 'package:medheal/view/user/doctors/all_doctors.dart';
import 'package:medheal/view/user/profile/profile_user.dart';
import 'package:medheal/view/user/appointment/appointment_tab.dart';
import 'package:medheal/widgets/admin_bottom_bar.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';
import 'package:medheal/controller/authentication_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AdminProvider()),
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginTypeScreen(),
        home: UserBottomBar(),
      ),
    );
  }
}
