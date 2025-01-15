import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';
import 'package:music_player/core/helpers/responsive_helper.dart';
import 'package:music_player/features/playingPage/presentation/widgets/my_appbar.dart';
import 'package:music_player/models/trends_model.dart';

class PlayingScreen extends StatefulWidget {
  final TrendsModel trend;
  final int index;
  const PlayingScreen({super.key, required this.trend, required this.index});

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  bool isPlaying = false;
  void togglePalySound() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: responsive.h(40),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.w(40)),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'trend-${widget.index}',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(responsive.w(5)),
                        color: widget.trend.color,
                      ),
                      height: responsive.h(330),
                      width: responsive.w(330),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(responsive.w(10)),
                        child: Image.asset(
                          widget.trend.imagePath!,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsive.h(20),
                  ),

                  /// song Name
                  Text(
                    widget.trend.name!,
                    style: AppFonts.interBold20,
                  ),
                  SizedBox(
                    height: responsive.h(10),
                  ),

                  /// Artist Name
                  Text(
                    widget.trend.singer!,
                    style: AppFonts.interMedium14opacity,
                  ),
                  SizedBox(
                    height: responsive.h(20),
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/wave.png'),
                      SizedBox(
                        height: responsive.h(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '24:32',
                            style: AppFonts.interMedium14opacity,
                          ),
                          Text(
                            '34:00',
                            style: AppFonts.interMedium14opacity,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: responsive.h(20),
          ),

          ///Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Prev button
              Container(
                child: Image.asset('assets/icons/Skip Back.png'),
              ),

              /// Play/Pause button
              Container(
                margin: EdgeInsets.only(
                    right: responsive.w(20), left: responsive.w(20)),
                child: Image.asset('assets/icons/Play.png'),
              ),

              /// Next button
              Container(
                child: Image.asset('assets/icons/Skip Fwd.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
