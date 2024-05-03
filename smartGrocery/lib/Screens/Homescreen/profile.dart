import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Homescreen/homescreen.dart';

import '../../Firebase/firebase_auth_services.dart';
import '../../constants.dart';
import '../Recipes/personal.dart';
import '../Signup/components/preferences.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _displaynameController = TextEditingController();
  String? userId = "hello";
  String? userEmail = "hello";
  String? photoURL = "hello";
  bool isObscurePassword = true;


  @override
  void initState() {
    super.initState();
    // Retrieve user information when the widget initializes
    _getUserInfo();
    print('$userId');
  }

  Future<void> _getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.displayName;
        userEmail = user.email;
        photoURL = user.photoURL;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(photoURL!)
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white
                          ),
                          color: Colors.lightGreen
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(child: Text(
                userId!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Center(child: Text(
                    userEmail!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                controller: _displaynameController,
                textInputAction: TextInputAction.next,
                cursorColor: PrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: PrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: PrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Your password",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Hero(
                tag: "pref_btn",
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  preferences()),
                    );
                  },
                  child: Text(
                    "Preferences".toUpperCase(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Hero(
                tag: "personal_btn",
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Personal()),
                    );
                  },
                  child: Text(
                    "Personal Recipes".toUpperCase(),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Hero(
                tag: "save_btn",
                child: ElevatedButton(
                  onPressed: () {
                    _save();
                  },
                  child: Text(
                    "Save".toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() async {



    String email = _emailController.text;
    String password = _passwordController.text;
    String displayname = _displaynameController.text;

    if (_emailController.text.isNotEmpty) {
      _auth.updateemail(email);
    }
    if (_passwordController.text.isNotEmpty) {
      _auth.updatepassword(password);
    }
    if (_displaynameController.text.isNotEmpty) {
      _auth.updateDisplayName(displayname);
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Saved Changes"),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      );
    } else {
      print( "some error occured");
    }
  }


}
