import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';
import '../models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
        id: '01',
        name: 'T-shirt',
        description: 'Red T-shirt is very good.',
        price: 1000,
        imageUrl:
            'https://images.unsplash.com/photo-1554838692-3b50e4261b6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'),
    Product(
        id: '02',
        name: 'Cloth Combo',
        description: 'White Shirt with Grey Jeans',
        price: 2000,
        imageUrl:
            'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80'),
    Product(
        id: '03',
        name: 'BasketBall',
        description: 'Best Quality Basketball',
        price: 1000,
        imageUrl:
            'https://images.unsplash.com/photo-1627627256672-027a4613d028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2074&q=80'),
    Product(
        id: '04',
        name: 'Watch',
        description: 'Best in market.',
        price: 1000,
        imageUrl:
            'https://images.unsplash.com/photo-1524805444758-089113d48a6d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80'),
    Product(
        id: '05',
        name: 'Mobile Phone',
        description: '8GB / 256 GB storage mobile phone',
        price: 1000,
        imageUrl:
            'https://images.unsplash.com/photo-1546054454-aa26e2b734c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80')
  ];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final allProduts = Provider.of<Products>(context).items;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: GestureDetector(
          child: Text('Shop App'),
          onTap: () {
            Provider.of<Products>(context, listen: false)
                .addProduct(loadedProducts[counter]);
            if (counter < loadedProducts.length - 1) {
              counter++;
            } else {
              counter = 0;
            }
          },
        ),
      ),
      child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: allProduts.length,
          itemBuilder: (ctx, index) => ProductItem(
              id: allProduts[index].id,
              title: allProduts[index].name,
              imageUrl: allProduts[index].imageUrl)),
    );
  }
}
