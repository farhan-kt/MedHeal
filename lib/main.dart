import 'package:flutter/material.dart';
import 'package:medheal/view/appointment.dart';
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
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginTypeScreen(),
        home: AppointmentScreen(),
      ),
    );
  }
}
