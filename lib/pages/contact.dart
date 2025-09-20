import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Me")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            leading: Icon(Icons.email, color: Colors.red),
            title: Text("Email"),
            subtitle: Text("auliarahmanpakpahan13@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.green),
            title: Text("Telepon"),
            subtitle: Text("082163409345"),
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.blue),
            title: Text("Alamat"),
            subtitle: Text("Depok, Jawa Barat, Indonesia"),
          ),
          ListTile(
            leading: Icon(Icons.link, color: Colors.purple),
            title: Text("LinkedIn / Instagram"),
            subtitle: Text("@aulrahmanp"),
          ),
        ],
      ),
    );
  }
}
