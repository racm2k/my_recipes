import 'package:flutter/material.dart';
import 'package:my_recipes/src/core/components/fullscreen_api_error.dart';
import 'package:my_recipes/src/core/models/recipe_model.dart';
import 'package:my_recipes/src/features/playground/playground_ui.dart';
import 'package:my_recipes/src/features/recipes/detail/presentation/user_interfaces/recipe_detail_ui.dart';

import '../../features/recipes/list/presentation/user_interfaces/recipes_ui.dart';
import 'application_routes.dart';

class RouterNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static const String recipesUI = ApplicationRoutes.recipesUI;

  static final RouteObserver<ModalRoute> routeObserver =
      RouteObserver<ModalRoute>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case recipesUI:
        return MaterialPageRoute(
          builder: (_) => const RecipesUI(),
          settings: settings,
        );

      case ApplicationRoutes.unknownApiErrorScreen:
        final message= args as String?;
        return MaterialPageRoute(
          builder: (_) =>  FullScreenApiError(message: message,),
          settings: settings,
        );
      case ApplicationRoutes.playgroundUI:
        return MaterialPageRoute(
          builder: (_) => const PlaygroundUI(),
          settings: settings,
        );
        case ApplicationRoutes.recipeDetailUI:
          final recipe=args as RecipeModel;
        return MaterialPageRoute(
          builder: (_) =>  RecipeDetailUI(recipe: recipe,),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const RecipesUI(),
          settings: settings,
        );
    }
  }
}
