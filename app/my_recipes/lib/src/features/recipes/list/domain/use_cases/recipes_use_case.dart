
import '../../../../../core/models/recipe_list_model.dart';

abstract class RecipesUseCase {
  Future<RecipeListModel> getRecipes();

  Future<String> likeRecipe(String id);

  Future<String> dislikeRecipe(String id);

  Future<List<String>>getLikedRecipes() ;
}