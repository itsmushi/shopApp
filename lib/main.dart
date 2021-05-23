import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/edit_product_screen.dart';

import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/order_screen.dart';
import './screens/user_products.dart';
import 'providers/products.dart';
import 'providers/cart.dart';
import 'providers/order.dart';
import 'package:shop/screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Products()),
          ChangeNotifierProvider.value(value: Cart()),
          ChangeNotifierProvider.value(value: Orders()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            // fontFamily: 'Lato',
          ),
          title: "shopApp",
          home: ProductOverview(),
          routes: {
            ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
            CartScreen.routeName: (_) => CartScreen(),
            OrderScreen.routeName: (_) => OrderScreen(),
            UserProductScreen.routeName: (_) => UserProductScreen(),
            EditProductScreen.routeName:(_)=>EditProductScreen(),
          },
        ));
  }
}
