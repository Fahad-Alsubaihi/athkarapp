import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key key,
    @required this.press,
  }) : super(key: key);

  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.8, // 80%
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorColor: Colors.white,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          onTap: press,
          tabs: [
            Tab(
              icon: Icon(
                Icons.sunny,
                size: getProportionateScreenWidth(30),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.mode_night,
                size: getProportionateScreenWidth(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
