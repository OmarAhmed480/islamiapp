import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentlyList = [];

  Future<void> readMostRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> mostRecentStringList =
        prefs.getStringList("mostRecent") ?? [];

    mostRecentlyList = mostRecentStringList.map((element) {
      return int.parse(element);
    }).toList();

    notifyListeners();
  }

}
