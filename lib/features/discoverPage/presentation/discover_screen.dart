import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';
import 'package:music_player/core/helpers/responsive_helper.dart';
import 'package:music_player/features/discoverPage/presentation/widgets/my_appbar.dart';
import 'package:music_player/features/discoverPage/presentation/widgets/my_search_field.dart';
import 'package:music_player/features/playingPage/presentation/playing_screen.dart';
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
    final responsive = ResponsiveHelper(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MySearchField(),
          SizedBox(
            height: responsive.h(20),
          ),
          _categoriesSection(),
          SizedBox(
            height: responsive.h(20),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: responsive.w(20), right: responsive.w(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trending",
                    style: AppFonts.interBold24,
                  ),
                  SizedBox(
                    height: responsive.h(20),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: responsive.w(10),
                        mainAxisSpacing: responsive.h(10),
                        childAspectRatio: 3 / 4,
                      ),
                      shrinkWrap: true,
                      itemCount: trends.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayingScreen(
                                  trend: trends[index],
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                                  BorderRadius.circular(responsive.h(5)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: 'trend-$index',
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        responsive.h(5),
                                      ),
                                      color: trends[index].color,
                                    ),
                                    height: 170,
                                    width: 170,
                                    child: ClipRRect(
                                      child: Image.asset(
                                        trends[index].imagePath!,
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),

                                ///Song name
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: responsive.h(8)),
                                  child: Text(trends[index].name!,
                                      style: AppFonts.interBold13),
                                ),

                                ///Singer name
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: responsive.h(2),
                                      bottom: responsive.h(2)),
                                  child: Text(trends[index].singer!,
                                      style: AppFonts.interMedium10),
                                ),
                              ],
                            ),
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
    final responsive = ResponsiveHelper(context);
    return Padding(
      padding: EdgeInsets.only(left: responsive.w(20)),
      child: Container(
        height: responsive.h(35),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: responsive.w(10),
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final isSelected = _selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () => _onCategoryTap(index),
              child: Container(
                width: responsive.w(100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(responsive.h(20)),
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
