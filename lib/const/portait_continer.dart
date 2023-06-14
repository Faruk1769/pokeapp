import 'package:flutter/material.dart';
import 'package:pokeapp/const/poke_type_container.dart';
import 'package:pokeapp/const/text_style.dart';

Widget portraitCootaier(data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headingText(color: Colors.white, size: 36, text: data["name"]),
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
            Image.network(
              data["imageurl"],
              width: 120,
            ),
          ],
        ),
      )
    ],
  );
}
