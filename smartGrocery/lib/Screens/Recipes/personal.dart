import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Recipes/recipeclass.dart';

import '../Homescreen/homescreen.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  String? userId = "hello";

  User? user = FirebaseAuth.instance.currentUser;

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
        userId = user.uid;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Recipes'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to the HomeScreen here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft, // Aligns the text to the top-left
                  margin: EdgeInsets.all(16), // Add margin for spacing
                  child: Text(
                    'My Saved Recipes',
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],


            ),
            StreamBuilder<QuerySnapshot>(
              //FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).collection('savedRecipes')
              stream: FirebaseFirestore.instance.collection('users').doc(userId).collection('savedRecipes').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<QueryDocumentSnapshot> recipeDocs = snapshot.data!.docs;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Display recipes from 'recipes' collection
                        for (var recipe in recipeDocs)
                          buildCard3(
                            name: recipe['name'],
                            photourl: recipe['photourl'],
                            ingredients: recipe['ingredients'],
                            directions: recipe['directions'],
                            uid: recipe['user'],
                            context: context,
                          ),

                      ],
                    ),
                  );
                }
              },
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft, // Aligns the text to the top-left
                  margin: EdgeInsets.all(16), // Add margin for spacing
                  child: Text(
                    'My Shared Recipes',
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],


            ),
            StreamBuilder<QuerySnapshot>(
              //FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).collection('savedRecipes')
              stream: FirebaseFirestore.instance.collection('users').doc(userId).collection('sharedRecipes').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<QueryDocumentSnapshot> recipeDocs = snapshot.data!.docs;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Display recipes from 'recipes' collection
                        for (var recipe in recipeDocs)
                          buildCard3(
                            name: recipe['name'],
                            photourl: recipe['photourl'],
                            ingredients: recipe['ingredients'],
                            directions: recipe['directions'],
                            uid: recipe['user'],
                            context: context,
                          ),

                      ],
                    ),
                  );
                }
              },
            ),
            // SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //
            //       children: [
            //         buildCard2(name: "Pho", photourl: "https://plus.unsplash.com/premium_photo-1694699355274-862bfb5ae036?auto=format&fit=crop&q=80&w=3087&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //             ingredients: "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
            //             directions: "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",
            //             context: context),
            //         SizedBox(width: 12),
            //         buildCard2(name: "pad Thai",
            //             photourl: "https://plus.unsplash.com/premium_photo-1664472637341-3ec829d1f4df?auto=format&fit=crop&q=80&w=3125&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //             ingredients: "stir-fried rice noodles with eggs, vegetables and tofu in a sauce of tamarind, fish, dried shrimp, garlic, red chilli pepper and sugar",
            //             directions: "Soak rice noodles in warm water. Sauté tofu/prawns, garlic, and tofu/chicken in a wok. Add soaked noodles, stir-fry with tamarind paste, fish sauce, sugar, bean sprouts, and peanuts until cooked.\nServe with lime wedges, chili flakes, and garnish with cilantro.",
            //             context: context),
            //         SizedBox(width: 12),
            //         buildCard2(name: "Alfredo Pasta",
            //             photourl: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&q=80&w=2706&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //             ingredients: "8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
            //             directions: "Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
            //             context: context),
            //       ],
            //     )
            // ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft, // Aligns the text to the top-left
                  margin: EdgeInsets.all(16), // Add margin for spacing
                  child: Text(
                    'Favorite Recipes',
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],


            ),
            StreamBuilder<QuerySnapshot>(
              //FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).collection('savedRecipes')
              stream: FirebaseFirestore.instance.collection('users').doc(userId).collection('favoriteRecipes').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<QueryDocumentSnapshot> recipeDocs = snapshot.data!.docs;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Display recipes from 'recipes' collection
                        for (var recipe in recipeDocs)
                          buildCard3(
                            name: recipe['name'],
                            photourl: recipe['photourl'],
                            ingredients: recipe['ingredients'],
                            directions: recipe['directions'],
                            uid: recipe['user'],
                            context: context,
                          ),

                      ],
                    ),
                  );
                }
              },
            ),
            // SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //
            //       children: [
            //         buildCard2(name: "Cheese Pizza", photourl: "https://preppykitchen.com/wp-content/uploads/2021/10/Cheese-Pizza-Feature.jpg",
            //             ingredients: "Pizza sauce, pizza dough, parmesan cheese, and mozzarella cheese",
            //             directions: "1.Stretch the dough into a circle.\n 2. Spread the pizza sauce onto the dough, leaving a 1-inch border around the edge. \n3. Add mozzarella and parmesan before baking for 12 to 14 minutes, or until the crust is browned and the cheese is bubbling",
            //             context: context),
            //         SizedBox(width: 12),
            //         buildCard2(name: "Greek Salad",
            //             photourl: "https://www.cookingclassy.com/wp-content/uploads/2018/02/greek-salad-4.jpg",
            //             ingredients: "Mixed greens, kale, romaine, tomatoes, bell peppers,feta cheese, olives and cucumbers. \nFor dressing: Salt, pepper, olive oil, red wine vinegar, Dijon, mustard, oregano, garlic",
            //             directions: "",
            //             context: context),
            //         SizedBox(width: 12),
            //         buildCard2(name: "Alfredo Pasta",
            //             photourl: "https://www.modernhoney.com/wp-content/uploads/2018/08/Fettuccine-Alfredo-Recipe-1.jpg",
            //             ingredients: "8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
            //             directions: "Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
            //             context: context),
            //         SizedBox(width: 12),
            //         buildCard2(name: "Classic Burgers",
            //             photourl: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2004/2/25/0/bw2b07_hambugers1.jpg.rend.hgtvcom.616.462.suffix/1558017418187.jpeg",
            //             ingredients: "Your choice of buns, ground chuck beef (salt and pepper), your choice of toppings (cheese, tomatoes, pickles, lettuce, and etc",
            //             directions: "Slice and prepare toppings. Spread the cut-side of the bun with softened or melted butter. Toast if wanted. Preheat grill. Divide ground beef for the patties. Season patties with salt and pepper.Grill hamburger patties and flip them",
            //             context: context),
            //         SizedBox(width: 12),
            //
            //       ],
            //     )
            // ),


          ],
        )

    );
  }
}
