import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   backgroundColor: Colors.black87,
      //   // info : appBar 의 좌측
      //   leading: Image.asset("assets/images/logo.png"),
      //   // info : appBar 의 우측
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         if (kDebugMode) print('Map pressed');
      //       },
      //       icon: const Icon(Icons.map),
      //       highlightColor: Colors.blue,
      //       splashColor: Colors.purple,
      //     ),
      //     TextButton(
      //       onPressed: () {
      //         if (kDebugMode) print("Cart Tapped");
      //       },
      //       style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
      //       child: const Text('Cart'),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (_, __) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  // info : floating 과 snap 은 동시에 true 여야 한다.
                  snap: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  backgroundColor: Colors.black87,
                  title: const Text('Home'),
                  leading: Image.asset("assets/images/logo.png"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        if (kDebugMode) print('Map pressed');
                      },
                      icon: const Icon(Icons.map),
                      highlightColor: Colors.blue,
                      splashColor: Colors.purple,
                    ),
                    TextButton(
                      onPressed: () {
                        if (kDebugMode) print("Cart Tapped");
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                      child: const Text('Cart'),
                    ),
                  ],
                  bottom: _buildTabBar(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      /**
                       * chk : 앱바 크기와 아래 탭바 크기를 제외한 영역 .. 중요함
                       */
                      padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
                      child: Image.asset(
                        "assets/images/logo.png",
                      ),
                    ),
                  ),
                )
              ]; // list widget return
            },
            body: _buildTabBarView(),
          ),
        ),
      ),
    );
  }

  //--------------------- refactor widget ---------------------------------//
  // info : 1. 탭바
  TabBar _buildTabBar() {
    return const TabBar(
        indicatorWeight: 5,
        indicatorColor: Colors.white,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(icon: Icon(Icons.people), child: Text('Contacts')),
          Tab(icon: Icon(Icons.settings), child: Text('Settings')),
        ]);
  }

  // info : 2. 화면의 탭바 뷰
  TabBarView _buildTabBarView() {
    return TabBarView(children: [
      Container(color: Colors.amber),
      Container(color: Colors.pink),
    ]);
  }
}
