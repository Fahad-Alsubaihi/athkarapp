import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import '../../../models/citations.dart';

class Counter extends StatelessWidget {
  Counter({
    Key key,
  }) : super(key: key);

  // final Citations counter;

  @override
  Widget build(BuildContext context) {
    final citation = Provider.of<Citations>(context);
    // print("rebuild");
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              new CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 10.0,
                animation: false,
                percent: citation.currentc / citation.counter,
                center: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  onTap: () {
                    if ((citation.counter - citation.currentc != 0)) {
                      citation.increment();
                      // HapticFeedback.vibrate();
                      // if (await Vibration.hasVibrator()) {
                      // Vibration.vibrate(pattern: [500, 500]);
                      Vibration.vibrate(duration: 60);
                    }

                    // }
                    // // HapticFeedback.heavyImpact();
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text("${citation.counter - citation.currentc}",
                            style: TextStyle(
                                color: Colors.black54, fontSize: 18))),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color.fromARGB(255, 39, 176, 144),
              ),
            ],
          ),
          InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            onTap: () {
              if (citation.currentc != 0) {
                citation.reload();
                Vibration.vibrate(duration: 200);
              }
            },
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                // color: Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Icon(
                Icons.replay_outlined,
                size: 35,
                color: Color.fromARGB(255, 215, 215, 215),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
