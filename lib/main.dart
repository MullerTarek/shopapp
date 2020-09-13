import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_screen.dart';
import './providers/order.dart';
import './screens/cart_screen.dart';

import './screens/productOverviewScreen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';
import 'providers/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.deepOrange,
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: Scaffold(
          body: ProductOverviewScreen(),
        ),
        routes: {
          ProductDetailScreen.routeNamed: ((ctx) => ProductDetailScreen()),
          CartScreen.routeNamed: ((ctx) => CartScreen()),
          OrdersScreen.routeNamed: ((ctx) => OrdersScreen()),
        },
      ),
    );
  }
}
