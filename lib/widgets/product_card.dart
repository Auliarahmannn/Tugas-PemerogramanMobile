import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final bool isFavorite;
  final String imageUrl;
  final VoidCallback onFavoritePressed;
  final String? desc;

  ProductCard({
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.imageUrl,
    required this.onFavoritePressed,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.image_not_supported, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(height: 5),
                Text(price, style: TextStyle(color: Colors.grey[700])),
                if (desc != null) ...[
                  SizedBox(height: 5),
                  Text(desc!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.blue,
                    ),
                    onPressed: onFavoritePressed,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
