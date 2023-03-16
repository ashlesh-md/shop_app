import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import './providers/products_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: CupertinoApp(
        title: 'Shop App',
        theme: const CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'Lato')),
            barBackgroundColor: CupertinoColors.white,
            primaryColor: CupertinoColors.systemPurple,
            primaryContrastingColor: CupertinoColors.activeOrange),
        home: ProductOverviewScreen(),
      ),
    );
  }
}
