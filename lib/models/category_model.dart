import 'dart:ui';

import 'package:music_player/core/constans/colors.dart';

class CategoryModel {
  String? id;
  String? name;
  Color? boxColor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
        CategoryModel(name: "All", boxColor: AppColors.secondary, id: "1"));
    categories.add(
        CategoryModel(name: "Life", boxColor: AppColors.secondary, id: "2"));
    categories.add(
        CategoryModel(name: "Comedy", boxColor: AppColors.secondary, id: "3"));
    categories.add(
        CategoryModel(name: "Tech", boxColor: AppColors.secondary, id: "4"));

    return categories;
  }
}
