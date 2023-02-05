import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Land extends StatelessWidget {
  const Land({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenWidth(-50),
      left: 0,
      right: 0,
      child: Image.asset(
        "assets/images/desertmid.png",
        height: getProportionateScreenWidth(300),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
