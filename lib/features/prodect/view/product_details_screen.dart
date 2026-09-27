import 'package:flutter/material.dart';

import '../../../utils/widgets/custom_app_bar.dart';
import '../../../utils/widgets/custom_button.dart';
import '../model/prodect.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: CustomAppBar(
        title: 'Product Details',
        showBackButton: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(product.image, fit: BoxFit.contain),
            ),

            const SizedBox(height: 20),

            Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            const SizedBox(height: 5),

            Text(
              '\$${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Color(0xFF147DEB),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(product.description, style: const TextStyle(color: Colors.grey, height: 1.5)),

            const SizedBox(height: 25),

            const Divider(),

            _detailsRow('Brand', product.brand),

            const Divider(),

            _detailsRow('Category', product.category),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('In Stock', style: TextStyle(color: Colors.grey)),

                Text(
                  product.inStock ? 'Yes' : 'No',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: product.inStock ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            CustomButton(text: 'Add to Cart', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _detailsRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),

          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
