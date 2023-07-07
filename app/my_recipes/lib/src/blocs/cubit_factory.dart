
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/repositories/recipe_repository_impl.dart';
import '../core/storage/application_storage.dart';
import '../core/storage/application_storage_impl.dart';
import '../features/recipes/list/domain/use_cases/recipes_use_case_impl.dart';
import '../features/recipes/list/presentation/business_components/recipes_cubit.dart';

class CubitFactory {

  static RecipesCubit get recipesCubit => RecipesCubit(
        useCase: RecipesUseCaseImpl(
          repository: RecipeRepositoryImpl(), applicationStorage: applicationStorage,

        ),
      );

  static ApplicationStorage get applicationStorage => const ApplicationStorageImpl(
    storage: FlutterSecureStorage(),

  );
}
