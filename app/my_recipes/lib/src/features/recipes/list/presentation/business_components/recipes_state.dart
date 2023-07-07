part of 'recipes_cubit.dart';

class RecipesSuccessState extends ApplicationState {
  final RecipeListModel recipes;
  final List<String> likedRecipes;

  const RecipesSuccessState({required this.recipes, required this.likedRecipes});
}

class RecipesLikeSuccessState extends ApplicationState {
  final String recipeId;
  const RecipesLikeSuccessState({required this.recipeId});
}

class RecipesDislikeSuccessState extends ApplicationState {
  final String recipeId;
  const RecipesDislikeSuccessState({required this.recipeId});
}

class RecipesFeedUpdateState extends ApplicationState {
  final int version;
  const RecipesFeedUpdateState({required this.version});
}