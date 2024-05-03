// Group #8, CS 440, Fall 2023

// mexican_menu.dart

// mexican food references
// https://www.recipetineats.com/


class MexicanMenu {
  final Map<String, Map<String, String>> dishesWithRecipes = {

    'Carnitas': {
      'recipe':'Prep: 15 minutes\n'
        'Cook: 6 hours\n'
        'Total: 6 hours 15 minutes\n'
        'Slow cooking\n'
        'Mexican\n'
        '4.96 from 946 votes\n'
        'Servings: 10 - 12\n'
        '\nIngredients:\n'
        '2 kg / 4 lb pork shoulder (pork butt), skinless, boneless (5 lb/2.5 kg bone-in) (Note 1)\n'
        '2 1/2 tsp salt\n'
        '1 tsp black pepper\n'
        '1 onion, chopped\n'
        '1 jalapeno, deseeded, chopped\n'
        '4 cloves garlic, minced\n'
        '3/4 cup juice from orange (2 oranges)\n'
        'RUB\n'
        '1 tbsp dried oregano\n'
        '2 tsp ground cumin\n'
        '1 tbsp olive oil\n'
        '\nInstructions:\n'
        'Rinse and dry the pork shoulder, rub all over with salt and pepper.\n'
        'Combine the Rub ingredients then rub all over the pork.\n'
        'Place the pork in a slow cooker (fat cap up), top with the onion, jalapeno, minced garlic (don’t worry about spreading it) and squeeze over the juice of the oranges.\n'
        'Slow Cook on low for 10 hours or on high for 7 hours. (Note 2 for other cook methods)\n'
        'Pork should be tender enough to shred. Remove from slow cooker and let cool slightly. Then shred using two forks.\n'
        'Optional: Skim off the fat from the juices remaining in the slow cooker and discard.\n'
        'If you have a lot more than 2 cups of juice, then reduce it down to about 2 cups. The liquid will be salty, it is the seasoning for the pork. Set liquid aside – don’t bother straining onion etc, it’s super soft.\n'
        'TO CRISP:\n'
        'Heat 1 tbsp of oil in a large non stick pan or well-seasoned skillet over high heat. Spread pork in the pan, drizzle over some juices. Wait until the juices evaporate and the bottom side is golden brown and crusty. Turn and just briefly sear the other side – you don’t want to make it brown all over because then it’s too crispy, need tender juicy bits.\n'
        'Remove pork from skillet. Repeat in batches (takes me 4 batches) – don’t crowd the pan.\n'
        'Just before serving, drizzle over more juices and serve hot, stuffed in tacos (see notes for sides, other serving suggestion and storage/make ahead).',

    'image': 'https://www.kitchensanctuary.com/wp-content/uploads/2023/05/Pork-Carnitas-square-FS.jpg',
    },
    'Chicken Enchiladas':{
      'recipe': 'Prep: 20 minutes\n'
        'Cook: 45 minutes\n'
        'Mains\n'
        'Mexican\n'
        '\nIngredients:\n'
        '8 tortillas , flour or corn (about 20cm/8" wide, Note 1)\n'
        'ENCHILADA SEASONING:\n'
        '1 tsp EACH onion powder, garlic powder, salt\n'
        '1 tbsp EACH dried cumin powder, paprika, dried oregano\n'
        '1/4 tsp black pepper\n'
        '3/4 tsp cayenne pepper (optional, adjust to taste)\n'
        'ENCHILADA SAUCE\n'
        '2 tbsp olive oil\n'
        '3 tbsp flour , plain/all purpose\n'
        '2 cups (500ml) chicken stock/broth , low sodium\n'
        '1.5 cups (375ml) tomato passata or US puree (Note 4 sub)\n'
        'CHICKEN FILLING:\n'
        '600g / 1.2lb chicken breast , sliced in half horizontally (or boneless thigh) (Note 2)\n'
        '2 tbsp olive oil , separated\n'
        '1/2 onion , chopped\n'
        '2 garlic cloves , finely minced\n'
        '1 red capsicum/bell pepper , diced\n'
        '400g / 14oz refried beans (Note 3)\n'
        '400g/14oz canned corn , drained (sub frozen 1 3/4 cups)\n'
        '1/4 cup (65ml) water\n'
        '1 cup (100g) cheese shredded (Mexican cheese blend, Monterey Jack, cheddar)\n'
        'TOPPING\n'
        '1.5 cups (150g) cheese , shredded\n'
        '2 tbsp coriander/cilantro , roughly chopped\n'
        '\nInstructions:\n'
        'ENCHILADA SEASONING: Mix Enchilada Seasoning Spices. To be used for Filling and Sauce.\n'
        'ENCHILADA SAUCE\n'
        'Make roux - Heat oil in saucepan over medium heat. Add flour and stir 20 seconds.\n'
        'Add other ingredients - Add 2 tbsp Enchilada Seasoning, broth and tomato. Stir to combine.\n'
        'Simmer to thicken - Increase heat slightly to medium high. Cook for 4 minutes, whisking regularly, until the sauce thickens to the consistency of thick syrup (see video). Remove from stove.\n'
        'CHICKEN FILLING\n'
        'Coat chicken - Drizzle 1 tbsp oil over chicken, mix to coat. Sprinkle with Seasoning, toss to coat.\n'
        'Cook chicken - Heat remaining 1 tbsp oil in a large skillet over high heat. Add chicken, cook 2 minutes. Turn and cook 1.5 minutes. Remove, rest 2 minutes then chop.\n'
        'Saute onion - In the same skillet, add onion and garlic, cook 1 minute. Add capsicum, cook 2 minutes until onion is translucent.\n'
        'Add everything else - Add refried beans, diced chicken, corn and water. Stir and cook for 2 minutes until reduces slightly. Should be thick and juicy, not watery.\n'
        'ASSEMBLE AND BAKE:\n'
        'Preheat oven to 180°C/350°F.\n'
        'Roll - Lay tortilla on work surface. Spread 2/3 cup Filling on lower third, sprinkle with cheese then roll up, finishing with the seam side down (to hold it closed). Repeat to make 8.\n'
        'Smear a scoop of Enchilada Sauce across base of 22 x 33cm /9 x 13" pan. Place Enchiladas in, pour over remaining Sauce, sprinkle with cheese.\n'
        'Bake 20 - 25 minutes or until cheese is melted and golden. Serve immediately, sprinkled with coriander!',

  'image': 'https://www.jessicagavin.com/wp-content/uploads/2018/04/chicken-enchiladas-5-1200.jpg',
    },
    'Guacamole': {
      'recipe': 'Prep: 10 minutes\n'
        'Total: 10 minutes\n'
        '\nIngredients:\n'
        '2 tbsp finely chopped white onion (or red, brown or yellow)\n'
        '1 tbsp finely chopped jalapeno or serrano chilli (or other chilli of choice) (adjust to taste)\n'
        '1/2 tsp salt , plus more to taste\n'
        '1/4 cup roughly chopped coriander/cilantro leaves\n'
        '2 medium avocados (or 1 very large one) (Note 1)\n'
        'Lime juice , to taste (I use 1/4 – 1/2 lime)\n'
        'Optional: 1 ripe tomato , peeled, deseeded and chopped\n'
        '\nInstructions:\n'
        '1. Place the onion, jalapeño, salt and half the coriander on a cutting board and use a fork to mash until juicy. OR do this in a mortar and pestle – grind into a paste.\n'
        '2. Scrape into a bowl, add avocado and remaining coriander, and mash to desired consistency.\n'
        '3. Do a taste test then adjust to your taste: salt, lime juice for sour, more chilli for spiciness.\n'
        '4. If using tomatoes, stir through.\n'
        '5. Serve with corn chips!',

    'image': 'https://peasandcrayons.com/wp-content/uploads/2023/03/chunky-guacamole-recipe-tomato-cilantro-5.jpg',
      },
    'Mexican Red Rice': {
      'recipe': 'Prep: 3 minutes\n'
        'Cook: 15 minutes\n'
        'Total: 18 minutes\n'
        '\nIngredients:\n'
        '1 1/2 tbsp olive oil\n'
        '2 garlic cloves , minced\n'
        '1/2 small white onion , finely chopped\n'
        '1 cup long grain white rice , uncooked (Note 1)\n'
        '1 3/4 cups (435 ml) chicken or vegetable broth (Note 2)\n'
        '2 1/2 tbsp tomato paste\n'
        '1/4 tsp salt\n'
        '1 serrano or jalapeno pepper , whole (optional)\n'
        '1 sprig coriander / cilantro\n'
        'OPTIONAL GARNISH:\n'
        'Finely chopped coriander / cilantro leaves\n'
        '\nInstructions:\n'
        '1. Heat oil in a large saucepan over medium heat. Add garlic, stir briefly, then add onion. Cook for 4 - 5 minutes until translucent (not browned / golden).\n'
        '2. Add rice, broth, salt and tomato paste. Stir until tomato paste is dissolved.\n'
        '3. Plonk in jalapeno and coriander. Cover, bring to simmer, then lower heat to low so the water is simmering gently.\n'
        '4. Cook for 15 minutes or until the liquid is absorbed (tilt pot to check).\n'
        '5. Remove from heat, leave lid on and rest for 10 minutes (KEY STEP). The residual liquid on the surface of the rice will get absorbed and rice will go from sticky to fluffy.\n'
        '6. Fluff with fork then serve! (Optional: garnish with extra coriander)',

        'image': 'https://stellanspice.com/wp-content/uploads/2022/04/photo-output-8-768x1024.jpg',
      },
    'Quesadillas': {
      'recipe': 'Prep: 10 minutes\n'
        'Cook: 15 minutes\n'
        'Total: 25 minutes\n'
        'Main\n'
        'Mexican, Tex-Mex\n'
        'Servings: 6 - 8 quesadillas\n'
        '\nIngredients:\n'
        'QUESADILLAS:\n'
        '6 - 8 flour tortillas (20cm/8″)\n'
        '2 cups (200g) shredded Monterey Jack cheese (or other of choice) (Note 1)\n'
        '3/4 cup roughly chopped coriander/cilantro\n'
        '1 cup corn kernels (frozen thawed or can drained)\n'
        'ONE Filling of Choice, below (beef, chicken or vegetable)\n'
        'QUESADILLA SPICE MIX:\n'
        '1 tsp each onion powder, dried oregano, salt\n'
        '2 tsp each cumin powder, paprika\n'
        '1/4 tsp each black pepper, cayenne pepper (optional)\n'
        'CHOOSE ONE FILLING\n'
        'BEEF FILLING:\n'
        '1/2 tbsp olive oil\n'
        '2 garlic cloves , minced\n'
        '1/2 onion , finely chopped\n'
        '500g / 1 lb ground beef / mince\n'
        '1 small red capsicum/bell peppers , diced\n'
        '2 tbsp tomato paste\n'
        '1/4 cup (65 ml) water\n'
        'CHICKEN FILLING:\n'
        '2 1/2 tbsp olive oil\n'
        '500 g/1 lb chicken thighs , skinless boneless (Note 2)\n'
        '2 garlic cloves , minced\n'
        '1 small onion , quartered and sliced\n'
        '1 small red capsicum/bell pepper , diced\n'
        'VEGETABLE FILLING:\n'
        '2 tbsp vegetable oil\n'
        '1 onion , diced\n'
        '2 cloves garlic , minced\n'
        '1 can of black beans, drained (400g/14oz)\n'
        '1 capsicum/bell pepper , diced (any colour)\n'
        '1 cup corn (canned drained or frozen thawed)\n'
        '1/4 cup tomato paste\n'
        '1/4 cup (65 ml) water\n'
        '\nInstructions:\n'
        '1. QUESADILLAS\n'
        '   Place tortilla on work surface. Sprinkle one side with a bit of cheese, top with Filling of Choice. Sprinkle with corn*, coriander and top with cheese. Fold in half.\n'
        '   Preheat non stick skillet over medium low heat (no oil, if pan is not non-stick use 2 tsp oil).\n'
        '   Place quesadilla in skillet, press down lightly, cover with lid. Cook for 3 minutes until underside is super golden brown and crispy.\n'
        '   Carefully flip over the folded edge (see video). Press down lightly. Cook for 3 minutes until crispy (no lid).\n'
        '   Transfer to cutting board, cut in half. Serve immediately!\n'
        '   Dipping Sauce options: Sour cream, salsa, Avocado Sauce (pictured)\n'
        '2. SPICE MIX:\n'
        '   Mix ingredients in a small bowl. Use for one of the Fillings Options below.\n'
        '3. FILLING OPTIONS\n'
        'BEEF FILLING:\n'
        '   Heat oil in a skillet over high heat. Add onion and garlic, cook for 2 minutes.\n'
        '   Add beef and cook, breaking it up as you go. Once it changes from pink to brown, add capsicum. Cook for 1 minute.\n'
        '   Add tomato paste, water and Spice Mix. Cook for 2 minutes. Transfer to bowl, cool.\n'
        'CHICKEN FILLING:\n'
        '   Drizzle chicken with 1 tbsp oil, toss to coat. Sprinkle over Spice Mix, toss well to coat.\n'
        '   Heat 1 tbsp oil in a large skillet over high heat. Add onion and garlic, cook for 2 minutes. Add capsicum and cook for 1 minute. Transfer to bowl, cool.\n'
        '   Return pan to stove, reduce to medium heat. Add remaining 1/2 tbsp oil. Add chicken and cook for 3 minutes until deep golden. Turn and cook for 3 minutes until cooked through.\n'
        '   Transfer chicken to cutting board, rest for 2 minutes then dice and cool. Combine with capsicum mixture.\n'
        'VEGETABLE FILLING:\n'
        '   Heat oil in a skillet over high heat. Add onion and garlic, cook for 2 minutes. Add capsicum, cook for 1 minute.\n'
        '   Add beans, corn, tomato paste, water and Spice Mix. Cook for 2 minutes. Transfer to bowl, cool.',

    'image': 'https://recipetineats.com/wp-content/uploads/2018/06/Quesadillas_4.jpg',
    },
    'One Pot Mexican Chicken and Rice': {
      'recipe': 'Prep: 15 minutes\nCook: 50 minutes\nTotal: 55 minutes\nDinner, One Pot, Rice, Mexican\n'
        'Servings: 5\n'
        '\nIngredients:\n'
        'MEXICAN SPICE MIX\n'
        '2 tsp garlic powder (or 2 garlic cloves, minced)\n'
        '2 tsp paprika\n'
        '2 tsp cumin powder\n'
        '1 3/4 tsp salt\n'
        '1/2 tsp cayenne pepper (Note 1), optional\n'
        'Black pepper\n'
        'CHICKEN\n'
        '5 chicken thighs, bone-in, skin on (Notes 2 and 3)\n'
        '2 tbsp olive oil\n'
        '1 tbsp lime juice\n'
        'RICE\n'
        '1 small onion, peeled and diced (or 1/2 large)\n'
        '1 garlic clove, minced\n'
        '1 red capsicum (bell pepper), diced or sliced\n'
        '1 cup long grain rice, uncooked (Note 4)\n'
        '1 cup chicken stock/broth, low sodium (or vegetable stock)\n'
        '3/4 cup tomato passata (US: tomato puree) (Note 5)\n'
        '1 cup frozen corn kernels (or canned – drained)\n'
        '1 can (400g/16oz) black beans, drained and rinsed (sub red kidney beans)\n'
        'GARNISH\n'
        '1 lime, plus extra to serve\n'
        'Coriander/cilantro\n'
        'Sliced jalapeño peppers (optional)\n'
        '\nInstructions:\n'
        '1. Preheat oven to 180°C/350°F (160° fan).\n'
        '2. Mexican spice mix – Mix the ingredients in a small bowl.\n'
        '3. Rub Chicken – Place 1 1/2 tablespoons of the Mexican Spice Mix in a large bowl (reserve rest for rice) with 1 tablespoon olive oil and lime juice. '
        'Mix to form a paste then add the chicken and toss to coat the chicken.\n'
        '4. Marinate (optional) – Marinate chicken for 1 hour, or even overnight, if you have the time. Otherwise, it\'s fine to proceed with the recipe!\n'
        '5. Sear chicken – Using a large deep skillet preferably with a lid (Note 6), heat the remaining 1 tbsp olive oil over medium high heat. Sear the skin side of the chicken for 4 minutes until light golden, '
        'then sear the flesh side for 1 1/2 minutes (will still be raw inside). Remove onto a plate.\n'
        '6. Sauté aromatics – If you\'ve got a lot of burnt spices on the base, scrape off and discard some of it. Then in the same skillet, still over medium high heat, add the onion, garlic and capsicum (bell peppers).'
        ' Sauté for 3 minutes until the onion softens.\n'
        '7. Rice & liquid – Add the rice and stir. Add chicken stock, tomato passata, corn, beans and remaining Mexican Spice Mix. Stir to combine.\n'
        '8. Top with chicken – Place chicken on top of the rice, skin side up. It will be partially submerged but most of the skin should be above the liquid.\n'
        '9. Bake covered 25 min – Bring to simmer, then cover skillet with a lid or foil and place in the oven for 25 minutes.\n'
        '10. Bake uncovered 15 min – Remove the lid/foil and bake for a further 15 minutes until only small puddles of liquid remain on the surface of the rice.\n'
        '11. Rest 10 minutes – Remove from the oven and allow to rest for 10 minutes (uncovered). Any remaining liquid will evaporate in this step.\n'
        '12. Serve – Squeeze the juice of 1 lime over the chicken and rice. Remove chicken or push to the side then fluff the rice. Serve, garnished with coriander/cilantro leaves, extra lime wedges and sliced jalapeños, if desired. Sour cream also goes well with this, or a dollop of guacamole or avocado sauce!',

    'image': 'https://www.recipetineats.com/wp-content/uploads/2014/12/One-Pot-mexican-chicken-and-rice_3.jpg',
    },
    'Churros': {
      'recipe': 'Prep: 5 minutes\n'
        'Cook: 15 minutes\n'
        'Total: 20 minutes\n'
        'Sweet\n'
        'Mexican, Spanish\n'
        '\nIngredients:\n'
        'CINNAMON SUGAR COATING\n'
        '1/4 cup caster / superfine sugar\n'
        '2 tsp ground cinnamon\n'
        'CHURROS\n'
        '1 cup flour, plain / all purpose (Note 1)\n'
        '1 tsp baking powder\n'
        'Pinch of salt\n'
        '1 tbsp vegetable, canola or olive oil (not extra virgin olive oil)\n'
        '1 cup boiling water\n'
        '2 cups+ vegetable or canola oil , for frying\n'
        'CHOCOLATE SAUCE\n'
        '1/2 cup dark chocolate or semi sweet chocolate chips (Note 2)\n'
        '1/2 cup thickened / heavy cream (heavy cream)\n'
        '\nInstructions:\n'
        'Cinnamon sugar coating: Combine sugar and cinnamon in a shallow bowl, set aside.\n'
        'Batter: Mix flour, baking powder and salt in a bowl. Add oil and water and mix until just combined - it should be a thick, gummy batter, like a wet sticky dough, not thin and watery.\n'
        'Piping bag: Transfer dough into a piping bag with a 8mm / 1/3" star tip nozzle. Set aside while oil heats.\n'
        'Heat oil: Heat 5cm / 2" oil over medium high in a small pot, wok or small but deep skillet (Note 3) to 170°C/340°F, or until it takes 20 seconds for a small cube of bread to turn golden.\n'
        'Pipe & snip: Pipe 15cm / 6" lengths of dough into the oil, snipping with scissors (snip close to oil surface to avoid splash). Do 3 to 4 per batch, makes 10 to 12 in total.\n'
        'Cook: Cook for 2-3 minutes or until golden and crisp, rolling occasionally.\n'
        'Drain: Remove onto paper towel lined plate to drain. Then roll in sugar. Serve hot with Chocolate Sauce!\n'
        'CHOCOLATE SAUCE:\n'
        'Place in a heatproof bowl and microwave in 30 second bursts, stirring in between, until smooth. Set aside for 5 minutes to cool and thicken slightly.',

        'image': 'https://www.savorynothings.com/wp-content/uploads/2021/04/churros-recipe-image-sq.jpg',
},


    // Add more Mexican dishes and their recipes here
  };

  MexicanMenu();
}