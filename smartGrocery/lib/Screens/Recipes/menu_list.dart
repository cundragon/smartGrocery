// Group #8, CS 440, Fall 2023

import 'package:flutter/material.dart';
import 'american_menu.dart';
import 'Italian_menu.dart';
import 'mexican_menu.dart';
import 'asian_menu.dart';


class MenuListPage extends StatefulWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  _MenuListPageState createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  String selectedCuisine = 'American'; // Default selected cuisine
  final AmericanMenu americanMenu = AmericanMenu();
  final ItalianMenu italianMenu = ItalianMenu();
  final MexicanMenu mexicanMenu = MexicanMenu();
  final AsianMenu asianMenu = AsianMenu(); // Create an instance of AsianMenu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Menu List - $selectedCuisine'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: selectedCuisine,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCuisine = newValue!;
                  });
                },
                items: <String>['American', 'Italian', 'Mexican', 'Asian']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              // Call buildCard and pass the selected cuisine
              buildCard(selectedCuisine),

              // Display dishes based on the selected cuisine
              if (selectedCuisine == 'American')
                Column(
                  children: americanMenu.dishesWithRecipes.keys.map((dish) {
                    final dishData = americanMenu.dishesWithRecipes[dish]!;
                    return RecipeSummaryTile(
                      dish: dish,
                      recipe: dishData['recipe']!,
                      image: dishData['image']!,
                    );
                  }).toList(),
                ),
              if (selectedCuisine == 'Italian')
                Column(
                  children: italianMenu.dishesWithRecipes.keys.map((dish) {
                    final dishData = italianMenu.dishesWithRecipes[dish]!;
                    return RecipeSummaryTile(
                      dish: dish,
                      recipe: dishData['recipe']!,
                      image: dishData['image']!,
                    );
                  }).toList(),
                ),

              if (selectedCuisine == 'Mexican')
                Column(
                  children: mexicanMenu.dishesWithRecipes.keys.map((dish) {
                    final dishData = mexicanMenu.dishesWithRecipes[dish]!;
                    return RecipeSummaryTile(
                      dish: dish,
                      recipe: dishData['recipe']!,
                      image: dishData['image']!,
                    );
                  }).toList(),
                ),
              if (selectedCuisine == 'Asian')
                Column(
                  children: asianMenu.dishesWithRecipes.keys.map((dish) {
                    final dishData = asianMenu.dishesWithRecipes[dish]!;
                    return RecipeSummaryTile(
                      dish: dish,
                      recipe: dishData['recipe']!,
                      image: dishData['image']!,
                    );
                  }).toList(),
                ),

              // Add conditions for other cuisines...

            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build each dish card
  Widget buildCard(String selectedCuisine) {
    String image = "nll";
    String name = "nll";

    switch (selectedCuisine) {
      case 'American':
        image = "https://c8.alamy.com/comp/F4WK8N/a-vector-illustration-of-american-food-icons-F4WK8N.jpg";
        name = "American Cuisine";
        break;

      case 'Italian':
        image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZdtzLbe4AiLLyuEKFgu7-Jx9_Rm78kPF4Og&usqp=CAU";
        name = "Italian Cuisine";
        break;

      case 'Mexican':
        image = "https://as1.ftcdn.net/v2/jpg/05/75/92/52/1000_F_575925228_507KEdVgb5YCGTnAlpInP748dIOu45r6.jpg";
        name = "Mexican Cuisine";
        break;

      case 'Asian':
        image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNEiH6Xa6S2HJ353kSZk5ziBQXcd590zdSJ45wCP5-L6xvpe-Px2GPDgoZabvFlxUAVRs&usqp=CAU";
        name = "Asian Cuisine";
        break;
    }

    return SizedBox(
      height: 300,
      width: 400,
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
            ),
            Container(
              height: 200,
              width: 300,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeSummaryTile extends StatelessWidget {
  final String dish;
  final String recipe;
  final String image;

  const RecipeSummaryTile({
    required this.dish,
    required this.recipe,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(dish),
      leading: Container(
        width: 50.0,
        height: 50.0,
        child: ClipOval(
          child: Image.network(
            image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image for $dish: $error');
              return const FlutterLogo(size: 50.0);
            },
          ),
        ),
      ),
      onTap: () {
        _showRecipeDialog(context, dish, recipe);
      },
    );
  }

  void _showRecipeDialog(BuildContext context, String dishName, String recipe) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(dishName),
          content: SingleChildScrollView(
            child: Text(
              recipe,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
