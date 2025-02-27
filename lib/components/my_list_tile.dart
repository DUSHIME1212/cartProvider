import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  void Function()? onTap;
  final String title;
  final IconData icon;
   MyListTile({
    required this.onTap,
    required this.title,
     required this.icon,
     super.key
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
            icon,
          color: Theme.of(context).colorScheme.inversePrimary,

        ),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
