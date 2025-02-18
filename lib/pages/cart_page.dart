import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/components/my_button.dart';
import 'package:shoppingapp/components/my_product_tile.dart';
import 'package:shoppingapp/models/Shop.dart';
import 'package:shoppingapp/models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access the products in cart
    final products = context.watch<Shop>().cart;
    //to remove product from cart
    void removeFromCart(Product item) {
      //show dialog to confirm removing from cart
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Remove from cart"),
        content: Text("Are you sure you want to remove ${item.name} from your cart?"),
        actions: [
          MaterialButton(onPressed: () => Navigator.pop(context), child: Text("No")),
          MaterialButton(onPressed: () {
            Navigator.pop(context);
            context.read<Shop>().removeFromCart(item);
          }, child: Text("Yes"))
        ],
      ));

    }

    //alert dialog for payment
    void pay() {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Payment"),
        content: Text("Are you sure you want to pay?"),
        actions: [
          MaterialButton(onPressed: () => Navigator.pop(context), child: Text("No")),
          MaterialButton(onPressed: () => Navigator.pop(context), child: Text("Yes"))
        ],
      ));
    }



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart"),
        centerTitle: true,

      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(

          children: [
            //cart items
            Expanded(
              child: products.isEmpty ? Center(child: Text("Your cart is empty")) : ListView.builder(
                
                itemCount: products.length,
                itemBuilder: (context, index) {
                  //get individual product
                  final product = products[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: ListTile(
                      title: Text(product.name),
                      // subtitle: Text(product.description),
                      subtitle: Text("\$${product.price.toStringAsFixed(2)}"),

                      trailing: IconButton(onPressed: () => removeFromCart(product) , icon: Icon(Icons.remove)),


                    ),
                  );
                },
              ),
            ),


            //pay button
            Container(
              width: double.infinity,
                padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              alignment: Alignment.center,
              child: MyButton(
                child: Text("Pay me"),
                onTap: () {
                  pay();
                },

              ),
            )
          ],

        ),
      ),
    );
  }
}
