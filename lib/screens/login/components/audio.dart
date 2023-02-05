// import 'dart:html';

import 'package:animation/size_config.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:vibration/vibration.dart';

class Audioplyer extends StatefulWidget {
  Audioplyer({Key key, @required this.path}) : super(key: key);

  String path;
  @override
  State<Audioplyer> createState() => _AudioplyerState();
}

class _AudioplyerState extends State<Audioplyer> {
  final audioplyer = AudioPlayer();

  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isFullSun;

  String timeFormat(Duration duration) {
    String towDigit(int n) => n.toString().padLeft(2, '0');
    final hour = towDigit(duration.inHours);
    final minutes = towDigit(duration.inMinutes.remainder(60));
    final seconds = towDigit(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hour, minutes, seconds].join(':');
  }

  Future<void> setAudio() async {
    audioplyer.setReleaseMode(ReleaseMode.STOP);

    final player = AudioCache(prefix: "assets/sound/");
    final url = await player.load(widget.path);
    await audioplyer.setUrl(url.path, isLocal: true);

    // player.play(widget.path);
  }

  @override
  void initState() {
    super.initState();
    setAudio();
    audioplyer.onPlayerStateChanged.listen((event) {
      setState(() {
        if (event == PlayerState.PLAYING) {
          isplaying = true;
        } else
          isplaying = false;
        ;

        // isplaying =
      });
    });
    audioplyer.onDurationChanged.listen((newduration) {
      setState(() {
        duration = newduration;
      });
    });

    audioplyer.onAudioPositionChanged.listen((newposition) {
      setState(() {
        position = newposition;
        // Vibration.vibrate(duration: 60);
      });
    });
  }

  @override
  void dispose() {
    audioplyer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setAudio();
    // isFullSun = widget.isFullSun;
    return Column(
      children: [
        Slider(
          thumbColor: Colors.white,
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          min: 0,
          onChanged: ((value) async {
            // Vibration.vibrate(duration: 10);
            final position = Duration(seconds: value.toInt());
            await audioplyer.seek(position);

            await audioplyer.resume();
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              timeFormat(position),
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              timeFormat(duration - position),
              style: TextStyle(color: Colors.white70),
            )
          ],
        ),
        IconButton(
          icon: Icon(
            isplaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            size: getProportionateScreenWidth(60),
            color: Color.fromARGB(181, 255, 255, 255),
          ),
          onPressed: () async {
            Vibration.vibrate(duration: 60);
            isplaying ? await audioplyer.pause() : await audioplyer.resume();
            setState(() {
              isplaying = !isplaying;
            });
          },
        ),
      ],
    );
  }
}
