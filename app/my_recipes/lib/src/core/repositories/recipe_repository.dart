
import '../models/recipe_list_model.dart';

abstract class RecipeRepository {
  Future<RecipeListModel> getRecipes();

  Future<String> likeRecipe(String id);

  Future<String> dislikeRecipe(String id);


}
