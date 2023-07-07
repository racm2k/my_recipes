import 'dart:convert';

import 'package:my_recipes/src/core/repositories/recipe_repository.dart';

import '../../../../../core/models/recipe_list_model.dart';
import '../../../../../core/storage/application_storage.dart';
import 'recipes_use_case.dart';

class RecipesUseCaseImpl implements RecipesUseCase {
  final ApplicationStorage _applicationStorage;
  RecipesUseCaseImpl({required RecipeRepository repository, required ApplicationStorage applicationStorage})
      : _recipeRepository = repository,
        _applicationStorage = applicationStorage;

  final RecipeRepository _recipeRepository;

  @override
  Future<RecipeListModel> getRecipes() async => await _recipeRepository.getRecipes();
  
  @override
  Future<String> likeRecipe(String id) async {
    await _recipeRepository.likeRecipe(id);

    final likedRecipes = await _applicationStorage.read(StorageKeys.likedRecipes);
    final likedRecipesList= jsonDecode(likedRecipes ?? '[]') as List<dynamic>;
    likedRecipesList.add(id);
    await _applicationStorage.write(StorageKeys.likedRecipes, jsonEncode(likedRecipesList));
    return id;
  }

  @override
  Future<String> dislikeRecipe(String id) async {
    await _recipeRepository.dislikeRecipe(id);

    final likedRecipes = await _applicationStorage.read(StorageKeys.likedRecipes);
    final likedRecipesList= jsonDecode(likedRecipes ?? '[]') as List<dynamic>;
    likedRecipesList.remove(id);
    await _applicationStorage.write(StorageKeys.likedRecipes, jsonEncode(likedRecipesList));
    return id;
  }

  @override
  Future<List<String>> getLikedRecipes() async {
    final likedRecipes = await _applicationStorage.read(StorageKeys.likedRecipes);
    final likedRecipesList= jsonDecode(likedRecipes ?? '[]') as List<dynamic>;
    return likedRecipesList.map((e) => e.toString()).toList();
  }
}
