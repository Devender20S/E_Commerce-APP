import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Cart', style: TextStyle(backgroundColor: Colors.black),)),
      ),
      body: Center(child: Text('Cart Page')),
    );
  }
}
