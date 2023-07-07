const recipes={ "recipes" : [
  {
    id: '1',
    name: 'Classic Chocolate Chip Cookies',
    image:'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578',
    ingredients: ['Flour', 'Butter', 'Sugar', 'Chocolate chips'],
    instructions: [
      'Preheat oven to 350°F',
      'In a large bowl, cream together butter, sugar, and brown sugar until smooth',
      'Beat in the eggs one at a time, then stir in the vanilla',
      'In a separate bowl, combine flour, baking soda, and salt',
      'Gradually add the dry ingredients to the wet ingredients',
      'Stir in the chocolate chips',
      'Drop spoonfuls of dough onto ungreased baking sheets',
      'Bake for 10-12 minutes or until edges are golden brown',
      'Allow cookies to cool on baking sheets for a few minutes, then transfer to wire racks to cool completely'
    ],
    creator: 'John Doe',
    category: 'Dessert',
    time: '30 mins',
    serves: '12',
    nutritionValues: {
      calories: '250 kcal',
      fat: '12g',
      carbs: '35g',
      protein: '3g',
      sugar: '20g',
      fiber: '2g',
      sodium: '150mg'
    },
    likes:0,
  },
  {
    id: '2',
    name: 'Spaghetti Bolognese',
    image:'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578',
    ingredients: ['Spaghetti', 'Ground beef', 'Tomato sauce', 'Onion', 'Garlic'],
    instructions: [
      'Cook spaghetti according to package instructions',
      'In a large skillet, brown ground beef over medium heat',
      'Add onion and garlic, cook until softened',
      'Stir in tomato sauce and simmer for 15 minutes',
      'Serve the sauce over cooked spaghetti'
    ],
    creator: 'Jane Smith',
    category: 'Main Course',
    time: '45 mins',
    serves: '4',
    nutritionValues: {
      calories: '450 kcal',
      fat: '18g',
      carbs: '40g',
      protein: '30g',
      sugar: '8g',
      fiber: '6g',
      sodium: '800mg'
    },
    likes:0,

  },
  {
    id: '3',
    name: 'Caprese Salad',
    image:'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578',
    ingredients: ['Tomatoes', 'Fresh mozzarella', 'Basil leaves', 'Olive oil', 'Balsamic vinegar'],
    instructions: [
      'Slice tomatoes and fresh mozzarella into thick slices',
      'Arrange alternating slices of tomato and mozzarella on a platter',
      'Tuck fresh basil leaves between the tomato and mozzarella slices',
      'Drizzle with olive oil and balsamic vinegar',
      'Season with salt and pepper to taste'
    ],
    creator: 'Maria Rodriguez',
    category: 'Salad',
    time: '15 mins',
    serves: '2',
    nutritionValues: {
      calories: '180 kcal',
      fat: '14g',
      carbs: '5g',
      protein: '10g',
      sugar: '3g',
      fiber: '2g',
      sodium: '200mg'
    },
    likes:0,

  },
  {
    id: '4',
    name: 'Grilled Chicken Skewers',
    image:'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578',
    ingredients: ['Chicken breast', 'Bell peppers', 'Red onion', 'Olive oil', 'Lemon juice', 'Garlic', 'Herbs and spices'],
    instructions: [
      'Cut chicken breast into cubes',
      'Slice bell peppers and red onion into chunks',
      'In a bowl, whisk together olive oil, lemon juice, minced garlic, and desired herbs and spices',
      'Thread chicken, bell peppers, and red onion onto skewers',
      'Brush skewers with the marinade mixture',
      'Preheat grill to medium-high heat',
      'Grill skewers for 10-12 minutes, turning occasionally, until chicken is cooked through',
      'Serve hot with your favorite dipping sauce or side dish'
    ],
    creator: 'Michael Thompson',
    category: 'Main Course',
    time: '25 mins',
    serves: '3',
    nutritionValues: {
      calories: '320 kcal',
      fat: '12g',
      carbs: '8g',
      protein: '40g',
      sugar: '4g',
      fiber: '2g',
      sodium: '300mg'
    },
    likes:0,

  },
  {
    id: '5',
    name: 'Vegetable Stir-Fry',
    image:'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578',
    ingredients: ['Broccoli', 'Carrots', 'Bell peppers', 'Snow peas', 'Onion', 'Garlic', 'Soy sauce', 'Sesame oil'],
    instructions: [
      'Cut broccoli into florets, julienne carrots and bell peppers, and trim snow peas',
      'In a wok or large skillet, heat sesame oil over high heat',
      'Add minced garlic and sliced onion, stir-fry for 1-2 minutes',
      'Add broccoli, carrots, bell peppers, and snow peas, stir-fry for 3-4 minutes',
      'Pour soy sauce over the vegetables, continue stir-frying for another 2-3 minutes',
      'Serve hot as a side dish or over steamed rice'
    ],
    creator: 'Emily Davis',
    category: 'Main Course',
    time: '20 mins',
    serves: '4',
    nutritionValues: {
      calories: '180 kcal',
      fat: '6g',
      carbs: '25g',
      protein: '8g',
      sugar: '6g',
      fiber: '6g',
      sodium: '700mg'
    },
    likes:0,

  }
]};

module.exports = recipes;