import 'package:flutter/material.dart';
import 'package:pokeapp/const/poke_type_container.dart';
import 'package:pokeapp/const/text_style.dart';

Widget landspaceContainer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingText(color: Colors.white, size: 36, text: "Bulbasaur"),
          Row(
            children: [
              typeContainer(color: Colors.white, size: 16, text: "Grass"),
              const SizedBox(
                width: 6,
              ),
              typeContainer(color: Colors.white, size: 16, text: "Poison"),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/pokeball.png",
              width: 140,
              color: Colors.white.withOpacity(0.5),
            ),
            Image.asset(
              "assets/img1.png",
              width: 120,
            ),
          ],
        ),
      )
    ],
  );
}
