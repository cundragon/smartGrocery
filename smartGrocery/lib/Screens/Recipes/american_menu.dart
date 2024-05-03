// Group #8, CS 440, Fall 2023
// american_menu.dart
// references
// https://www.allrecipes.com/recipe/25321/eggplant-parmesan-ii/?print
// https://addapinch.com/squash-casserole-recipe/#wprm-recipe-container-28583

class AmericanMenu {
  final Map<String, Map<String, String>> dishesWithRecipes = {
  'Basic Burger': {
    'recipe': 'Prep Time: 5 mins\nCook Time: 15 mins\n'
    'Total Time: 20 mins\nServings: 4\nYield: 4 burgers patties\n\n'
    'Ingredients:\n'
    '1 pound ground beef\n'
    '1/2 cup fine dry bread crumbs\n'
    '1/4 cup minced onion\n'
    '1/4 cup milk\n'
    '1/4 cup ketchup\n'
    '1/2 teaspoon salt\n'
    '1/8 teaspoon ground black pepper\n'
    '\nDirections:\n'
    '1. In a large bowl, combine ground beef, bread crumbs, minced onion, milk,'
    ' ketchup, salt, and pepper. Mix well and form into 4 patties.\n'
    '2. Preheat an outdoor grill for high heat and lightly oil the grate.\n'
    '3. Grill patties for 6 to 8 minutes on each side, or until well done. Serve hot and enjoy!',

    'image': 'https://i.pinimg.com/736x/69/d1/79/69d17925f7d71d644019d430ce2565a9.jpg',
  },
  'Hot Dog': {
      'recipe': 'Prep Time: 2 mins\nCook Time: 10 mins\n'
          'Total Time: 12 mins\nServings: 4\nYield: 4 hot dogs\n\n'
          'Ingredients:\n'
          '4 hot dog buns\n'
          '4 beef hot dogs\n'
          'Ketchup and mustard (optional)\n'
          'Chopped onions (optional)\n'
          'Pickle relish (optional)\n'
          '\nDirections:\n'
          '1. Heat a grill or stovetop griddle over medium-high heat.\n'
          '2. Place the hot dogs on the grill or griddle and cook for 5-7 minutes,'
          ' turning occasionally until they are heated through and have grill marks.\n'
          '3. Serve the hot dogs in buns and add your favorite toppings, '
          'such as ketchup, mustard, chopped onions, and pickle relish.',

      'image': 'https://www.foodandwine.com/thmb/0fO2iubr24kzX7Ky33S5-p0R7yo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/best-hot-dogs-in-every-state-FT-BLOG1020-6e025500cefb480ba986b163792ec790.jpg',
  },
  'Pizza': {
    'recipe': 'Prep Time: 15 mins\nCook Time: 20 mins\n'
        'Total Time: 35 mins\nServings: 4\nYield: 1 large pizza\n\n'
        'Ingredients:\n'
        '1 pizza dough\n'
        '1/2 cup pizza sauce\n'
        '1 1/2 cups shredded mozzarella cheese\n'
        'Your favorite pizza toppings (e.g., pepperoni, bell peppers, olives, etc.)\n'
        '\nDirections:\n'
        '1. Preheat your oven to 475°F (245°C) or follow the pizza dough instructions.\n'
        '2. Roll out the pizza dough on a floured surface to your desired thickness.\n'
        '3. Transfer the dough to a pizza pan or baking sheet.\n'
        '4. Spread pizza sauce over the dough and top with mozzarella cheese and your favorite toppings.\n'
        '5. Bake in the preheated oven for about 15-20 minutes or until the crust is golden and the cheese '
        'is bubbly.\n'
        '6. Slice and serve your delicious homemade pizza!',

    'image': 'https://www.allrecipes.com/thmb/iXKYAl17eIEnvhLtb4WxM7wKqTc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/240376-homemade-pepperoni-pizza-Beauty-3x4-1-6ae54059c23348b3b9a703b6a3067a44.jpg',
  },
  'Fried Chicken': {
  'recipe': 'Prep Time: 15 minutes\nCook Time: 30 minutes\n'
      'Total Time: 45 minutes\nServings: 4 servings\n\n'
      'Ingredients:\n'
      '1 frying chicken, cut up\n'
      'Salt and pepper\n'
      '1 ½ cups self-rising flour\n'
      'Peanut oil\n'
      '\nDirections:\n'
      '1. Season chicken pieces with salt and pepper on both sides.\n'
      '2. Coat the chicken with self-rising flour.\n'
      '3. Heat peanut oil in a large skillet.\n'
      '4. Fry chicken in the hot oil until golden brown and cooked through.\n'
      '5. Drain on paper towels or a rack.\n'
      '\nNotes:\n'
      'Feel free to add additional seasonings like cayenne or hot pepper sauces if desired. Peanut oil is recommended '
      'for frying as it can withstand high temperatures. Leftovers can be refrigerated and reheated in a 250-degree '
      'oven for about 15 minutes.',

  'image': 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Crispy-Fried-Chicken_EXPS_TOHJJ22_6445_DR-_02_03_11b.jpg',
  },
  'Deviled Eggs': {
  'recipe': 'Deviled eggs are hard boiled eggs where the yolk is mixed with mayonnaise, mustard, vinegar, salt, and pepper. The little sprinkle of paprika on top is the perfect finishing touch.\n'
      'Prep Time: 20 minutes\nCook Time: 14 minutes\nTotal Time: 34 minutes\n'
      'Servings: 12 deviled eggs\n\n'
      'Ingredients:\n'
      '6 large eggs\n'
      '3 tablespoons mayonnaise\n'
      '1 teaspoon Dijon mustard\n'
      '1 teaspoon apple cider vinegar\n'
      'Salt and pepper to taste\n'
      'Paprika for garnish\n\n'
      'Instructions:\n'
      '1. Bring a pot of water to a boil. Reduce the heat to low (or off) to ensure the water is '
      'no longer boiling or has bubbles and use a skimmer to place the eggs in the water. '
      'Then increase the heat back to high and set a timer for 14 minutes.\n'
      '2. While the eggs are boiling, prepare an ice water bath and set aside. After 14 minutes, '
      'remove the eggs from the water and place them in the ice water bath.\n'
      '3. Once the eggs have cooled completely, peel them and slice in half lengthwise.'
      ' Remove the yolk to a small bowl with a spoon and place the egg whites on a plate.\n'
      '4. Mash the yolks with a fork and add the mayonnaise, mustard, vinegar, salt, and pepper. '
      'Stir everything together until it\'s smooth.\n'
      '5. Use a spoon to add a portion of the deviled egg mixture back into the hole of each egg white.'
      ' Sprinkle on paprika for garnish.\n'
      '\nEnjoy your Deviled Eggs!',

  'image': 'https://fantabulosity.com/wp-content/uploads/2022/09/Pumpkin-Deviled-Eggs.jpg',
  },
  'Squash Casserole': {
  'recipe': 'Squash Casserole is an essential dish for holidays and special events. Topped with a buttery cracker topping, this squash casserole is an all-time favorite!\n'
      'Prep Time: 5 minutes\nCook Time: 45 minutes\nTotal Time: 50 minutes\nServings: 12\n\n'
      'Ingredients:\n'
      '2 tbsp butter\n'
      '4 cups sliced yellow squash\n'
      '1 medium onion, chopped\n'
      '2 large eggs\n'
      '1 cup grated cheddar cheese\n'
      '1 cup milk\n'
      '2 tbsp butter\n'
      '1/4 tsp cayenne pepper (optional)\n'
      '1/2 tsp kosher salt\n'
      '1/2 tsp ground black pepper\n'
      '1 sleeve Ritz crackers\n\n'
      'Instructions:\n'
      '1. Preheat oven to 350º F.\n'
      '2. Cook squash and onions in butter until tender.\n'
      '3. In a large bowl, whisk together eggs, cheese, milk, and cooked squash mixture.\n'
      '4. Add butter, cayenne pepper (if using), salt, and black pepper. Mix well.\n'
      '5. Pour the mixture into a greased 9x13 casserole dish and top with crushed Ritz crackers.\n'
      '6. Bake for 45 minutes at 350º F until the top is lightly browned and the casserole is set.\n'
      '7. Allow it to rest for about 3 minutes before serving.\n'
      '\nEnjoy your Squash casserole!',

  'image': 'https://www.healthyseasonalrecipes.com/wp-content/uploads/2022/06/healthy-summer-squash-casserole-sq-014.jpg',
  },
  'Eggplant Parmesan': {
  'recipe': 'Eggplant Parmesan is a delicious Italian dish with layers of crispy eggplant, rich tomato sauce, and gooey cheese.'
      ' Its easy to make and sure to be a crowd-pleaser!\n'
      'Prep Time: 25 minutes\nCook Time: 35 minutes\nTotal Time: 1 hour\n\n'
      'Ingredients:\n'
      '3 large eggplant, thinly sliced\n'
      '2 large eggs, beaten\n'
      '4 cups Italian seasoned bread crumbs\n'
      '6 cups spaghetti sauce\n'
      '16 oz mozzarella cheese, shredded\n'
      '1/2 cup grated Parmesan cheese\n'
      '1/2 tsp dried basil\n\n'
      'Directions:\n'
      '1. Preheat your oven to 350°F (175°C).\n'
      '2. Dip eggplant slices in beaten egg, then coat them in bread crumbs. Place them on a baking sheet in a single layer.\n'
      '3. Bake for 5 minutes, flip, and bake for 5 more minutes.\n'
      '4. Spread a layer of spaghetti sauce in a 9x13-inch baking dish. Add a layer of eggplant slices, followed by mozzarella '
      'and Parmesan cheeses.\n'
      '5. Repeat the layers with the remaining sauce, eggplant, and cheese, ending with a cheese layer. Sprinkle with dried basil.\n'
      '6. Bake until golden brown, about 35 minutes.\n'
      '7. Serve hot and enjoy your Eggplant Parmesan!',

  'image': 'https://www.recipetineats.com/wp-content/uploads/2021/05/Eggplant-Parmigiana_1-SQ.jpg',
  },
  'Vegetarian Gumbo': {
  'recipe': 'Recipe for Vegetarian Gumbo',
  'image': 'https://veganheaven.org/wp-content/uploads/2018/04/Vegan-Gumbo-9.jpg',
  },
  'Pretzel': {
  'recipe': 'Recipe for Pretzel',
  'image': 'https://handletheheat.com/wp-content/uploads/2021/09/soft-pretzel-recipe-SQUARE.jpg',
  },
  'Stuffed Bell Peppers': {
  'recipe': 'Recipe for Stuffed Bell Peppers',
  'image': 'https://www.budgetbytes.com/wp-content/uploads/2023/08/Stuffed-Bell-Peppers-close.jpg',
  },
  'Cauliflower Buffalo Wings': {
  'recipe': 'Recipe for Cauliflower Buffalo Wings',
  'image': 'https://www.lecremedelacrumb.com/wp-content/uploads/2020/02/buffalo-cauliflower-1bsm-4.jpg',
  },
  'Sweet Potato Casserole': {
  'recipe': 'Recipe for Sweet Potato Casserole',
  'image': 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/4/12/1/FNK_Sweet-Potato-Casserole_s4x3.jpg.rend.hgtvcom.616.462.suffix/1460503592924.jpeg',
  },
// Add more dishes as needed
};

AmericanMenu();
}
