import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

Widget rewardWidget(String title, Widget content) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
    child: ExpansionTileCard(
      elevation: 0,
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: content,
        ),
      ],
    ),
  );
}

Widget punishmentWidget(String title, Widget content) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
    child: ExpansionTileCard(
      elevation: 0,
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: content,
        ),
      ],
    ),
  );
}
