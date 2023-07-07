// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeListModel _$RecipeListModelFromJson(Map<String, dynamic> json) =>
    RecipeListModel(
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeListModelToJson(RecipeListModel instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };
