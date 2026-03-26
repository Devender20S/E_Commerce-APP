import 'package:flutter/material.dart';
import 'package:flutter_app/global_variables.dart';
import 'package:flutter_app/product_carts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? hoveredIndex;
  final List<String> filters = const ['All', 'Adidas', 'Bata', 'Nike', 'Puma'];
  late String selectedFilter = filters[0];
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black26),
      borderRadius: BorderRadius.circular(22),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(1, 25, 10, 25),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',

                        prefixIcon: Icon(Icons.search_outlined),
                        border: border,
                        enabledBorder: border,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,


              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      mouseCursor: SystemMouseCursors.move,
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Colors.yellowAccent
                            : Color.fromRGBO(255, 255, 255, 1.0),
                        label: Text(filter),
                        labelStyle: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final products = product[index];
                  return ProductCard(
                    title: products['title'] as String,
                    price: products['price'] as int,
                    image: products['imageUrl'] as String,
                  );
                },
                itemCount: product.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
