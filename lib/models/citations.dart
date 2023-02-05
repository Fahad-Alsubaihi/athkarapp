import 'dart:convert';

import 'package:animation/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

class Citations with ChangeNotifier {
  // List<Citations> morning;
  String title;
  String data;
  int counter;
  int currentc;
  Citations({
    this.counter,
    this.currentc,
    this.data,
    this.title,
  });
  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString("assets/lib/data/data.json");
  //   final data = await json.decode(response);

  //   List _items = data["morning"];

  //   print("item length${_items.length}");
  // }

  void increment() {
    if (counter > currentc) currentc++;
    notifyListeners();
    print("counter=${currentc}");
  }

  void reload() {
    currentc = 0;
    notifyListeners();
  }
}
