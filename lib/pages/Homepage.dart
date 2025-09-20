import 'package:flutter/material.dart';
import '../data/produkdata.dart';
import '../widgets/header_widgets.dart';
import '../widgets/ui_widget_field.dart';
import '../widgets/product_card.dart';
import 'add_product_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void toggleFavorite(int index) {
    setState(() {
      produk[index]["isFavorite"] = !produk[index]["isFavorite"];
    });
  }

  void addProduct(Map<String, dynamic> newProduct) {
    setState(() {
      produk.add(newProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Produk")),
      body: Column(
        children: [
          HeaderWidget(),
          UiWidgetField(),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: produk.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  name: produk[index]["name"],
                  price: produk[index]["price"],
                  isFavorite: produk[index]["isFavorite"],
                  imageUrl: produk[index]["image"],
                  onFavoritePressed: () => toggleFavorite(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddProductPage(onAddProduct: addProduct),
            ),
          );
        },
      ),
    );
  }
}
