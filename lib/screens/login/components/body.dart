import 'dart:async';
import 'dart:ui';

import 'package:animation/models/citations.dart';
import 'package:animation/screens/login/components/moon.dart';
import 'package:animation/screens/login/components/cards.dart';
// import 'package:animation/screens/login/components/nightcards.dart';
import 'package:animation/size_config.dart';
// import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Data.dart';
import 'audio.dart';
import 'card.dart';
import 'land.dart';
// import 'rounded_text_field.dart';
import 'sun.dart';
import 'tabs.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFullSun = true;
  bool isDayMood = true;
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 1), () {
    //   setState(() {
    //     isFullSun = true;
    //   });
    // });
  }

  void changeMood(int activeTabNum) {
    if (activeTabNum == 0) {
      setState(() {
        isDayMood = true;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isFullSun = true;
        });
      });
    } else {
      setState(() {
        isFullSun = false;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataListOfCitations = Provider.of<ListOfCitations>(context);
    final morningdata = dataListOfCitations.morning;
    final nightdata = dataListOfCitations.night;
    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (isFullSun) Color(0xFFFF9D80),
    ];
    var darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.easeInOut,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDayMood ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          Moon(duration: _duration, isFullSun: isFullSun),
          Sun(duration: _duration, isFullSun: isFullSun),
          Land(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {
                      changeMood(value);
                    },
                  ),
                  VerticalSpacing(),
                  Text(
                    isFullSun ? "أذكار الصباح" : "أذكار المساء",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Baloo'),
                  ),
                  VerticalSpacing(),
                  Container(
                      constraints: BoxConstraints(
                        minHeight: getProportionateScreenWidth(200),
                        maxHeight: getProportionateScreenHeight(460),
                      ),
                      // height: getProportionateScreenHeight(400),
                      // height: 200,
                      // child: BackdropFilter(
                      // filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                      child: Cards(data: isFullSun ? morningdata : nightdata)),
                  // child: Swiper(
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ChangeNotifierProvider.value(
                  //    BackdropFilter     value: isFullSun
                  //             ? morningdata[index]
                  //             : nightdata[index],
                  //         child: Cards(
                  //             // citation: data[index],
                  //             ));
                  //   },
                  //   itemCount:
                  //       isFullSun ? morningdata.length : nightdata.length,
                  //   loop: false,
                  //   viewportFraction: 0.9,
                  //   scale: 0.7,
                  // ),
                  // ),
                  // child: isFullSun ? Morning() : Night()),
                  Audioplyer(path: isFullSun ? 'night.mp3' : 'morning.mp3'),
                  // VerticalSpacing(of: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
