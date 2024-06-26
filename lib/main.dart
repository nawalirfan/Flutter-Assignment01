import 'package:assignment_1/grid_products.dart';
import 'package:assignment_1/list_products.dart';
import 'package:assignment_1/list_comments.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ApiData(),
      // home: ApiGrid(),
      home: GridViewProducts(),
    );
    // home: const SingleChildScrollView(
    //   child: ApiGrid(),
    // ));
  }
}
