import 'package:json_annotation/json_annotation.dart';
import 'package:my_recipes/src/core/models/recipe_model.dart';

part 'recipe_list_model.g.dart';

@JsonSerializable()
class RecipeListModel{
  final List<RecipeModel>? recipes;

  RecipeListModel({this.recipes});

  factory RecipeListModel.fromJson(Map<String,dynamic> json) => _$RecipeListModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeListModelToJson(this);



}