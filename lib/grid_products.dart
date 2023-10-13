import 'dart:convert';

import 'package:assignment_1/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridViewProducts extends StatefulWidget {
  const GridViewProducts({super.key});

  @override
  State<GridViewProducts> createState() => _GridView();
}

class _GridView extends State<GridViewProducts> {
  List<Products> postList = [];

  Future<List<Products>> getPostApi() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map j in data) {
        postList.add(Products.fromJson(j));
      }
      return postList;
    } else {
      throw Exception('Failed to load comments');
    }
  }

  List<Card> _GridCards(List<Products> products) {
    return List.generate(products.length, (index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.network(
                products[index].image_link.toString(),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products[index].name.toString()),
                  const SizedBox(height: 8.0),
                  Text(products[index].brand.toString()),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('MY APP'),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // ignore: avoid_print
                print("menu button pressed!");
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // ignore: avoid_print
                  print('search button pressed');
                },
              ),
              IconButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('filter button pressed');
                  },
                  icon: const Icon(Icons.tune)),
            ]),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RefreshIndicator(
                    onRefresh: getPostApi,
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(16.0),
                      childAspectRatio: 8.0 / 9.0,
                      children: _GridCards(postList),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
          ],
        ));
  }
}
