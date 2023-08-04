import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nova_social/data/constants/app_key_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/flavors.dart';
import 'package:nova_social/utils/utils.dart';

class AuthRepository {
  final firestore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['profile', 'email'],
  );

  Stream<User?> authState() {
    return FirebaseAuth.instance.userChanges();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  int _generateRandom3Digit() {
    var rng = Random();
    var rand = rng.nextInt(900) + 100;
    return rand.toInt();
  }

  Future<Responser<UserCredential?>> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = _sha256ofString(rawNonce);
    try {
      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
        rawNonce: rawNonce,
      );

      UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      String displayName = '';
      if (appleIdCredential.givenName?.isNotEmpty ?? false) {
        displayName = '${appleIdCredential.givenName}';
      }
      if (appleIdCredential.familyName?.isNotEmpty ?? false) {
        displayName = '$displayName ${appleIdCredential.familyName}';
      }

      if (displayName.isEmpty) {
        displayName = 'New User${_generateRandom3Digit()}';
      }

      if (displayName.isNotEmpty) {
        final User? firebaseUser = userCredential.user;
        await firebaseUser?.updateDisplayName(displayName);
        await firebaseUser?.reload();
      }

      return Responser(
        message: 'Success',
        isSuccess: true,
        data: userCredential,
      );
    } catch (e) {
      return ErrorHandler.error<UserCredential>(e);
    }
  }

  Future<Responser<UserCredential?>> signInWithGoogle() async {
    try {
      if (kIsWeb.not && Platform.isIOS) {
        googleSignIn = F.appFlavor == Flavor.DEV
            ? GoogleSignIn(
                clientId:
                    "470634687421-tanj4gsaak6jmdfntidcih8e40d4b9t0.apps.googleusercontent.com",
              )
            : GoogleSignIn(
                clientId:
                    "899427589392-jb3qd0mv3u338n1p5qqfji36ad3s4s73.apps.googleusercontent.com",
              );
      }

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return Responser(
        message: 'Success',
        isSuccess: true,
        data: userCredential,
      );
    } catch (e) {
      return ErrorHandler.error<UserCredential>(e);
    }
  }

  Future<Responser> signOut() async {
    try {
      if (kIsWeb.not && Platform.isIOS) {
        googleSignIn = F.appFlavor == Flavor.DEV
            ? GoogleSignIn(
                clientId:
                    "470634687421-tanj4gsaak6jmdfntidcih8e40d4b9t0.apps.googleusercontent.com",
              )
            : GoogleSignIn(
                clientId:
                    "899427589392-jb3qd0mv3u338n1p5qqfji36ad3s4s73.apps.googleusercontent.com",
              );
      }
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      await AppEnvironment.firebaseMessaging.deleteToken();

      return Responser(
        message: 'Success',
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser> deleteAccount() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      await FirebaseAuth.instance.currentUser?.delete();
      await firestore.collection(AppKeyNames.user).doc(userId).delete();
      await FirebaseAuth.instance.signOut();

      final prefs = await SharedPreferences.getInstance();
      prefs.clear();

      return Responser(
        message: 'Success',
        isSuccess: true,
      );
    } catch (e) {
      if (e.toString().contains('requires-recent-login')) {
        return ErrorHandler.error(
            'This is a sensitive action. For security purpose, please re-login and then proceed with this action.');
      }
      return ErrorHandler.error(e);
    }
  }
}
