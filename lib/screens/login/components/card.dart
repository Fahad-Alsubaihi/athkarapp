import 'dart:ui';

import 'package:animation/models/citations.dart';
import 'package:animation/screens/login/components/counter.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../size_config.dart';

class Card extends StatelessWidget {
  Card({
    Key key,
  }) : super(key: key);

  // final Citations citation;

  @override
  Widget build(BuildContext context) {
    Citations data = Provider.of<Citations>(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),

          // <-- clips to the 200x200 [Container] below
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              decoration: BoxDecoration(
                // backgroundBlendMode: b,

                // filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                color: Colors.white.withOpacity(.09),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: getProportionateScreenHeight(310),
                child: SingleChildScrollView(
                  child: Text(
                    data.title + "\n" + data.data,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        // fontFamily: 'Amiri',
                        height: 1.75,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo',
                        color: Colors.white),
                    // textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
            Counter(),
          ],
        ),
      ],
    );
  }
}
