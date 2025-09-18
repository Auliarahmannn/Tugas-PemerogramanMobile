import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  final List<Map<String, dynamic>> data = [
    {"nama": "Mawar", "warna": const Color.fromARGB(255, 196, 22, 10)},
    {"nama": "Tulip", "warna": const Color.fromARGB(255, 159, 17, 83)},
    {"nama": "Anggrek", "warna": const Color.fromARGB(255, 234, 233, 229)},
    {"nama": "Lili", "warna": const Color.fromARGB(255, 235, 95, 116)},
    {"nama": "Lavender", "warna": const Color.fromARGB(255, 15, 14, 116)},
    {"nama": "Matahari", "warna": const Color.fromARGB(255, 227, 213, 15)},
    {"nama": "Teratai", "warna": const Color.fromARGB(255, 76, 8, 153)},
    {"nama": "Krisan", "warna": const Color.fromARGB(255, 199, 50, 4)},
    {"nama": "Melati", "warna": const Color.fromARGB(255, 233, 237, 233)},
    {"nama": "Kamboja", "warna": const Color.fromARGB(255, 215, 241, 17)},
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    final filteredData = data
        .where((item) =>
            item["nama"].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Produk",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      body: Column(
        children: [
          // Banner sambutan
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.all(12),
            child: const Text(
              "Selamat datang di Store kami",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Masukan Pencarian",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Grid bunga
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: filteredData[index]["warna"],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      filteredData[index]["nama"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
