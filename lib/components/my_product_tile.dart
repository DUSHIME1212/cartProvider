import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/models/Shop.dart';
import 'package:shoppingapp/models/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  MyProductTile({required this.product, super.key});
  // void Function()? onTap;

  void addToCart(BuildContext item) {
    //show dialog to confirm adding to cart
    showDialog(
        context: item,
        builder: (context) => AlertDialog(
          title: Text("Add to cart"),
          content: Text("Are you sure you want to add ${product.name} to your cart?"),
          actions: [
            MaterialButton(onPressed: () => Navigator.pop(context), child: Text("No")),
            MaterialButton(onPressed: () =>{
              Navigator.pop(context),
              context.read<Shop>().addToCart(product)
            }, child: Text("Yes")),
          ]
        ));

    Provider.of<Shop>(item, listen: false).addToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  child: Image.asset(product.imagePath),
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(product.description),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                product.price.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              //button to add to cart
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(4),
                child: IconButton(onPressed: () => addToCart(context), icon: Icon(Icons.add)),
              )
            ],
          ),

          //button to add to cart
        ],
      ),
    );
  }
}
