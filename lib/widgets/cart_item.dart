import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartItem extends StatelessWidget {
  String id;
  String productID;
  double price;
  int quantity;
  String title;

  CartItem(this.id, this.productID, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("Do you want to remove item from the cart?"),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: Text("No"),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text("Yes"),
                    ),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productID);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text('\$$price'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
