import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  static Future<List<dynamic>> loadList(String assetPath) async {
    final jsonStr = await rootBundle.loadString(assetPath);
    final root = json.decode(jsonStr) as Map<String, dynamic>;
    return (root['data'] as List<dynamic>);
  }
}
