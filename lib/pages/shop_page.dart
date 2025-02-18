import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/components/my_drawer.dart';
import 'package:shoppingapp/components/my_product_tile.dart';
import 'package:shoppingapp/models/Shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access the products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/cart_page'), icon: Icon(Icons.add_shopping_cart))
        ],

      ),
      drawer: MyDrawer(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),

        children:[

          //shop subtitle

          Center(child: Text("Pick from a wide range of premium products", style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.inversePrimary
          ),)),

          //product list


          SizedBox(
          height: 600,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index)  {
              final product = products[index];
        
              return MyProductTile(product: product);
            },
          ),
        ),
      ]));

  }
}
