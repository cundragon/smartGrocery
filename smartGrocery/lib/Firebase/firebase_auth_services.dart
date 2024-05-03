



import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Screens/Recipes/recipeclass.dart';





class FirebaseAuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password, String displayname) async {

    try {
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      credential.user?.updateDisplayName(displayname);
      credential.user?.updatePhotoURL("https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png");

      FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).collection('userInfo').doc('userDetails').set({
        'email': email,
        'name': displayname,
        // Do not store passwords directly; Firebase Authentication handles this securely
      });
      // FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).collection('savedRecipes').add({
      //   // Initial data for the 'savedRecipes' document (optional)
      // });
      // FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).collection('sharedRecipes').add({
      //   // Initial data for the 'sharedRecipes' document (optional)
      // });
      // FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).collection('favoriteRecipes').add({
      //   // Initial data for the 'favoriteRecipes' document (optional)
      // });

      return credential.user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        print( 'The email address is already in use.');
      } else {
        print('An error occurred: ${e.code}');
      }
    }
    return null;

  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    FirebaseFirestore.instance.collection('recipes').doc("pho")
        .update({"test" : "test"})
        .then((value) => print("Recipe added"))
        .catchError((error) => print("Failed to add recipe: $error"));

    try {

      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);

      //FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).update({"email":email});
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print( 'Invalid email or password.');
      } else {
        print( 'An error occurred: ${e.code}');
      }

    }
    return null;

  }

  Future<User?> updateDisplayName(String displayname) async {

    try {
      User? user =await _auth.currentUser;
      user?.updateDisplayName(displayname);
      FirebaseFirestore.instance.collection('users').doc(user?.uid).collection('userInfo').doc('userDetails').update({
        'name': displayname,
        // Do not store passwords directly; Firebase Authentication handles this securely
      });
      return user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        print( 'The email address is already in use.');
      } else {
        print('An error occurred: ${e.code}');
      }
    }
    return null;

  }
  Future<User?> updatepassword(String password) async {

    try {
      User? user = _auth.currentUser;
      user?.updatePassword(password);
      return user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        print( 'The email address is already in use.');
      } else {
        print('An error occurred: ${e.code}');
      }
    }
    return null;

  }

  Future<User?> updateemail(String email) async {

    try {
      User? user = _auth.currentUser;
      user?.updateEmail(email);
      FirebaseFirestore.instance.collection('users').doc(user?.uid).collection('userInfo').doc('userDetails').update({
        'email': email,
        // Do not store passwords directly; Firebase Authentication handles this securely
      });
      return user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        print( 'The email address is already in use.');
      } else {
        print('An error occurred: ${e.code}');
      }
    }
    return null;

  }

  Future<User?> updatephotourl(String url) async {

    try {
      User? user = _auth.currentUser;
      user?.updatePhotoURL(url);
      return user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        print( 'The email address is already in use.');
      } else {
        print('An error occurred: ${e.code}');
      }
    }
    return null;

  }




}


