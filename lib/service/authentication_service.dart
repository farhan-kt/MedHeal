import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medheal/widgets/user_bottom_bar.dart';

class AuthenticationService {
  String collection = 'user';
  String? verificationid;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<UserCredential> userEmailCreate(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Account created');

      return userCredential;
    } catch (error) {
      log('error got in creating account $error ');
      rethrow;
    }
  }

  Future<UserCredential> userEmailSignIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      log('Signed In');
      return userCredential;
    } on FirebaseAuthMultiFactorException catch (error) {
      throw Exception(error.code);
    }
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? guser = userCredential.user;
      log("${guser?.displayName}");
    } catch (error) {
      log('Google SignIn error : $error');
      rethrow;
    }
  }

  Future googleSignOut() async {
    return await GoogleSignIn().signOut();
  }

  Future<void> getOtp(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            await user.updatePhoneNumber(phoneAuthCredential);
          }
        },
        verificationFailed: (error) {
          log("verification failed error : $error");
        },
        codeSent: (verificationId, forceResendingToken) {
          verificationid = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationid = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      log("sign in error : $e");
    }
  }

  Future<PhoneAuthCredential?> verifyOtp(
      otp, context, Function? snackBarError) async {
    try {
      log('message');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationid!, smsCode: otp);
      await firebaseAuth.signInWithCredential(credential);
      log('message');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const UserBottomBar(),
          ),
          (route) => false);
    } catch (e) {
      snackBarError;
      log("verify otp error $e");
      return null;
    }
    return null;
  }

  void passwordReset({required email, context}) async {
    try {
      log('start');
      await firebaseAuth.sendPasswordResetEmail(email: email);
      log('success');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      log('error occure');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  // updateUser(userid, UserModel data) async {
  //   try {
  //     await user.doc(userid).update(data.toJson());
  //   } catch (e) {
  //     log("error in updating product : $e");
  //   }
  // }
}
