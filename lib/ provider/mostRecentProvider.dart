import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentlyList = [];

  Future<void> readMostRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> mostRecentStringList = prefs.getStringList("mostRecent") ?? [];

    mostRecentlyList = mostRecentStringList.map((element) {
      return int.parse(element);
    }).toList();

    notifyListeners();
  }

  Future<void> saveMostRecent({required int newSuraIndex}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> mostRecentList = prefs.getStringList("mostRecent") ?? [];

    mostRecentList.remove("$newSuraIndex");

    mostRecentList.insert(0, "$newSuraIndex");

    if (mostRecentList.length > 5) {
      mostRecentList.removeLast();
    }

    await prefs.setStringList("mostRecent", mostRecentList);

    mostRecentlyList = mostRecentList.map((element) {
      return int.parse(element);
    }).toList();

    notifyListeners();
  }
}
