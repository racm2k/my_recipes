
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_recipes/src/blocs/application_state.dart';
import 'package:my_recipes/src/blocs/cubit_factory.dart';
import 'package:my_recipes/src/core/components/recipe_card.dart';
import 'package:my_recipes/src/core/constants/application_constants.dart';
import 'package:my_recipes/src/core/fonts/global_fonts.dart';
import 'package:my_recipes/src/core/models/recipe_list_model.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../../core/components/myrecipe_scaffold.dart';
import '../../../../../core/navigator/application_routes.dart';
import '../../../../../core/theme/theme_colors.dart';
import '../business_components/recipes_cubit.dart';

class RecipesUI extends StatefulWidget {
  const RecipesUI({super.key});

  @override
  State<RecipesUI> createState() => _RecipesUIState();
}

class _RecipesUIState extends State<RecipesUI> {
  final RecipesCubit _recipesCubit = CubitFactory.recipesCubit;

  RecipeListModel? _recipeListModel;

  List<String> _likedRecipes = [];

  final channel = IOWebSocketChannel.connect(ApplicationConstants.localhostWS);

  bool showUpdateFeedButton = false;
  int version = 1;

  @override
  void initState() {
    _recipesCubit.getRecipes();
    Future.delayed(const Duration(seconds: 1), () {
      channel.stream.listen((event) {
        if (int.parse(event) > version) {
          _recipesCubit.updateFeed(version);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyRecipeScaffold(
      title: 'Recipes',
      body: BlocConsumer<RecipesCubit, ApplicationState>(
        bloc: _recipesCubit,
        builder: (context, state) => _buildStates(state),
        listener: (context, state) => _listenStates(state),
        listenWhen: (previous, current) => current is ApplicationApiError,
      ),
      //footerSection: FloatingActionButton(onPressed: ()=>Navigator.of(context).pushNamed(ApplicationRoutes.playgroundUI)),
    );
  }

  void _listenStates(ApplicationState state) {
    switch (state.runtimeType) {
      case ApplicationApiError:
        Navigator.of(context)
            .pushNamed(ApplicationRoutes.unknownApiErrorScreen);
        break;
    }
  }

  Widget _buildStates(ApplicationState state) {
    switch (state.runtimeType) {
      case ApplicationInitialState:
      case ApplicationLoadingState:
        return const Center(child: CircularProgressIndicator());
      case RecipesSuccessState:
        _recipeListModel = (state as RecipesSuccessState).recipes;
        _likedRecipes = state.likedRecipes;
        break;
      case RecipesLikeSuccessState:
        _likedRecipes.add((state as RecipesLikeSuccessState).recipeId);
        break;
      case RecipesDislikeSuccessState:
        _likedRecipes.remove((state as RecipesDislikeSuccessState).recipeId);
        break;
      case RecipesFeedUpdateState:
        showUpdateFeedButton = true;
        version = (state as RecipesFeedUpdateState).version;
        break;
    }
    return _buildSuccessState(state);
  }

  Widget _buildSuccessState(ApplicationState state) {
    return RefreshIndicator(
      onRefresh: () async {
        _recipesCubit.getRecipes();
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _recipeListModel?.recipes?.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final recipe = _recipeListModel?.recipes?[index];
                final isLiked = _likedRecipes.contains(recipe?.id);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        ApplicationRoutes.recipeDetailUI,
                        arguments: recipe);
                  },
                  child: RecipeCard(
                    recipe: recipe!,
                    isLiked: isLiked,
                    onLikeTap: () {
                      if (isLiked) {
                        _recipesCubit.dislikeRecipe(recipe.id);
                      } else {
                        _recipesCubit.likeRecipe(recipe.id);
                      }
                    },
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: showUpdateFeedButton,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.primary,

                  ),
                  onPressed: () {
                    _recipesCubit.getRecipes();
                    showUpdateFeedButton = false;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.refresh,
                        color: ThemeColors.whiteText,
                      ),
                      Text(
                        'Update Feed',
                        style: GlobalFonts.labelLarge(ThemeColors.whiteText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
