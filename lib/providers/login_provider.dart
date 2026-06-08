import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ge01_crud_front/config/session_manager.dart';
import 'package:ge01_crud_front/models/login.dart';
import 'package:ge01_crud_front/constants.dart';
import 'package:http/http.dart' as http;


final urlApi= apiUrl;

class LoginProvider with ChangeNotifier {
  String token = '';

  Future<void> login(String email, String password) async {
    final urlLogin = Uri.http('$urlApi:$port', '/api/users/login');
    final resp = await http.post(
      urlLogin,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if(resp.statusCode == 200){
      final response = loginFromJson(resp.body);
      token = response.token;
      SessionManager.setToken(token);
       notifyListeners();
    }else{
      throw Exception('Failed to login: ${resp.statusCode} - ${resp.body}');
    }
   

  }
}