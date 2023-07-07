
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_recipes/src/blocs/application_state.dart';

import '../../../../../core/models/recipe_list_model.dart';
import '../../domain/use_cases/recipes_use_case.dart';
part 'recipes_state.dart';

class RecipesCubit extends Cubit<ApplicationState> {
  final RecipesUseCase _useCase;

  RecipesCubit({required RecipesUseCase useCase})
      : _useCase = useCase,
        super(const ApplicationInitialState());

  void getRecipes() async {
    try {
      emit(const ApplicationLoadingState());
      final recipes = await _useCase.getRecipes();
      final likedRecipes = await _useCase.getLikedRecipes();
      emit(RecipesSuccessState(recipes: recipes, likedRecipes: likedRecipes));
    } catch (e) {
      emit(ApplicationApiError(message: e.toString()));
    }
  }

  void likeRecipe(String id) async {
    try {
      emit(const ApplicationLoadingState());
      final recipeId = await _useCase.likeRecipe(id);
      emit(RecipesLikeSuccessState(recipeId: recipeId));
    } catch (e) {
      emit(ApplicationApiError(message: e.toString()));
    }
  }

  void dislikeRecipe(String id) async {
    try {
      emit(const ApplicationLoadingState());
      final recipeId = await _useCase.dislikeRecipe(id);
      emit(RecipesDislikeSuccessState(recipeId: recipeId));
    } catch (e) {
      emit(ApplicationApiError(message: e.toString()));
    }
  }

  void updateFeed(int version) {
    emit(RecipesFeedUpdateState(version: version));
  }


}
