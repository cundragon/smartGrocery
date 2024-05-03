import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Welcome/welcome_screen.dart';
import 'package:smartGrocery/constants.dart';

import 'Screens/Recipes/recipeclass.dart';



Future main() async {



  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Recipe recipe = Recipe(name: "Pho", photourl: "https://plus.unsplash.com/premium_photo-1694699355274-862bfb5ae036?auto=format&fit=crop&q=80&w=3087&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //   ingredients: "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
  //   directions: "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",);
  // FirebaseFirestore.instance.collection('recipes').doc(recipe.name)
  //     .set(recipe.toMap())
  //Future<String?> name = getUserName("CF0puCIX1wcyKavZpiCfuCRvhr93");
  


  await FirebaseFirestore.instance
      .collection('recipes').doc("test");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Grocery',
      theme: ThemeData(
          primaryColor: PrimaryColor,
          scaffoldBackgroundColor: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: PrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: PrimaryLightColor,
            iconColor: PrimaryColor,
            prefixIconColor: PrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home:  WelcomeScreen(),
    );
  }
}


