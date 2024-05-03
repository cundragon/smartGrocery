import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Homescreen/profile.dart';
import 'package:smartGrocery/Screens/Welcome/welcome_screen.dart';

import '../Recipes/menu_list.dart';
import '../Recipes/recipeclass.dart';
import '../Stores/store_screen.dart';
import '../Communitypage/community_screen.dart';
import '../barcode/barcode.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String? userId = "hello";
  String? userEmail = "hello";
  String? photoURL = "hello";
  void _navigateToScreen(BuildContext context, String option) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return OptionScreen(option);
    }));
  }

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
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(

              accountName: Text(userId!,
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              accountEmail:  Text(userEmail!,
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              decoration: BoxDecoration(color: Colors.green,),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(photoURL!),
                radius: 100,
              ),
              onDetailsPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  profile()),
              ),

            ),
            ListTile(
              iconColor: Colors.black,
              leading: Icon(Icons.share),
              title: Text('Share Personal Recipes', style: TextStyle(color: Colors.black, fontSize: 15.0)),
              onTap: () => {
                Navigator.pop(context),
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return AddRecipeScreen();
                }))
              }
            ),
            ListTile(
                iconColor: Colors.black,
                leading: Icon(Icons.groups),
                title: Text('Community Page', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                onTap: () => {
                  Navigator.pop(context),
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return CommunityPage();
                  }))
                }
            ),
            ListTile(
              iconColor: Colors.black,
              leading: Icon(Icons.qr_code_scanner),
              title: Text('Scan Barcode', style: TextStyle(color: Colors.black, fontSize: 15.0)),
              onTap: () => {
                Navigator.pop(context),
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return BarcodeScannerPage();
                }))
              }
            ),
            ListTile(
              iconColor: Colors.black,
              leading: Icon(Icons.recommend_outlined),
              title: Text('All Recipes', style: TextStyle(color: Colors.black, fontSize: 15.0)),
              onTap: () => {
                Navigator.pop(context),
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return MenuListPage();
                }))
              }

            ),
            ListTile(
              iconColor: Colors.black,
              leading: Icon(Icons.location_on),
              title: Text('Stores Near You', style: TextStyle(color: Colors.black, fontSize: 15.0)),
              onTap: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Storescreen()),
                  ),
            ),
            ListTile(
              iconColor: Colors.black,
              leading: Icon(Icons.logout),
              title: Text('Log Out', style: TextStyle(color: Colors.black, fontSize: 15.0)),
              onTap: () {
                _signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  WelcomeScreen()),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  final String option;

  OptionScreen(this.option);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(option),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          '$option',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class AddRecipeScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController directionsController = TextEditingController();
  final TextEditingController photoUrlController = TextEditingController();

  Future<void> _saveRecipe(BuildContext context) async {
    // Get the entered values from the text form fields
    String name = nameController.text.trim();
    String ingredients = ingredientsController.text.trim();
    String directions = directionsController.text.trim();
    String photoUrl = photoUrlController.text.trim();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String uid = "Non user";
    if (user != null) {
      uid = user.uid;
      print("User ID: $uid");
    } else {
      print("User not signed in");
    }

    // Validate if required fields are not empty
    if (name.isEmpty || ingredients.isEmpty || directions.isEmpty || photoUrl.isEmpty) {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all the fields.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Save the recipe to the Firestore collection
    try {
      Recipe recipe = Recipe(name: name, photourl: photoUrl,
         ingredients: ingredients,
          directions: directions,
      user: uid);
      //await FirebaseFirestore.instance.collection('recipes').doc(recipe.name).set(recipe.toMap());
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('savedRecipes')
            .doc(recipe.name)
            .set(recipe.toMap());
      }

      // Show a success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Recipe Saved'),
            content: Text('Your recipe has been saved in the collection.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Close the 'Add New Recipe' screen
                },
              ),
            ],
          );
        },
      );
    } catch (error) {
      // Show an error dialog if saving fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save the recipe. Please try again later.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _shareRecipe(BuildContext context) async {
    // Get the entered values from the text form fields
    String name = nameController.text.trim();
    String ingredients = ingredientsController.text.trim();
    String directions = directionsController.text.trim();
    String photoUrl = photoUrlController.text.trim();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String uid = "Non user";
    if (user != null) {
      uid = user.uid;
      print("User ID: $uid");
    } else {
      print("User not signed in");
    }

    // Validate if required fields are not empty
    if (name.isEmpty || ingredients.isEmpty || directions.isEmpty || photoUrl.isEmpty) {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all the fields.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Save the recipe to the Firestore collection
    try {
      Recipe recipe = Recipe(name: name, photourl: photoUrl,
          ingredients: ingredients,
          directions: directions,
          user: uid);
      await FirebaseFirestore.instance.collection('recipes').doc(recipe.name).set(recipe.toMap());
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('sharedRecipes')
            .doc(recipe.name)
            .set(recipe.toMap());
      }

      // Show a success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Recipe Shared'),
            content: Text('Your recipe has been shared to Community Page.'),
            actions: <Widget>[
              TextButton(
                child: Text('Go to Community Page'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CommunityPage();
                  }));
                },
              ),
            ],
          );
        },
      );
    } catch (error) {
      // Show an error dialog if saving fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to share the recipe. Please try again later.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add New Recipe'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Recipe Name'),
            ),
            SizedBox(height: 30,),
            TextFormField(
              controller: ingredientsController,
              decoration: InputDecoration(labelText: 'Ingredient List'),
              maxLines: 4,
            ),
            SizedBox(height: 30,),
            TextFormField(
              controller: directionsController,
              decoration: InputDecoration(labelText: 'Direction List'),
              maxLines: 6,
            ),
            SizedBox(height: 30,),
            TextFormField(
              controller: photoUrlController,
              decoration: InputDecoration(labelText: 'Picture URL'),
              maxLines: 6,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveRecipe(context);
                // // Save the recipe and show a pop-up dialog
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text('Recipe Saved'),
                //       content: Text('Your recipe has been saved in your profile.'),
                //       actions: <Widget>[
                //         TextButton(
                //           child: Text('OK'),
                //           onPressed: () {
                //             // Close the dialog
                //             Navigator.of(context).pop();
                //             // Close the 'Add New Recipe' screen
                //             Navigator.of(context).pop();
                //           },
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
              child: Text('Save Recipe'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _shareRecipe(context);

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: Text('Share Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
