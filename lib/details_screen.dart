// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:pokeapp/const/colors.dart';
import 'package:pokeapp/const/portait_continer.dart';
import 'package:pokeapp/const/rowStyling.dart';
import 'package:pokeapp/const/star_low.dart';
import 'package:pokeapp/const/text_style.dart';

import 'const/landscape_container.dart';

class DetailsScreen extends StatelessWidget {
   final dynamic data;
  const DetailsScreen({super.key, this.data});
 

  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        backgroundColor: Colors.red,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                // color: Colors.amber,

                child: orientation == Orientation.portrait
                    ? portraitCootaier(data)
                    : landspaceContainer(),
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const TabBar(
                      labelColor: black,
                      unselectedLabelColor: grey,
                      tabs: [Tab(text: "About"), Tab(text: "Base Stats")]),
                  Expanded(
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            normalText(
                                color: black,
                                size: 16,
                                text: data["xdescription"]
                              ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: width - 100,
                                child: Card(
                                  color: lightGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            headingText(
                                                color: grey,
                                                size: 16,
                                                text: "Height"),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            headingText(
                                                color: grey,
                                                size: 16,
                                                text: data["height"]),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            headingText(
                                                color: grey,
                                                size: 16,
                                                text: "Weight"),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            headingText(
                                                color: grey,
                                                size: 16,
                                                text: data["weight"]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            headingText(
                                color: black, size: 16, text: "Breeding"),
                            SizedBox(
                              height: 5,
                            ),
                            rowStyling(text: "Gender", value: "Male"),
                            rowStyling(
                                text: "Egg Cycle", value: "Grass,Monster"),
                            rowStyling(
                                text: "Evolution", value: "Grass,Monster")
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            statRow(text: "HP", value: "20"),
                            statRow(text: "Attack", value: "70"),
                            statRow(text: "Defence", value: "40"),
                            statRow(text: "Evolution", value: "90"),
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
