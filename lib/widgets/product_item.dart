import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: CupertinoButton(
              onPressed: () {
                Provider.of<Product>(context, listen: false)
                    .changeFavouriteStatus();
              },
              child: Icon(
                product.isFavourite
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: CupertinoTheme.of(context).primaryContrastingColor,
              )),
          backgroundColor: CupertinoColors.black.withOpacity(0.5),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: CupertinoButton(
              onPressed: () {},
              child: Icon(
                CupertinoIcons.shopping_cart,
                color: CupertinoTheme.of(context).primaryContrastingColor,
              )),
        ),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
              context, ProductDetailScreen.routeName,
              arguments: product.id),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
