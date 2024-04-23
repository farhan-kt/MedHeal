import 'package:flutter/material.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<UserProvider>(context, listen: false).goToLoginType(context);
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
