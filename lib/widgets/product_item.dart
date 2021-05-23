import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // String id;
  // String title;
  // String imageUrl;

  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    final Cart cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                product.toogleFavoriteStatus();
              }),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          backgroundColor: Colors.black54,
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Added item to cart"),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  onPressed: () {cart.removeItem(product.id);},
                  label: "UNDO",
                ),
              ));
            },
          ),
        ),
      ),
    );
  }
}
