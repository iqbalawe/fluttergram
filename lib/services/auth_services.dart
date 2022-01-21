import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:instagram_clone/services/services.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occured";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        // register user to Firebase Authentication
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint('USER UID: ${credential.user!.uid}');

        // call upload image method
        String photoUrl =
            await StorageServices().uploadImage('profilePics', file, false);

        // add user to Firestore Database
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'username': username,
          'uid': credential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });

        res = 'Account created successfully.';
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('ERROR CODE AND MESSAGE: $e');
      switch (e.code) {
        case 'email-already-in-use':
          res = 'The email address is already in use by another account.';
          break;
        case 'weak-password':
          res = 'Password should be at least 6 characters.';
          break;
        case 'invalid-email':
          res = 'The email address is badly formatted.';
          break;
        default:
          res = e.code.toString();
      }
    }
    return res;
  }
}
