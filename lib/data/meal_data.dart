import 'package:meal_recipe_app/model/meals_data.dart';

List<Mealmodel> meals = [
  Mealmodel(
    id: 'm1',
    categories: ['1'],
    title: 'Masala Dosa',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/9/9f/Dosa_at_Sri_Ganesha_Restauran_Bangkok_%287356%29.jpg',
    ingredients: [
      '3 Cups Rice',
      '1 Cup Urad Dal',
      'Potatoes',
      'Onions',
      'Mustard Seeds',
      'Curry Leaves',
    ],
    steps: [
      'Soak rice and dal overnight.',
      'Grind to a batter and ferment.',
      'Boil potatoes and mash with spices.',
      'Spread batter on hot tawa.',
      'Add filling and roll.',
    ],
    duration: 45,
    complexity: Complexity.challenging,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Mealmodel(
    id: 'm2',
    categories: ['2', '3'], // Also fits Punjabi
    title: 'Paneer Butter Masala',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/3/30/Paneer_Butter_Masala_02.jpg',
    ingredients: [
      'Paneer',
      'Tomatoes',
      'Cream',
      'Butter',
      'Cashews',
      'Garam Masala',
    ],
    steps: [
      'Fry paneer cubes slightly.',
      'Make tomato and cashew paste.',
      'Cook paste with butter and spices.',
      'Add cream and paneer.',
      'Simmer for 5 mins.',
    ],
    duration: 40,
    complexity: Complexity.simple,
    affordability: Affordability.pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  // --- Category 3: Punjabi ---
  Mealmodel(
    id: 'm3',
    categories: ['3'],
    title: 'Sarson Da Saag',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/c/c3/Sarson_da_saag_makki_di_roti.jpg',
    ingredients: ['Mustard Greens', 'Spinach', 'Maize Flour', 'Ginger', 'Ghee'],
    steps: [
      'Boil greens and mash them.',
      'Cook with spices and maize flour.',
      'Top with white butter.',
    ],
    duration: 50,
    complexity: Complexity.hard,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  // --- Category 4: Gujarati ---
  Mealmodel(
    id: 'm4',
    categories: ['4'],
    title: 'Khaman Dhokla',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/6/6e/Khaman_Dhokla_01.jpg',
    ingredients: [
      'Gram Flour (Besan)',
      'Lemon Juice',
      'Eno/Fruit Salt',
      'Mustard Seeds',
      'Green Chilies',
    ],
    steps: [
      'Mix besan, water, and lemon juice.',
      'Add fruit salt and steam immediately.',
      'Cut into squares.',
      'Pour tempering of mustard seeds and water.',
    ],
    duration: 25,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),

  // --- Category 5: Hyderabadi Briyani ---
  Mealmodel(
    id: 'm5',
    categories: ['5'],
    title: 'Hyderabadi Veg Dum Biryani',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/5/5a/Veg_Biryani.jpg',
    ingredients: [
      'Basmati Rice',
      'Mixed Vegetables',
      'Fried Onions',
      'Saffron Milk',
      'Biryani Masala',
    ],
    steps: [
      'Marinate vegetables in yogurt and spices.',
      'Par-boil rice with whole spices.',
      'Layer veg gravy and rice.',
      'Seal pot and cook on dum (steam).',
    ],
    duration: 60,
    complexity: Complexity.challenging,
    affordability: Affordability.pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  // --- Category 6: Mughlai ---
  Mealmodel(
    id: 'm6',
    categories: ['6'],
    title: 'Malai Kofta',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/0/02/Malai_Kofta.jpg',
    ingredients: ['Paneer', 'Potatoes', 'Cashews', 'Cream', 'Tomatoes'],
    steps: [
      'Make balls (koftas) of paneer and potato.',
      'Deep fry koftas.',
      'Prepare white creamy gravy.',
      'Add koftas just before serving.',
    ],
    duration: 60,
    complexity: Complexity.hard,
    affordability: Affordability.luxurious,
    isGlutenFree: false, // Usually added binder
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  // --- Category 7: Rajasthani ---
  Mealmodel(
    id: 'm7',
    categories: ['7'],
    title: 'Dal Baati Churma',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/3/3f/Dal_Bati_Churma.jpg',
    ingredients: [
      'Wheat Flour',
      'Semolina',
      'Mixed Lentils',
      'Ghee',
      'Jaggery',
    ],
    steps: [
      'Bake hard wheat balls (Baati).',
      'Cook spicy mixed lentils (Dal).',
      'Crush some baati with ghee and sugar (Churma).',
      'Serve all three together.',
    ],
    duration: 90,
    complexity: Complexity.hard,
    affordability: Affordability.pricey,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  // --- Category 8: Bengoli ---
  Mealmodel(
    id: 'm8',
    categories: ['8'],
    title: 'Luchi and Alur Dom',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/f/fb/Luchi-Alur_Dom.jpg',
    ingredients: ['Maida', 'Potatoes', 'Mustard Oil', 'Panch Phoron', 'Tomato'],
    steps: [
      'Make puffy fried bread (Luchi).',
      'Cook potatoes in spicy tomato gravy.',
      'Serve hot for breakfast.',
    ],
    duration: 45,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
];
