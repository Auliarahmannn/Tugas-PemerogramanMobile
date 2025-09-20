import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _darkMode = false;
  bool _notifEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Dark Mode"),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
            secondary: Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: Text("Aktifkan Notifikasi"),
            value: _notifEnabled,
            onChanged: (value) {
              setState(() {
                _notifEnabled = value;
              });
            },
            secondary: Icon(Icons.notifications),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Versi Aplikasi"),
            subtitle: Text("1.0.0"),
          ),
        ],
      ),
    );
  }
}
