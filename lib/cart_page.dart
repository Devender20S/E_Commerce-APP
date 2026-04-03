import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'My Cart',
            style: TextStyle(backgroundColor: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            ),
            trailing: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.delete_outline_sharp, color: Colors.redAccent),
            ),
            title: Text(cartItem['title'].toString()),
            subtitle: Text(
              'Size:${cartItem['sizes']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
        itemCount: cart.length,
      ),
    );
  }
}
