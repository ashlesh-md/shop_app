import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  static const String routeName = '/product_detail_screen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments.toString();
    final product = Provider.of<Products>(context, listen: false)
        .getProductById(productId: productId);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(product.title),
      ),
      child: Container(),
    );
  }
}
