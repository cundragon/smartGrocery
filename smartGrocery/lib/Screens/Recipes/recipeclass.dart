
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Stores/store_screen.dart';

Future<void> saveRecipe(Recipe recipe) async {

}

class Recipe {
  final String name;
  final String photourl;
  final String ingredients;
  final String directions;
  final String user;


  Recipe({
    required this.name,
    required this.photourl,
    required this.ingredients,
    required this.directions,
    required this.user,

  });



  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photourl': photourl,
      'ingredients': ingredients,
      'directions': directions,
      'user': user,
    };
  }
}

Future<String?> getUserName(String userId) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('userInfo')
        .doc('userDetails')
        .get();

    if (userSnapshot.exists) {
      print(userSnapshot.data()?['name']);
      return userSnapshot.data()?['name'];
    } else {
      // User not found or 'userDetails' document does not exist
      return null;
    }
  } catch (e) {
    print("Error: $e");
    // Handle the error
    return null;
  }
}


Widget buildCard2({required name, required photourl, required ingredients, required directions, required BuildContext context}) {





  return GestureDetector(
    onTap: () {
      // Navigate to the recipe details screen and pass the recipe details.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailsScreen(name: name, photourl: photourl, ingredients: ingredients, directions: directions,),
        ),
      );
    },
    child: SizedBox(
      height: 260,
      width: 260,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.lightGreen,
        elevation: 4,
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Favorite(),
            ),
            Container(
              height: 190,
              width: 260,
              child: Image.network(photourl, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    ),
  );
}


class RecipeDetailsScreen extends StatelessWidget {
  final String name;
  final String photourl;
  final String ingredients;
  final String directions;

  RecipeDetailsScreen({required this.name, required this.photourl, required this.ingredients, required this.directions});

  // Define the ingredient list and directions for the Pho recipe
  // final Map<String, String> recipesData = {
  //   "Fried Rice": "Rice, Egg, Seasoning, Green Bean, Garlic, Carrot, Choice of Meat (Chicken, Shrimp, ...).",
  //   "Pho": "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
  //   "Pad Thai": "", // Leave this one blank
  //   "Alfredo Pasta":"8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
  //   "Burgers":"Your choice of buns, ground chuck beef (salt and pepper), your choice of toppings (cheese, tomatoes, pickles, lettuce, and etc",
  //   "Pizza":"Pizza sauce, pizza dough, parmesan cheese, and mozzarella cheese",
  //   "Greek Salad":"Mixed greens, kale, romaine, tomatoes, bell peppers,feta cheese, olives and cucumbers. For dressing: Salt, pepper, olive oil, red wine vinegar, Dijon, mustard, oregano, garlic",
  // };

  // final Map<String, String> directionsData = {
  //   "Fried Rice": "Fried everything.",
  //   "Pho": "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",
  //   "Pad Thai": "", // Leave this one blank\
  //   "Alfred Pasta":"Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
  //   "Burgers":"Slice and prepare toppings. Spread the cut-side of the bun with softened or melted butter. Toast if wanted. Preheat grill. Divide ground beef for the patties. Season patties with salt and pepper.Grill hamburger patties and flip them.",
  //   "Pizza":"1.Stretch the dough into a circle. 2. Spread the pizza sauce onto the dough, leaving a 1-inch border around the edge.3. Add mozzarella and parmesan before baking for 12 to 14 minutes, or until the crust is browned and the cheese is bubbling.",
  //   "Greek Salad":"Add the veggies, olives, and feta cheese in an easy homemade Greek salad dressing. Mix all dressing ingredients together!",
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Image.network(photourl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(ingredients ?? "No information available."),
                SizedBox(height: 16),
                Text(
                  'Directions:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(directions ?? "No information available."),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.shop),
        onPressed: () {
    // Handle the "See All" button tap here
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Storescreen()),
    );}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

Widget buildCard3({required name, required photourl, required ingredients, required directions, required uid, required BuildContext context}) {





  return GestureDetector(
    onTap: () {
      // Navigate to the recipe details screen and pass the recipe details.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeDetailsScreen2(name: name, photourl: photourl, ingredients: ingredients, directions: directions, uid: uid),
        ),
      );
    },
    child: SizedBox(
      height: 260,
      width: 260,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.lightGreen,
        elevation: 4,
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Favorite2(name: name, photourl: photourl, ingredients: ingredients, directions: directions, uid: uid),
            ),
            Container(
              height: 190,
              width: 260,
              child: Image.network(photourl, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    ),
  );
}


class RecipeDetailsScreen2 extends StatelessWidget {
  final String name;
  final String photourl;
  final String ingredients;
  final String directions;
  final String uid;

  RecipeDetailsScreen2({required this.name, required this.photourl, required this.ingredients, required this.directions,
  required this.uid});

