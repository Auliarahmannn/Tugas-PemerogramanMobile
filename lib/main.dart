import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/second_page.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/setting_page.dart'; // ✅ import setting page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tugas Drawer Navigation",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // urutan halaman HARUS sama dengan menu drawer
  final List<Widget> _pages = [
    HomePage(),     // index 0
    SecondPage(),   // index 1
    AboutPage(),    // index 2
    ContactPage(),  // index 3
    SettingPage(),  // index 4 ✅
  ];

  final List<String> _titles = [
    "Home",
    "Second Page",
    "About",
    "Contact",
    "Setting", // ✅
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Tutup drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu Navigasi",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.layers),
              title: Text("Second Page"),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () => _onItemTapped(4), // ✅ buka setting page
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
