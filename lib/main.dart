import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online_store/screens/homepage.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Store',
      home: HomePage(),
      theme: ThemeData(
          textTheme: TextTheme(labelLarge: TextStyle())
              .apply(bodyColor: Colors.blue, displayColor: Colors.blue)),
    );
  }
}
