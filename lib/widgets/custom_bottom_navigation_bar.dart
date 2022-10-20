// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  int currentIndex;
  final Function(int) changeTabs;

  CustomBottomNavigationBar({super.key, required this.currentIndex, required this.changeTabs});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        currentIndex = index;
        changeTabs(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Sliver'),
        BottomNavigationBarItem(icon: Icon(Icons.headphones), label: 'Sticky'),
      ],
    );
  }
}
