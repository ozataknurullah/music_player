import 'dart:ui';

import 'package:music_player/core/constans/colors.dart';

class TrendsModel {
  String? name;
  String? singer;
  String? imagePath;
  String? duration;
  Color? color;

  TrendsModel({
    required this.name,
    required this.singer,
    required this.imagePath,
    required this.duration,
    required this.color,
  });

  static List<TrendsModel> getTrendsModel() {
    List<TrendsModel> trends = [];

    trends.add(TrendsModel(
      name: "The missing 96 percent of the universe",
      singer: "Claire Malone",
      imagePath: "assets/images/singer1.png",
      duration: "3:30",
      color: AppColors.trend1,
    ));

    trends.add(TrendsModel(
      name: "How Dolly Parton led me to an epiphany",
      singer: "Abumenyang",
      imagePath: "assets/images/singer2.png",
      duration: "3:35",
      color: AppColors.trend2,
    ));

    trends.add(TrendsModel(
      name: "The missing 96 percent of the universe",
      singer: "Tir McDohl",
      imagePath: "assets/images/singer3.png",
      duration: "3:15",
      color: AppColors.trend3,
    ));

    trends.add(TrendsModel(
      name: "Ngobam with Denny Caknan",
      singer: "Denny Kulon",
      imagePath: 'assets/images/singer4.png',
      duration: "3:55",
      color: AppColors.trend4,
    ));

    trends.add(TrendsModel(
      name: "Ngobam with Denny Caknan",
      singer: "Denny Kulon",
      imagePath: 'assets/images/singer4.png',
      duration: "3:55",
      color: AppColors.trend4,
    ));

    trends.add(TrendsModel(
      name: "The missing 96 percent of the universe",
      singer: "Claire Malone",
      imagePath: "assets/images/singer1.png",
      duration: "3:30",
      color: AppColors.trend1,
    ));

    trends.add(TrendsModel(
      name: "How Dolly Parton led me to an epiphany",
      singer: "Abumenyang",
      imagePath: "assets/images/singer2.png",
      duration: "3:35",
      color: AppColors.trend2,
    ));

    trends.add(TrendsModel(
      name: "The missing 96 percent of the universe",
      singer: "Tir McDohl",
      imagePath: "assets/images/singer3.png",
      duration: "3:15",
      color: AppColors.trend3,
    ));

    return trends;
  }
}
