// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      instructions: (json['instructions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      creator: json['creator'] as String?,
      category: json['category'] as String?,
      nutritionValues: json['nutritionValues'] as Map<String, dynamic>?,
      serves: json['serves'] as String?,
      time: json['time'] as String?,
      likes: json['likes'] as int?,
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'creator': instance.creator,
      'category': instance.category,
      'nutritionValues': instance.nutritionValues,
      'serves': instance.serves,
      'time': instance.time,
      'likes': instance.likes,
    };
