import 'package:flutter/material.dart';
import 'package:my_recipes/src/core/components/myrecipe_scaffold.dart';
import 'package:my_recipes/src/core/components/recipe_card.dart';
import 'package:my_recipes/src/core/models/recipe_model.dart';

class PlaygroundUI extends StatelessWidget {
  const PlaygroundUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MyRecipeScaffold(
      showleading: true,
        body: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        RecipeCard(
          recipe: RecipeModel(
              id: '1',
              category: 'Dessert',
              creator: 'John Doe',
              image:
                  'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578',
              ingredients: [
                'Broccoli',
                'Carrots',
                'Bell peppers',
                'Snow peas',
                'Onion',
                'Garlic',
                'Soy sauce',
                'Sesame oil'
              ],
              instructions: [
                'Cut broccoli into florets, julienne carrots and bell peppers, and trim snow peas',
                'In a wok or large skillet, heat sesame oil over high heat',
                'Add minced garlic and sliced onion, stir-fry for 1-2 minutes',
                'Add broccoli, carrots, bell peppers, and snow peas, stir-fry for 3-4 minutes',
                'Pour soy sauce over the vegetables, continue stir-frying for another 2-3 minutes',
                'Serve hot as a side dish or over steamed rice'
              ],
              name: 'Vegetable Stir-Fry',
              time: '20',
              serves: '4',
              nutritionValues: {
                'calories': '180',
                'fat': '6',
                'carbs': '25',
                'protein': '8',
                'sugar': '6',
                'fiber': '6',
                'sodium': '700'
              }),
          isLiked: false,
          onLikeTap: () {},
        ),
      ],
    ));
  }
}
