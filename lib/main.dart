import 'package:flutter/material.dart';
import 'package:medheal/controller/chat_provider.dart';
import 'package:medheal/controller/notification_provider.dart';
import 'package:medheal/service/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:medheal/firebase_options.dart';
import 'package:medheal/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medheal/controller/appointment_provider.dart';
import 'package:medheal/controller/admin_provider.dart';
import 'package:medheal/controller/bottom_bar_provider.dart';
import 'package:medheal/controller/authentication_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => AppointmentProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
