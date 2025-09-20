import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Me")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("asset/image/IMG_2435.JPG"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Nama: Aulia Rahman Pakpahan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text("Pendidikan: S1 Sistem Informasi"),
            Text("Hobi: Futsal, Musik"),
            SizedBox(height: 10),
            Text(
              "Deskripsi: Saya adalah mahasiswa yang tertarik pada desain dan musik.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
