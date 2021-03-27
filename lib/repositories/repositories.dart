import 'dart:convert';

import 'package:my_app/models/cards.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserRepositories {
  static String mainUrl = "https://trello.backend.tests.nekidaem.ru";
  var loginUrl = "$mainUrl/api/v1/users/login/";
  var cardsUrl = "$mainUrl/api/v1/cards/";

  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<bool> hasToken() async {
    var value = await secureStorage.read(key: 'token');
    if (value != null)
      return true;
    else
      return false;
  }

  Future<void> writeToken(String token) async {
    await secureStorage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    secureStorage.delete(key: 'token');
    secureStorage.deleteAll();
  }

  Future<String> login(String username, String password) async {
    final response = await http.post(Uri.parse(loginUrl), body: {
      "username": username,
      "password": password,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      return throw Exception("Error code: ${response.statusCode}");
    }
  }

  Future<List<Card>> getAllCards() async {
    var token = await secureStorage.read(key: 'token');
    final response = await http.get(Uri.parse(cardsUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'JWT $token',
      'Content-Type': 'application/json'
    });
    if (response.statusCode == 200) {
      final List<dynamic> userJson =
          json.decode(utf8.decode(response.bodyBytes));
      return userJson.map((json) => Card.fromJson(json)).toList();
    } else {
      return throw Exception("Error code: ${response.statusCode}");
    }
  }
}
