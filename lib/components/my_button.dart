import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onTap;
  final Widget child;
  MyButton({
    required this.child,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.red),
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
          padding: const EdgeInsets.all(12),
        child: child,
      ),
      onTap: onTap,
    );
  }
}
