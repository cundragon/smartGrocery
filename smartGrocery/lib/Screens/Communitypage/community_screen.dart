import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Homescreen/navbar.dart';
import 'package:smartGrocery/Screens/Homescreen/homescreen.dart';
import 'package:smartGrocery/Screens/Recipes/recipeclass.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartGrocery/Screens/Welcome/welcome_screen.dart';
import 'package:smartGrocery/constants.dart';
import 'package:smartGrocery/Screens/Recipes/menu_list.dart';
import 'package:smartGrocery/Screens/Stores/store_screen.dart';


class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
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

  // Map<String, dynamic> searchUsersByName(String nameToSearch, Map<String, dynamic> recipe) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to a specific route or page when the back arrow is pressed
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
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
      body:  Column(
          children: [
          Container(
          alignment: Alignment.topLeft, // Aligns the text to the top-left
          margin: EdgeInsets.all(16), // Add margin for spacing
          child: Text(
            'Shared by You',
            style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
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
            //MyShareRecipes(),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.topLeft, // Aligns the text to the top-left
              margin: EdgeInsets.all(16), // Add margin for spacing
              child: Text(
                'Shared by Community',
                style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
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
            //MyTrendingRecipes(),
           // SizedBox(height: 20),
          ],
        ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.add),
          onPressed: () {
            // Handle the "See All" button tap here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AddRecipeScreen()),
            );}
      ),
    );
  }
}

class MyShareRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: SingleChildScrollView(
        controller: PageController(viewportFraction: 0.8),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildCard2(name: "Pho", photourl: "https://plus.unsplash.com/premium_photo-1694699355274-862bfb5ae036?auto=format&fit=crop&q=80&w=3087&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ingredients: "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
                directions: "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",
                context: context),
            SizedBox(width: 12),
            buildCard2(name: "pad Thai",
                photourl: "https://plus.unsplash.com/premium_photo-1664472637341-3ec829d1f4df?auto=format&fit=crop&q=80&w=3125&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ingredients: "stir-fried rice noodles with eggs, vegetables and tofu in a sauce of tamarind, fish, dried shrimp, garlic, red chilli pepper and sugar",
                directions: "Soak rice noodles in warm water. Sauté tofu/prawns, garlic, and tofu/chicken in a wok. Add soaked noodles, stir-fry with tamarind paste, fish sauce, sugar, bean sprouts, and peanuts until cooked.\nServe with lime wedges, chili flakes, and garnish with cilantro.",
                context: context),
            SizedBox(width: 12),
            buildCard2(name: "Alfredo Pasta",
                photourl: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&q=80&w=2706&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ingredients: "8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
                directions: "Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
                context: context),
            // buildCard(value: 2, context: context),
            // SizedBox(width: 12),
            // buildCard(value: 3, context: context),
            // SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class MyTrendingRecipes extends StatelessWidget {
// \n
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: SingleChildScrollView(
        controller: PageController(viewportFraction: 0.8),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildCard2(name: "Cheese Pizza", photourl: "https://preppykitchen.com/wp-content/uploads/2021/10/Cheese-Pizza-Feature.jpg",
                ingredients: "Pizza sauce, pizza dough, parmesan cheese, and mozzarella cheese",
                directions: "1.Stretch the dough into a circle.\n 2. Spread the pizza sauce onto the dough, leaving a 1-inch border around the edge. \n3. Add mozzarella and parmesan before baking for 12 to 14 minutes, or until the crust is browned and the cheese is bubbling",
                context: context),
            SizedBox(width: 12),
            buildCard2(name: "Greek Salad",
                photourl: "https://www.cookingclassy.com/wp-content/uploads/2018/02/greek-salad-4.jpg",
                ingredients: "Mixed greens, kale, romaine, tomatoes, bell peppers,feta cheese, olives and cucumbers. \nFor dressing: Salt, pepper, olive oil, red wine vinegar, Dijon, mustard, oregano, garlic",
                directions: "",
                context: context),
            SizedBox(width: 12),
            buildCard2(name: "Alfredo Pasta",
                photourl: "https://www.modernhoney.com/wp-content/uploads/2018/08/Fettuccine-Alfredo-Recipe-1.jpg",
                ingredients: "8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
                directions: "Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
                context: context),
                SizedBox(width: 12),
            buildCard2(name: "Classic Burgers",
                photourl: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2004/2/25/0/bw2b07_hambugers1.jpg.rend.hgtvcom.616.462.suffix/1558017418187.jpeg",
                ingredients: "Your choice of buns, ground chuck beef (salt and pepper), your choice of toppings (cheese, tomatoes, pickles, lettuce, and etc",
                directions: "Slice and prepare toppings. Spread the cut-side of the bun with softened or melted butter. Toast if wanted. Preheat grill. Divide ground beef for the patties. Season patties with salt and pepper.Grill hamburger patties and flip them",
                context: context),
            SizedBox(width: 12),
            buildCard2(name: "Tomato Soup",
                photourl: "https://shewearsmanyhats.com/wp-content/uploads/2014/11/tomato-basil-soup-1.jpg",
                ingredients: "Butter, yellow onions, garlic, crushed tomatoes, chicken stock, basil, sugar, black pepper, whipping cream, and parmesan cheese",
                directions: "1. Heat up a Pot and melt 4 TBSP of butter, sauté onions until it’s golden (10 min). Add minced garlic. \n2. Add 2 cans of crushed tomato, chicken stock, chopped basil, sugar and black pepper. \n3. Blend if you want. \n4.Stir heavy cream and shredded parmesan. ENJOY!",
                context: context),
            SizedBox(width: 12),
            buildCard2(name: "Chicken Sooup",
                photourl: "https://theforkedspoon.com/wp-content/uploads/2019/12/Chicken-Soup-6-1.jpg",
                ingredients: "1 chicken breast. 2 tablespoons olive oil. 1 large vidalia onion, diced. 2 large carrots dice. 3 garlic cloves, minced. 1 celery stalk. 5 cups chicken stock, homemade or store bought. 1 tablespoon chopped thyme. 1 tablespoon chopped dill. 1 tablespoon chopped parsley. Salt and ground pepper ",
                directions: "Preheat Oven at 425 degrees. Rub olive oil on the chicken breast and season it with salt and pepper. Roast the chicken for 25 minutes. Cool down the chicken. Shred the chick into small pieces. Get a large pot, add olive oil and heat it in medium. Add onions, carrots, and celery and continue to cook until soft. Stir in the garlic.Transfer the cooked chicken to the pot and stir to combine. Add the chicken stock, herbs, salt and pepper and allow the mixture to come to a boil.",
                context: context),
            SizedBox(width: 12),
            // buildCard(value: 5, context: context),
            // SizedBox(width: 12),
            // buildCard(value: 6, context: context),
            // SizedBox(width: 12),

          ],
        ),
      ),
    );
  }


}


