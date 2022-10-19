import 'package:flutter/material.dart';
import 'package:flutter_factory/screen/sliver_appbar_screen.dart';
import 'package:flutter_factory/screen/test.dart';
import 'package:flutter_factory/widgets/custom_bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          SliverAppBarScreen(),
          Test(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: selectedIndex,
        changeTabs: (int value) {
          selectedIndex = value;
          currentSetState();
        },
      ),
    );
  }

  // info : 사용자 setState()
  void currentSetState() {
    setState(() {});
  }
}
