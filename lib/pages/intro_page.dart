import 'package:flutter/material.dart';
import 'package:shoppingapp/components/my_button.dart';
import 'package:shoppingapp/themes/dark_mode.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Center(
                child: Icon(
                    Icons.shop_rounded,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
            ),
            SizedBox.fromSize(size: const Size.fromHeight(32)),
            
            //tittle
            Text("Minimal shop", style: TextStyle(fontSize: 24),),

            SizedBox.fromSize(size: const Size.fromHeight(6)),

            //subtitle
            Text("Premium quality products", style: TextStyle(fontSize: 20),),

            SizedBox.fromSize(size: const Size.fromHeight(12)),

            //button
            Text("Minimal shop", style: TextStyle(fontSize: 12),),
            SizedBox.fromSize(size: const Size.fromHeight(12)),
            MyButton(child: Icon(Icons.arrow_right), onTap: (){
              Navigator.pushNamed(context, '/shop_page');
            },)
          ],
        )
    );
  }
}
