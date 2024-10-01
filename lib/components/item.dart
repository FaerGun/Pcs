import 'package:flutter/material.dart';

import '/models/note.dart';
import '/page/note.dart';

class Item extends StatelessWidget {
  final  Gear gear;

  const Item({super.key, required this.gear});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              gear.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gear.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(gear.description),
                  const SizedBox(height: 10),
                  Text('Цена: ${gear.price} рублей'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}