// Widget buildCard({int value = 1, required BuildContext context}) {
//   String image = "nll";
//   String name = "nll";
//
//   switch (value) {
//     case 1:
//       image = 'assets/images/pho.jpeg';
//       name = "Pho";
//       break;
//     case 2:
//       image = 'assets/images/padthai.jpeg';
//       name = "Pad Thai";
//       break;
//     case 3:
//       image = 'assets/images/friedrice.jpeg';
//       name = "Fried Rice";
//       break;
//     case 4:
//       image = 'assets/images/pizza.jpeg';
//       name = "Pizza";
//       break;
//     case 5:
//       image = 'assets/images/greek.jpeg';
//       name = "Greek Salad";
//       break;
//     case 6:
//       image = 'assets/images/burgers.jpeg';
//       name = "Burgers";
//       break;
//     case 7:
//       image = 'assets/images/pasta.jpeg';
//       name = "Alfredo Pasta";
//       break;
//   }
//
//
//   return GestureDetector(
//     onTap: () {
//       // Navigate to the recipe details screen and pass the recipe details.
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => RecipeDetailsScreen(name: name, image: image),
//         ),
//       );
//     },
//     child: SizedBox(
//       height: 260,
//       width: 260,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         color: Colors.lightGreen,
//         elevation: 4,
//         semanticContainer: true,
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           children: [
//             ListTile(
//               title: Text(
//                 name,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               trailing: Favorite(),
//             ),
//             Container(
//               height: 190,
//               width: 260,
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
//
// class RecipeDetailsScreen extends StatelessWidget {
//   final String name;
//   final String image;
//
//   RecipeDetailsScreen({required this.name, required this.image});
//
//   // Define the ingredient list and directions for the Pho recipe
//   final Map<String, String> recipesData = {
//     "Fried Rice": "Rice, Egg, Seasoning, Green Bean, Garlic, Carrot, Choice of Meat (Chicken, Shrimp, ...).",
//     "Pho": "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
//     "Pad Thai": "", // Leave this one blank
//     "Alfredo Pasta":"8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
//     "Burgers":"Your choice of buns, ground chuck beef (salt and pepper), your choice of toppings (cheese, tomatoes, pickles, lettuce, and etc",
//     "Pizza":"Pizza sauce, pizza dough, parmesan cheese, and mozzarella cheese",
//     "Greek Salad":"Mixed greens, kale, romaine, tomatoes, bell peppers,feta cheese, olives and cucumbers. For dressing: Salt, pepper, olive oil, red wine vinegar, Dijon, mustard, oregano, garlic",
//   };
//
//   final Map<String, String> directionsData = {
//     "Fried Rice": "Fried everything.",
//     "Pho": "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",
//     "Pad Thai": "", // Leave this one blank\
//     "Alfred Pasta":"Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
//     "Burgers":"Slice and prepare toppings. Spread the cut-side of the bun with softened or melted butter. Toast if wanted. Preheat grill. Divide ground beef for the patties. Season patties with salt and pepper.Grill hamburger patties and flip them.",
//     "Pizza":"1.Stretch the dough into a circle. 2. Spread the pizza sauce onto the dough, leaving a 1-inch border around the edge.3. Add mozzarella and parmesan before baking for 12 to 14 minutes, or until the crust is browned and the cheese is bubbling.",
//     "Greek Salad":"Add the veggies, olives, and feta cheese in an easy homemade Greek salad dressing. Mix all dressing ingredients together!",
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           Image.asset(image),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Ingredients:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(recipesData[name] ?? "No information available."),
//                 SizedBox(height: 16),
//                 Text(
//                   'Directions:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(directionsData[name] ?? "No information available."),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
// class Favorite extends StatefulWidget {
//   const Favorite({Key? key}) : super(key: key);
//
//   @override
//   State<Favorite> createState() => _FavoriteState();
// }
//
// class _FavoriteState extends State<Favorite> {
//   bool isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         icon: Icon(
//           Icons.favorite,
//           color: isSelected ? Colors.red : Colors.grey,
//         ),
//         onPressed: () {
//           setState(() {
//             isSelected = !isSelected;
//           });
//           print('like');
//         });
//   }
// }

