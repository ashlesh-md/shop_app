import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});
  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: CupertinoButton(
              onPressed: () {},
              child: Icon(
                CupertinoIcons.heart_fill,
                color: CupertinoTheme.of(context).primaryContrastingColor,
              )),
          backgroundColor: CupertinoColors.black.withOpacity(0.5),
          title: Text(
            title,
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
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => ProductDetailScreen(title: title))),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
