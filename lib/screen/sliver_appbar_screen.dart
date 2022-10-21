import 'package:flutter/material.dart';
import 'package:flutter_factory/controller/video_notifier.dart';
import 'package:flutter_factory/screen/video_page.dart';
import 'package:provider/provider.dart';

class SliverAppBarScreen extends StatefulWidget {
  const SliverAppBarScreen({Key? key}) : super(key: key);

  @override
  State<SliverAppBarScreen> createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  @override
  void initState() {
    super.initState();

    // data  한번 불러와
    Provider.of<VideoNotifier>(context, listen: false).fetchAllVideos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // block : 1. Header
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
                      // print('Map pressed');
                    },
                    icon: const Icon(Icons.map),
                    highlightColor: Colors.blue,
                    splashColor: Colors.purple,
                  ),
                  TextButton(
                    onPressed: () {
                      // print("Cart Tapped");
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                    child: const Text('Cart'),
                  ),
                ],
                bottom: _buildTabBar(),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    /**
                     * chk : 앱바 크기와 아래 탭바 크기를 제외한 영역 .. 중요함
                     */
                    padding:
                        const EdgeInsets.symmetric(vertical: kToolbarHeight),
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              )
            ]; // list widget return
          },
          // block : 2. body
          body: _buildTabBarView(),
        ),
      ),
    );
  }

  //--------------------- refactor widget ---------------------------------//
  TabBar _buildTabBar() {
    return const TabBar(
        indicatorWeight: 5,
        indicatorColor: Colors.white,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(icon: Icon(Icons.video_collection), child: Text('Videos')),
          Tab(icon: Icon(Icons.file_copy_outlined), child: Text('Docs')),
        ]);
  }

  // info : 2. 화면의 탭바 뷰
  TabBarView _buildTabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const VideoPage(),
        Container(color: Colors.pink),
      ],
    );
  }
}
