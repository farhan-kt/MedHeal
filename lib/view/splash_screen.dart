import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';
import 'package:medheal/controller/authentication_provider.dart';
import 'package:medheal/view/user/authentication/login_type.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLoginType(context);
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

  Future<void> goToLoginType(context) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final UserProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    // await Future.delayed(const Duration(seconds: 2));
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const AuthenticationNavigate()),
    // );
    if (currentUser == null) {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginTypeScreen()));
    } else {
      await UserProvider.getUser();
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserBottomBar()));
    }
  }
}
