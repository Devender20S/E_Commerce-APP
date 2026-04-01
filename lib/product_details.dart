import 'package:flutter/material.dart';

import 'global_variables.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> products;
  const ProductDetailsPage({super.key, required this.products});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Text(
                widget.products['title'] as String,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Image.asset(widget.products['imageUrl'] as String, height: 300),
              SizedBox(height: 8),

              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(206, 207, 209, 1.0),
                  borderRadius: BorderRadius.circular(1),
                ),
                child: Column(
                  children: [
                    Text(
                      '₹${widget.products['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, index) {
                          final size =
                              (widget.products['sizes'] as List<int>)[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selectedSize == size
                                    ? Color.fromRGBO(230, 187, 15, 1.0)
                                    : null,
                              ),
                            ),
                          );
                        },
                        itemCount:
                            (widget.products['sizes'] as List<int>).length,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.shopping_cart),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(230, 187, 15, 1.0),
                    minimumSize: Size(double.infinity, 40),
                  ),

                  onPressed: () {},

                  label: Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
