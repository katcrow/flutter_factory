// import 'package:flutter/material.dart';
// import 'package:flutter_factory/controller/video_notifier.dart';
// import 'package:flutter_factory/screen/home.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(
//       // options: DefaultFirebaseOptions.currentPlatform
//       );
//
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider<VideoNotifier>(
//         create: (context) => VideoNotifier(),
//       )
//     ],
//     child: const MyApp(),
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const Home(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_factory/controller/video_notifier.dart';
import 'package:flutter_factory/screen/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<VideoNotifier>(
        create: (context) => VideoNotifier(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // print("snapshot :: ${snapshot}");
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.blue),
              home: const Home(),
            );
          }
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            ),
          );
        });
  }
}
