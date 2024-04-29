import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medheal/controller/user_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).goToLoginType(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/medHeal splash.png'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * .1),
              child: const CircularProgressIndicator(
                color: Color(0xFF1995AD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
