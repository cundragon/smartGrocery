import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Recipes/recipeclass.dart';

import '../Homescreen/homescreen.dart';

class Foryou extends StatelessWidget {
  const Foryou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('For you'),
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
                    'Vegan',
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],


            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: [
                    buildCard2(name: "Vegan Black Beans Taco",
                        photourl: "https://images.unsplash.com/photo-1593759608136-45eb2ad9507d?auto=format&fit=crop&q=80&w=2959&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "Black beans, corn, avocado, lettuce, tomato, taco shells.",
                        directions: "Mash beans, mix with corn, fill taco shells, top with veggies",
                        context: context),
                    SizedBox(width: 12),
                    buildCard2(name: "Vegan Pasta Primavera",
                        photourl: "https://images.unsplash.com/photo-1516100882582-96c3a05fe590?auto=format&fit=crop&q=80&w=2592&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "Pasta, assorted veggies, olive oil, garlic, herbs.",
                        directions: "Sauté veggies in olive oil, toss with cooked pasta and herbs.",
                        context: context),
                    SizedBox(width: 12),
                    buildCard2(name: "Chickpea Curry",
                        photourl: "https://images.unsplash.com/photo-1516714435131-44d6b64dc6a2?auto=format&fit=crop&q=80&w=2000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "Chickpeas, coconut milk, onion, tomato, spices.",
                        directions: "Sauté onion, add tomato, spices, chickpeas, and coconut milk. Simmer.",
                        context: context),
                    SizedBox(width: 12,),
                    buildCard2(name: "Vegan Burger", photourl: "https://plus.unsplash.com/premium_photo-1673809798626-cc94ebab0815?auto=format&fit=crop&q=80&w=3164&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "Sweet potatoes, black beans, oats, onion, cumin, paprika.",
                        directions: "Mash beans, mix with cooked sweet potatoes, oats, onion, and spices. Form patties and bake.",
                        context: context)
                  ],
                )
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft, // Aligns the text to the top-left
                  margin: EdgeInsets.all(16), // Add margin for spacing
                  child: Text(
                    'Glutten Free',
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],


            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: [
                    buildCard2(name: "Gluten-Free Banana Pancake",
                        photourl: "https://www.mamaknowsglutenfree.com/wp-content/uploads/2021/08/gluten-free-banana-pancakes-rc-1-1.jpg",
                        ingredients: "2 ripe bananas, 2 eggs, 1/2 teaspoon baking powder (glutenfree), 1/2 teaspoon vanilla extract, Cooking oil or butter for the pan",
                        directions: "   1. Mash the bananas in a bowl. \n"
                            "2. Add eggs, baking powder, and vanilla extract. Mix well. \n"
                            "3. Heat a nonstick skillet or frying pan over medium heat and add a small amount of oil or butter. \n"
                            "4. Pour small amounts of the banana batter onto the skillet to make pancakes. \n"
                            "5. Cook until bubbles form on the surface, then flip and cook the other side until golden brown. \n"
                            "6. Serve with your favorite toppings, such as maple syrup, fresh fruit, or nuts. \n",
                        context: context),
                    SizedBox(width: 12),
                    buildCard2(name: "GlutenFree StirFry",
                        photourl: "https://food-fanatic-res.cloudinary.com/iu/s--PbWQt3N1--/c_thumb,f_auto,g_auto,h_1200,q_auto,w_1200/v1474055720/gluten-free-stir-fry-photo",
                        ingredients: "1 pound boneless chicken, beef, or tofu (cut into bite size pieces)"
                            "Assorted vegetables (bell peppers, broccoli, carrots, etc.)"
                            "Gluten Free stir fry sauce (check labels for gluten)"
                            "Cooking oil",
                        directions: "1. Heat oil in a large skillet or wok over medium high heat.\n"
                            "2. Add the protein and stirfry until cooked through. Remove from the pan and set aside.\n"
                            "3. Add more oil to the pan and stirfry your choice of vegetables until tendercrisp.\n"
                            "4. Return the cooked protein to the pan and pour the gluten free stirfry sauce over the ingredients.\n"
                            "5. Stirfry for a few more minutes until everything is heated through.\n"
                            "6. Serve over rice or gluten free noodles.\n",
                        context: context),
                    SizedBox(width: 12),
                    buildCard2(name: "GlutenFree Caprese Salad",
                        photourl: "https://glutenfreeitalianeats.com/wp-content/uploads/2022/06/close-up-of-caprese-salad-2.jpg",
                        ingredients: "Ripe tomatoes, sliced"
                            "Fresh mozzarella cheese, sliced"
                            "Fresh basil leaves"
                            "Extra Virgin olive oil"
                            "Balsamic vinegar (check labels for gluten)"
                            "Salt and pepper to taste",
                        directions: " 1. Arrange alternating slices of tomatoes, mozzarella, and basil on a plate."
                            "2. Drizzle with extra virgin olive oil and balsamic vinegar."
                            "3. Season with salt and pepper to taste."
                            "4. Serve as a fresh and simple gluten free salad.",
                        context: context),
                    SizedBox(width: 12,),

                  ],
                )
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft, // Aligns the text to the top-left
                  margin: EdgeInsets.all(16), // Add margin for spacing
                  child: Text(
                    'Asian',
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],


            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: [
                    buildCard2(name: "Bok Choy in Ginger Sauce",
                        photourl: "https://www.recipetineats.com/wp-content/uploads/2023/09/Bok-choy-with-ginger-sauce_7.jpg",
                        ingredients: "6 small bok choy or other Asian greens\n"
                            "2 tbsp vegetable oil\n"
                            "1/4 cup ginger (or 1 tbsp garlic), finely julienned\n"
                            "1/4 cup water\n\n"
                            "Sauce:\n"
                            "3 tsp cornflour/cornstarch\n"
                            "1 1/2 tsp light soy sauce (or all-purpose soy)\n"
                            "1 tsp oyster sauce (or substitute vegetarian oyster sauce)\n"
                            "2 tsp Chinese cooking wine\n"
                            "1 tsp toasted sesame oil\n"
                            "1/4 cup water\n"
                            "1/4 tsp cooking salt\n"
                            "Pinch of white pepper\n\n",
                        directions: "1. Trim the base of the bok choy and separate the leaves. Leave baby bok choy intact and cut large stems in half lengthwise. Rinse and shake off excess water.\n'"
                            "2. In a jug, mix the sauce ingredients (excluding water) until smooth, then add water.\n"
                            "3. Sauté ginger (or garlic) in oil until slightly golden and floppy. Add bok choy and toss for 15 seconds.\n"
                            "4. Steam for 45 seconds, then pour in the sauce and toss for 30 seconds until it thickens. Bok choy should be tender but still crisp. If the sauce gets too thick, add a splash of water.\n"
                            "5. Serve your Bok Choy in Ginger Sauce hot and enjoy!",
                        context: context),
                    SizedBox(width: 12),
                    buildCard2(name: "Pad Thai",
                        photourl: "https://www.recipetineats.com/wp-content/uploads/2020/01/Chicken-Pad-Thai_9-SQ.jpg",
                        ingredients: "125g (4oz) dried rice sticks (Pad Thai noodles)\n"
                            "Sauce:\n"
                            "1 1/2 tbsp tamarind puree\n"
                            "3 tbsp brown sugar\n"
                            "2 tbsp fish sauce\n"
                            "1 1/2 tbsp oyster sauce\n"
                            "Stir Fry:\n"
                            "2-3 tbsp vegetable or canola oil\n"
                            "1/2 onion, sliced\n"
                            "2 garlic cloves, finely chopped\n"
                            "150g (5oz) chicken breast or thigh, thinly sliced\n"
                            "2 eggs, lightly whisked\n"
                            "1 1/2 cups of bean sprouts\n"
                            "1/2 cup firm tofu, cut into batons\n"
                            "1/4 cup garlic chives, cut into pieces\n"
                            "1/4 cup finely chopped peanuts\n"
                            "For Serving:\n"
                            "Lime wedges (essential)\n"
                            "Ground chili or cayenne pepper (optional)\n"
                            "Extra bean sprouts\n",
                        directions: '1. Soak noodles in boiling water for 5 minutes, then drain and rinse under cold water. Don’t let them sit for more than 5-10 minutes.\n'
                            '2. Mix the sauce ingredients in a small bowl.\n'
                            '3. Heat oil in a large pan over high heat. Add garlic and onion, cook for 30 seconds.\n'
                            '4. Add chicken and cook until mostly done, about 1 1/2 minutes.\n'
                            '5. Push chicken to one side, pour beaten eggs on the other side. Scramble, then mix into the chicken.\n'
                            '6. Add bean sprouts, tofu, noodles, and sauce. Toss for about 1 1/2 minutes until the sauce is absorbed by the noodles.\n'
                            '7. Add garlic chives and half the peanuts. Toss quickly and remove from heat.\n'
                            '8. Serve immediately, topped with remaining peanuts and lime wedges. '
                            'Sprinkle with chili and extra bean sprouts on the side if desired. Squeeze lime juice to taste before eating.',
                        context: context),
                    SizedBox(width: 12),
                    buildCard2(name: "Stir-Fried Garlic Shrimp",
                        photourl: "https://tipbuzz.com/wp-content/uploads/HONEY-GARLIC-SHRIMP-Stir-Fry--500x500.jpg",
                        ingredients: "1 lb large shrimp, peeled and deveined"
                            "4 cloves garlic, minced"
                            "2 tbsp vegetable oil"
                            "1 red bell pepper, thinly sliced"
                            "1 yellow bell pepper, thinly sliced"
                            "1 small onion, thinly slices"
                            "1/4 cup soy sauce"
                            "1 tbsp oyster sauce"
                            "1 tsp sugar"
                            "1/2 tsp red pepper flakes (adjust to taste)"
                            "Fresh cilantro leaves for garnish (optional)"
                            "Cooked rice for serving",
                        directions: "Mix soy sauce, oyster sauce, and sugar in a small bowl."
                            "Sauté garlic and red pepper flakes in hot oil until fragrant."
                            "Add onions and bell peppers, stir-fry until slightly tender."
                            "Add shrimp and cook until pink and opaque."
                            "Pour sauce over shrimp and veggies, cook for 1-2 minutes."
                            "Adjust seasoning to taste."
                            "Serve over cooked rice and garnish with cilantro.",
                        context: context),
                    SizedBox(width: 12,),

                  ],
                )
            ),
          ],
        )

    );
  }
}
