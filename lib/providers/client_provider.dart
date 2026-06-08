import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ge01_crud_front/config/session_manager.dart';
import 'package:ge01_crud_front/constants.dart';
import 'package:ge01_crud_front/models/client.dart';
import 'package:http/http.dart' as http;

final urlApi= apiUrl;

class ClientProvider with ChangeNotifier{
  List<Client> clients = [];

  ClientProvider(){
    getClients();
  }

  Future getClients() async {
    final urlClientsGet = Uri.http('$urlApi:$clientPort', '/api/clients'); 
    final resp = await http.get(urlClientsGet, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SessionManager.authToken}',
    });

    if (resp.statusCode == 200) {
      if (resp.body.isEmpty) {
        clients = [];
      } else {
        final response = clientFromJson(resp.body);
        clients = response;
      }
      notifyListeners();
    } else {
      throw Exception('Failed to fetch clients: ${resp.statusCode} - ${resp.body}');
    }
  }

  Future insertClient(Map<String, dynamic> body) async {
    final urlClientsGet = Uri.http('$urlApi:$clientPort', '/api/clients'); 
    await http.post(urlClientsGet, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SessionManager.authToken}',
    },
    body: jsonEncode(body),
    );
    notifyListeners();
  }

  Future deleteClient(int id) async {
    final urlClientsGet = Uri.http('$urlApi:$clientPort', '/api/clients/$id');
    await http.delete(urlClientsGet, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${SessionManager.authToken}',
    });  
    notifyListeners();  
  }
}