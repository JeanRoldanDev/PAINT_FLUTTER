import 'package:dragapp/colored_path_adapter.dart';
import 'package:dragapp/drawing_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ColoredPathAdapter());

  runApp(const DrawApp());
}

class DrawApp extends StatelessWidget {
  const DrawApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Sketchpad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: FutureBuilder(
        future: Hive.openBox('sketch'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              return const Scaffold(
                body: Center(
                  child: Text('Something went wrong :/'),
                ),
              );
            } else {
              return const DrawingScreen();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Opening Hive...'),
              ),
            );
          }
        },
      ),
    );
  }
}
