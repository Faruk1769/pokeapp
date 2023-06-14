// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:pokeapp/const/poke_type_container.dart';
import 'package:pokeapp/const/text_style.dart';

import 'api_services.dart';
import 'const/colors.dart';
import 'details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Demo(),
      theme: ThemeData(
        fontFamily: "circula",
      ),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "PokeApp",
                style: TextStyle(
                  fontFamily: "circula_bold",
                  fontSize: 36,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder(
                    future: getAPI(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        return GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: width < 600
                                        ? 2
                                        : width < 1100
                                            ? 4
                                            : 6,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsScreen(data:data[index])));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -50,
                                        right: -50,
                                        child: Image.asset(
                                          "assets/pokeball.png",
                                          width: 150,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Image.network(
                                          data[index]["imageurl"],
                                          width: 130,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            headingText(
                                              color: Colors.white,
                                              size: 24,
                                              text: data[index]["name"],
                                            ),
                                            typeContainer(
                                              color: Colors.white,
                                              size: 16,
                                              text: "Grass",
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            typeContainer(
                                              color: Colors.white,
                                              size: 16,
                                              text: "Poison",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              lightGreen,
                            ),
                          ),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
