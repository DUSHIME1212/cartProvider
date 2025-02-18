import 'package:flutter/material.dart';
import 'package:shoppingapp/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo

          //shop title
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.shop_rounded,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  )),
              MyListTile(onTap: () {
                Navigator.pop(context);
              }, title: "Shop", icon: Icons.home,),
              MyListTile(onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              }, title: "Cart", icon: Icons.add_shopping_cart,),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false);
            }, title: "Exit", icon: Icons.exit_to_app,),
          ),
          //cart title

          //orders title

          //exit
        ],
      ),
    );
  }
}
