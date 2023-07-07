import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel {
  final String id;
  final String? name;
  final String? image;
  final List<String>? ingredients;
  final List<String>? instructions;
  final String? creator;
  final String? category;
  final Map<String,dynamic>? nutritionValues;
  final String? serves;
  final String? time;
  final int? likes;

  RecipeModel({
    required this.id,
    this.name,
    this.image,
    this.ingredients,
    this.instructions,
    this.creator,
    this.category,
    this.nutritionValues,
    this.serves,
    this.time,
    this.likes,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
