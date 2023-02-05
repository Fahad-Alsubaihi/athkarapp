import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Moon extends StatelessWidget {
  const Moon({
    Key key,
    @required Duration duration,
    @required this.isFullSun,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final bool isFullSun;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(-70),
      bottom: getProportionateScreenHeight(!isFullSun ? 530 : -100),
      child: Image(
        image: AssetImage('assets/images/moon.png'),
        height: getProportionateScreenHeight(360),
        width: getProportionateScreenWidth(360),
      ),
      // SvgPicture.asset("assets/icons/Sun.svg"),
    );
  }
}
