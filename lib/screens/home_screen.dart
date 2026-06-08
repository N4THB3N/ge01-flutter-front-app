import 'package:flutter/material.dart';
import 'package:ge01_crud_front/providers/client_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Listado de Clientes'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: ListView.builder(
        itemCount: clientProvider.clients.length,
        itemBuilder: (context, index){
          final client = clientProvider.clients[index];
          return Card(
             borderOnForeground: true,
            child: Padding(   
              padding: const EdgeInsets.all(8.0),
              child: ListTile( 
              title: Text('${client.firstName} ${client.lastName}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(client.email),
            )));
        },
        
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'addUser');
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}