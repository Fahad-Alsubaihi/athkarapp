import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../models/citations.dart';
import 'card.dart';
import '../../../models/Data.dart';

class Cards extends StatelessWidget {
  const Cards({Key key, @required this.data}) : super(key: key);
  final List<Citations> data;

  @override
  Widget build(BuildContext context) {
    final data = this.data;

    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
            value: data[index],
            child: Card(
                // citation: data[index],
                ));
      },
      itemCount: data.length,
      loop: false,
      viewportFraction: 1,
      scale: 0.7,
    );
  }
}
