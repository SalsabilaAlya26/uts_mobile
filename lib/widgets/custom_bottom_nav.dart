import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  CustomBottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'Tasbih'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Doa'),
        BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Sholat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
