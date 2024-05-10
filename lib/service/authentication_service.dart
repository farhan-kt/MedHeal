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

  // Future<PhoneAuthCredential?> verifyOtp(String otp, context,
  //     {Function? snackBarSuccess, Function? snackBarError}) async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId!, smsCode: otp);
  //     await firebaseAuth.signInWithCredential(credential);
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const UserBottomBar(),
  //         ),
  //         (route) => false);
  //     snackBarSuccess;
  //   } catch (e) {
  //     snackBarError;
  //     log("verify otp error $e");
  //     return null;
  //   }
  //   return null;
  // }

  Future<PhoneAuthCredential?> verifyOtp(otp, context) async {
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
      log("verify otp error $e");
      return null;
    }
    return null;
  }

  // updateUser(userid, UserModel data) async {
  //   try {
  //     await user.doc(userid).update(data.toJson());
  //   } catch (e) {
  //     log("error in updating product : $e");
  //   }
  // }
}
