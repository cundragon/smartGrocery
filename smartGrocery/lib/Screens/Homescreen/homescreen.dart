import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Communitypage/community_screen.dart';
import '../Recipes/foryou.dart';
import '../Recipes/recipeclass.dart';
import '../Stores/store_screen.dart';
import 'navbar.dart';

import 'package:easy_search_bar/easy_search_bar.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: NavBar(),
//       appBar: AppBar(
//         title: Text('Smart Grocery'),
//         backgroundColor: Colors.green,
//       ),
//       body: const Center(
//
//         child: Text(
//           'Main Page',
//           style: TextStyle(fontSize: 40.0),
//         ),
//       ),
//     );
//   }
// }


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Pho',
    'pad Thai',
    'Alfredo Pasta',
    'Burgers'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            appBar: EasySearchBar(
                backgroundColor: Colors.green,
                title: const Text('Home Page'),
                onSearch: (value) => setState(() => searchValue = value),
                onSuggestionTap: ((value) {
                  if (value == "Pho") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  RecipeDetailsScreen(
                        name: "Pho", photourl: "https://plus.unsplash.com/premium_photo-1694699355274-862bfb5ae036?auto=format&fit=crop&q=80&w=3087&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
                        directions: "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",

                      )),
                    );
                  } else if (value == "Pad Thai") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  RecipeDetailsScreen(
                        name: "Pad Thai",
                        photourl: "https://plus.unsplash.com/premium_photo-1664472637341-3ec829d1f4df?auto=format&fit=crop&q=80&w=3125&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "stir-fried rice noodles with eggs, vegetables and tofu in a sauce of tamarind, fish, dried shrimp, garlic, red chilli pepper and sugar",
                        directions: "Soak rice noodles in warm water. Sauté tofu/prawns, garlic, and tofu/chicken in a wok. Add soaked noodles, stir-fry with tamarind paste, fish sauce, sugar, bean sprouts, and peanuts until cooked.\nServe with lime wedges, chili flakes, and garnish with cilantro.",

                      )),
                    );
                  } else if (value == "Alfredo Pasta") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  RecipeDetailsScreen(
                        name: "Alfredo Pasta",
                        photourl: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&q=80&w=2706&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
                        directions: "Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",

                      )),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  RecipeDetailsScreen(
                        name: "Burgers",
                        photourl: "https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&q=80&w=2097&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ingredients: "//Your choice of buns, ground chuck beef (salt and pepper), your choice of toppings (cheese, tomatoes, pickles, lettuce, and etc",
                        directions: "Slice and prepare toppings. Spread the cut-side of the bun with softened or melted butter. Toast if wanted. Preheat grill. Divide ground beef for the patties. Season patties with salt and pepper.Grill hamburger patties and flip them.",

                      )),
                    );
                  }
                }),
                suggestions: _suggestions,
                suggestionTextStyle: TextStyle(
                  fontSize: 18.0,
                ),
                suggestionBackgroundColor: Colors.white,
            ),
            drawer: NavBar(),
            body: SingleChildScrollView(
                child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft, // Aligns the text to the top-left
                        margin: EdgeInsets.all(16), // Add margin for spacing
                        child: Text(
                          'Trending',
                          style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle the "See All" button tap here
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  CommunityPage()),
                              );
                            },
                            child: Text("See All"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('recipes').limit(5).snapshots(),
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
                  //RecipeListWidget(),


            //       SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //
            //   children: [
            //     buildCard2(name: "Pho", photourl: "https://plus.unsplash.com/premium_photo-1694699355274-862bfb5ae036?auto=format&fit=crop&q=80&w=3087&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //         ingredients: "Pho noodle, beef, beef bone, beef ball, ginger, onion, pho spices, ...",
            //         directions: "Grill onion, ginger, pho spices until smell good. Clean beef bone well. Cook them with water for 2-3 hours...",
            //         context: context),
            //     SizedBox(width: 12),
            //     buildCard2(name: "Pad Thai",
            //         photourl: "https://plus.unsplash.com/premium_photo-1664472637341-3ec829d1f4df?auto=format&fit=crop&q=80&w=3125&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //         ingredients: "stir-fried rice noodles with eggs, vegetables and tofu in a sauce of tamarind, fish, dried shrimp, garlic, red chilli pepper and sugar",
            //         directions: "Soak rice noodles in warm water. Sauté tofu/prawns, garlic, and tofu/chicken in a wok. Add soaked noodles, stir-fry with tamarind paste, fish sauce, sugar, bean sprouts, and peanuts until cooked.\nServe with lime wedges, chili flakes, and garnish with cilantro.",
            //         context: context),
            //     SizedBox(width: 12),
            //     buildCard2(name: "Alfredo Pasta",
            //         photourl: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&q=80&w=2706&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //         ingredients: "8 ounce pasta, 4 tablespoon butter,2 cloves garlic, 3/2 cups milk, 1 cup heavy cream, 1/2 cup Parmesan cheese, 1/4 teaspoon salt, 1/4 teaspoon pepper, 2 tablespoon fresh parsley",
            //         directions: "Cook pasta, melt butter in a large skillet.Cook garlic for 30 seconds.Pour milk & cream and stir until it comes to a boil.Add parmesan cheese, salt, and pepper.Remove from heat and add the pasta until sauce is thicken. Add parsley!",
            //         context: context),
            //     SizedBox(width: 12),
            //     buildCard2(name: "Burgers",
            //         photourl: "https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&q=80&w=2097&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            //         ingredients: "//Your choice of buns, ground chuck beef (salt and pepper), your choice of toppings (cheese, tomatoes, pickles, lettuce, and etc",
            //         directions: "Slice and prepare toppings. Spread the cut-side of the bun with softened or melted butter. Toast if wanted. Preheat grill. Divide ground beef for the patties. Season patties with salt and pepper.Grill hamburger patties and flip them.",
            //         context: context),
            //   ],
            // )
            // ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft, // Aligns the text to the top-left
                        margin: EdgeInsets.all(16), // Add margin for spacing
                        child: Text(
                          'For You',
                          style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle the "See All" button tap here
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Foryou()),
                              );
                            },
                            child: Text("See All"),
                          ),
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
                  ),    ]
    )
            ) );
  }
}

Widget buildCard({int value = 1}) {
  String image = "nll";
  String name = "nll";
  switch(value) {
    case 1:
      image = "https://plus.unsplash.com/premium_photo-1664475934279-2631a25c42ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80";
      name = "Ramen";
    case 2:
      image = "https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1928&q=80";
      name = "Pizza";
    case 3:
      image = "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80";
      name = "Pasta";
    case 4:
      image = "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1998&q=80";
      name = "Burger";
    case 5:
      image = "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80";
      name = "French Fries";
    case 6:
      image = "https://images.unsplash.com/photo-1512058564366-18510be2db19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2072&q=80";
      name = "Fried Rice";

  }


  return SizedBox(
      height: 200, width: 200,
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
              title: Text(name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              trailing: favorite(),

            ),
            Container(
              height: 136,
              width: 200,
              child: Image.network(image,
              fit: BoxFit.cover
              ),
              ),
          ],
        ),
      )
  );
}

class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return  IconButton(
        icon: Icon(
          Icons.favorite,
          color: isSelected ? Colors.red : Colors.grey,
        ),
        onPressed: (){
          setState(() {
            isSelected = !isSelected;
          });
          print('home');}
    );
  }
}


