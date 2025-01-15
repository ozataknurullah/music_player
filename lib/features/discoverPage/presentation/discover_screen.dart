import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';

import 'package:music_player/features/discoverPage/presentation/widgets/my_appbar.dart';
import 'package:music_player/features/discoverPage/presentation/widgets/my_search_field.dart';
import 'package:music_player/models/category_model.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _selectedCategoryIndex = 0;
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  void _onCategoryTap(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: MyAppBar(),
      body: Column(
        children: [
          MySearchField(),
          SizedBox(
            height: 20,
          ),
          _categoriesSection(),
        ],
      ),
    );
  }

  Padding _categoriesSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 36,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 15,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final isSelected = _selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () => _onCategoryTap(index),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: categories[index].boxColor,
                ),
                child: Center(
                  child: Text(
                    categories[index].name!,
                    style: isSelected
                        ? AppFonts.categoryPrimaryText
                        : AppFonts.categorySecondaryText,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
