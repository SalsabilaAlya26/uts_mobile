import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(padding: EdgeInsets.all(12), child: child),
    );
  }
}
