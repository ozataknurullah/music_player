import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';

import 'package:music_player/features/discoverPage/presentation/widgets/my_appbar.dart';
import 'package:music_player/features/discoverPage/presentation/widgets/my_search_field.dart';
import 'package:music_player/models/category_model.dart';
import 'package:music_player/models/trends_model.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _selectedCategoryIndex = 0;
  List<CategoryModel> categories = [];
  List<TrendsModel> trends = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getSongs() {
    trends = TrendsModel.getTrendsModel();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getSongs();
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
      appBar: const MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MySearchField(),
          const SizedBox(
            height: 20,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trending",
                    style: AppFonts.trendingText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 4,
                      ),
                      shrinkWrap: true,
                      itemCount: trends.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: trends[index].color,
                                ),
                                height: 165,
                                width: 170,
                                child: ClipRRect(
                                  child: Image.asset(
                                    trends[index].imagePath!,
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                              ),

                              ///Song name
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(trends[index].name!,
                                    style: AppFonts.trendsName),
                              ),

                              ///Singer name
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 4),
                                child: Text(trends[index].singer!,
                                    style: AppFonts.trendsSinger),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
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
