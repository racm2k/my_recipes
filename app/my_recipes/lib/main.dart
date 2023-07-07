import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_recipes/src/blocs/application_cubit_observer.dart';
import 'package:my_recipes/src/core/navigator/route_navigator.dart';
import 'package:my_recipes/src/core/theme/application_theme.dart';
import 'package:my_recipes/src/features/recipes/list/presentation/user_interfaces/recipes_ui.dart';

void main() {
  Bloc.observer = ApplicationCubitObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ApplicationTheme.lightScheme,
      home: const RecipesUI(),
      debugShowCheckedModeBanner: false,
      navigatorKey: RouterNavigator.navigatorKey,
      navigatorObservers: [RouterNavigator.routeObserver],
      onGenerateRoute: RouterNavigator.generateRoute,
    );
  }
}

