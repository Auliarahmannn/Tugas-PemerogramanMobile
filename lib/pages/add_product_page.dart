import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddProduct;

  AddProductPage({required this.onAddProduct});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  /// 🔹 validasi angka
  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  /// 🔹 validasi URL
  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null && (uri.isScheme("http") || uri.isScheme("https"));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newProduct = {
        "name": _nameController.text,
        "price": _priceController.text,
        "isFavorite": false,
        "image": _imageController.text,
        "desc": _descController.text,
      };

      widget.onAddProduct(newProduct);
      Navigator.pop(context); // kembali ke home setelah tambah
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Produk")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// Nama Produk
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nama Produk"),
                validator: (value) =>
                    value!.isEmpty ? "Nama tidak boleh kosong" : null,
              ),
              SizedBox(height: 10),

              /// Harga Produk
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: "Harga Produk"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong";
                  }
                  if (!_isNumeric(value)) {
                    return "Harga harus berupa angka";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              /// URL Gambar
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: "URL Gambar"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "URL tidak boleh kosong";
                  }
                  if (!_isValidUrl(value)) {
                    return "Masukkan URL gambar yang valid (http/https)";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              /// Deskripsi
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(labelText: "Deskripsi Produk"),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? "Deskripsi tidak boleh kosong" : null,
              ),
              SizedBox(height: 20),

              /// Tombol Simpan
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
