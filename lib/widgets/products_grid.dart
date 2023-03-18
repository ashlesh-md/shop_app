import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> allProduts = Provider.of<Products>(context).items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: allProduts.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider<Product>(
              create: (BuildContext c) => allProduts[index],
              child: const ProductItem(),
            ));
  }
}
