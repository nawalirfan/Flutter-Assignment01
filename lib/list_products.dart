import 'dart:convert';

import 'package:assignment_1/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiGrid extends StatefulWidget {
  const ApiGrid({super.key});

  @override
  State<ApiGrid> createState() => _ApiState();
}

class _ApiState extends State<ApiGrid> {
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
                      child: ListView.builder(
                          itemCount: postList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Container(
                                          color: const Color.fromARGB(
                                              153, 164, 235, 238),
                                          child: Container(
                                            padding: EdgeInsets.all(15.0),
                                            child: Column(children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      radius: 20,
                                                      child: ClipOval(
                                                        child: Image.network(
                                                          postList[index]
                                                              .image_link
                                                              .toString(),
                                                          width:
                                                              40, // Set the desired width
                                                          height:
                                                              40, // Set the desired height
                                                          fit: BoxFit
                                                              .cover, // Adjust the fit property as needed
                                                        ),
                                                      )),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              bottom: 10.0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            postList[index]
                                                                .name
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Text(
                                                            postList[index]
                                                                .description
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        92,
                                                                        92,
                                                                        92)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 15.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Brand: ${postList[index].brand.toString().toUpperCase()}',
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              92, 92, 92, 1)),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    92,
                                                                    92,
                                                                    92,
                                                                    1)),
                                                        children: <TextSpan>[
                                                          const TextSpan(
                                                            text: 'Price: ',
                                                          ),
                                                          const TextSpan(
                                                            text: '\$',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                postList[index]
                                                                    .price
                                                                    .toString(),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xFF5C5C5C)),
                                                      children: <TextSpan>[
                                                        const TextSpan(
                                                          text:
                                                              'Product Type: ',
                                                        ),
                                                        TextSpan(
                                                            text: postList[
                                                                    index]
                                                                .product_type
                                                                .toString()
                                                                .toUpperCase(),
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFFFF7C7C),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              92, 92, 92, 1)),
                                                      children: <TextSpan>[
                                                        const TextSpan(
                                                          text: 'Rating: ',
                                                        ),
                                                        TextSpan(
                                                            text:
                                                                postList[index]
                                                                    .rating
                                                                    .toString(),
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFFFF6D6D),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (postList[index]
                                                          .product_colors !=
                                                      null &&
                                                  postList[index]
                                                      .product_colors!
                                                      .isNotEmpty)
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: postList[index]
                                                        .product_colors!
                                                        .map((color) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: CircleAvatar(
                                                          backgroundColor: Color(
                                                              int.parse(color
                                                                  .hex_value
                                                                  .toString()
                                                                  .replaceAll(
                                                                      '#',
                                                                      '0xFF'))),
                                                          radius: 20,
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                )
                                            ]),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Image.network(
                                        postList[index].image_link.toString(),
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                      title: Text(
                                        postList[index].name.toString(),
                                      ),
                                      trailing: Text(
                                        '\$ ${postList[index].price.toString()}',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }));
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
