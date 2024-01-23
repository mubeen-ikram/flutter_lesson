import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../lecture-6/Model/Product.dart';

class SharedPrefernce {
  static const String historyKey = 'history';
  static Future<void> saveHistoryMap(Map<int, List<Product>> historyMap) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final encodedMap = jsonEncode(historyMap.map((key, value) => MapEntry(key.toString(), value)));
    prefs.setString(historyKey, encodedMap);
  }
  static Future<Map<int, List<Product>>> getHistoryMap() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final encodedMap = prefs.getString(historyKey);
    if (encodedMap != null) {
      final decodedMap = jsonDecode(encodedMap);
      return Map<int, List<Product>>.from(decodedMap.map((key, value) => MapEntry(int.parse(key), (value as List<Product>).map((e) => Product.fromJson(e)))));
    } else {
      return {};
    }
  }
}

