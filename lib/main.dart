import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/firebase_options.dart';
import 'package:medheal/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';
import 'package:medheal/controller/authentication_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        home: SplashScreen(),
      ),
    );
  }
}
