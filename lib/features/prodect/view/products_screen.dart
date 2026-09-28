import 'package:flutter/material.dart';

import '../../../utils/routes/routes.dart';
import '../../../utils/widgets/custom_app_bar.dart';
import '../dummyData/dummy_products.dart';
import '../model/prodect.dart';
import '../widgets/product_grid_item.dart';
import '../widgets/product_list_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isGridView = true;

  void openProduct(Product product) {
    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: CustomAppBar(
        title: 'Products',
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isGridView = !isGridView;
                });
              },
              icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: isGridView ? _buildGrid() : _buildList(),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      itemCount: dummyProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final product = dummyProducts[index];

        return ProductGridItem(
          product: product,
          onTap: () {
            openProduct(product);
          },
        );
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: dummyProducts.length,
      itemBuilder: (context, index) {
        final product = dummyProducts[index];

        return ProductListItem(
          product: product,
          onTap: () {
            openProduct(product);
          },
        );
      },
    );
  }
}
