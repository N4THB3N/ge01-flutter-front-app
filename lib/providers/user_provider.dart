import 'package:flutter/material.dart';
import 'package:ge01_crud_front/models/user.dart';
import 'package:ge01_crud_front/constants.dart';
import 'package:http/http.dart' as http;

final urlApi= apiUrl;

class UserProvider with ChangeNotifier{
  List<User> users = [];

  getUsuarios() async {
    final urlUsersGet = Uri.http(urlApi + ":" + port.toString(), '/api/users'); 
    final resp = await http.get(urlUsersGet, headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Credentials': 'true',
      'Accept': 'application/json',
    });
    final response = UserFromJson(resp.body);
    users = response;
    notifyListeners();
  }

}