  // Define the ingredient list and directions for the Pho recipe
  // final Map<String, String> recipesData = {
  //   "Fried Rice": "Rice, Egg, Seasoning, Green Bean, Garlic, Carrot, Choice of Meat (Chicken, Shrimp, ...).",
  //   "Pho": "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
  //   "Pad Thai": "", // Leave this one blank
  //   "Alfredo Pasta":"8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
  //   "Burgers":"Your choice of buns, ground chuck beef (salt and pepper), your choice of toppings (cheese, tomatoes, pickles, lettuce, and etc",
  //   "Pizza":"Pizza sauce, pizza dough, parmesan cheese, and mozzarella cheese",
  //   "Greek Salad":"Mixed greens, kale, romaine, tomatoes, bell peppers,feta cheese, olives and cucumbers. For dressing: Salt, pepper, olive oil, red wine vinegar, Dijon, mustard, oregano, garlic",
  // };

  // final Map<String, String> directionsData = {
  //   "Fried Rice": "Fried everything.",
  //   "Pho": "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",
  //   "Pad Thai": "", // Leave this one blank\
  //   "Alfred Pasta":"Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
  //   "Burgers":"Slice and prepare toppings. Spread the cut-side of the bun with softened or melted butter. Toast if wanted. Preheat grill. Divide ground beef for the patties. Season patties with salt and pepper.Grill hamburger patties and flip them.",
  //   "Pizza":"1.Stretch the dough into a circle. 2. Spread the pizza sauce onto the dough, leaving a 1-inch border around the edge.3. Add mozzarella and parmesan before baking for 12 to 14 minutes, or until the crust is browned and the cheese is bubbling.",
  //   "Greek Salad":"Add the veggies, olives, and feta cheese in an easy homemade Greek salad dressing. Mix all dressing ingredients together!",
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<String?>(
        future: getUserName(uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Data is still loading
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error occurred
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            // User not found or data is null
            return Center(child: Text('User not found'));
          } else {
            // Display the user name
            return ListView(
              children: [
                Image.network(photourl),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recipe by: ${snapshot.data}',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),

                      SizedBox(height: 16),
                      Text(
                        'Ingredients:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(ingredients ?? "No information available."),
                      SizedBox(height: 16),
                      Text(
                        'Directions:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(directions ?? "No information available."),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.shop),
          onPressed: () {
            // Handle the "See All" button tap here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Storescreen()),
            );}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}


class Favorite extends StatefulWidget {

  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.favorite,
          color: isSelected ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
            if (isSelected) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Added to Favorite"),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Removed from Favorite"),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            }

          }

          );
          print('like');
        });
  }
}

class Favorite2 extends StatefulWidget {
  final String name;
  final String photourl;
  final String ingredients;
  final String directions;
  final String uid;

  const Favorite2({
    Key? key,
    required this.name,
    required this.photourl,
    required this.ingredients,
    required this.directions,
    required this.uid,
  }) : super(key: key);
  Future<void> _favoriteRecipe(BuildContext context) async {
    Recipe recipe = Recipe(name: name, photourl: photourl,
        ingredients: ingredients,
        directions: directions,
        user: uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favoriteRecipes')
        .doc(recipe.name)
        .set(recipe.toMap());

  }
  Future<void> _unfavoriteRecipe(BuildContext context) async {
    Recipe recipe = Recipe(name: name, photourl: photourl,
        ingredients: ingredients,
        directions: directions,
        user: uid);
    DocumentReference recipeReference = FirebaseFirestore.instance.collection('users').doc(uid)
        .collection('favoriteRecipes').doc(recipe.name);

    // Delete the document
    await recipeReference.delete();


  }

  @override
  State<Favorite2> createState() => _FavoriteState2();
}

class _FavoriteState2 extends State<Favorite2> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.favorite,
          color: isSelected ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
            if (isSelected) {

              widget._favoriteRecipe(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Added to Favorite"),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );

            } else {
              widget._unfavoriteRecipe(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Removed from Favorite"),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            }

          }

          );
          print('like');
        });
  }
}

Future<List<Map<String, dynamic>>> getRecipes() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('recipes').get();

  List<Map<String, dynamic>> recipes = [];

  for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot in querySnapshot.docs) {
    Map<String, dynamic> recipe = documentSnapshot.data()!;
    recipes.add(recipe);
    print('Recipe:');
    print('Name: ${recipe['name']}');
    print('Ingredients: ${recipe['ingredients']}');
    print('Directions: ${recipe['directions']}');
    print('Photo: ${recipe['photourl']}');
    print('--------------------');
  }

  return recipes;
}

class RecipeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getRecipes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No recipes found.');
        } else {
          List<Map<String, dynamic>> recipes = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: recipes.map((recipe) {
                String name = recipe['name'] ?? 'No Name';
                String photoUrl = recipe['photourl'] ?? 'https://as2.ftcdn.net/v2/jpg/01/36/70/67/1000_F_136706734_KWhNBhLvY5XTlZVocpxFQK1FfKNOYbMj.jpg';
                String ingredients = recipe['ingredients'] ?? 'No Ingredients';
                String directions = recipe['directions'] ?? 'No Directions';

                return buildCard2(
                  name: name,
                  photourl: photoUrl,
                  ingredients: ingredients,
                  directions: directions,
                  context: context,
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}