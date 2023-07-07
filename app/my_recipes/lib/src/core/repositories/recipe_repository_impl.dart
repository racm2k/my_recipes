import 'dart:convert';

import 'package:my_recipes/src/core/constants/application_constants.dart';
import 'package:my_recipes/src/core/models/recipe_list_model.dart';
import 'package:my_recipes/src/core/repositories/recipe_repository.dart';
import 'package:http/http.dart' as http;

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<RecipeListModel> getRecipes() async {
    final request = Uri.parse('${ApplicationConstants.localhostAPI}/recipes-list');
    final response = await http.get(request);

    
    return RecipeListModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<String> likeRecipe(String id) async {
    final request = Uri.parse('${ApplicationConstants.localhostAPI}/recipe/$id/like');
    await http.patch(request);
    return id;
}

  @override
  Future<String> dislikeRecipe(String id) async {
    final request = Uri.parse('${ApplicationConstants.localhostAPI}/recipe/$id/dislike');
    await http.patch(request);
    return id;
  }
}
