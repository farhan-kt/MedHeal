import 'package:flutter/material.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';
import 'package:medheal/view/create_account.dart';
import 'package:medheal/view/fill_profile.dart';
import 'package:medheal/view/sign_in.dart';
import 'package:medheal/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginTypeScreen(),
        home: BottomBar(),
      ),
    );
  }
}
