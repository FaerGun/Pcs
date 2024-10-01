import 'package:flutter/material.dart';
import '../page/note.dart';
import '../models/note.dart';
import '../components/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Все для улова от рыболова',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: gears.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(gear: gears[index]),
                ),
              );
            },
            child: Item(gear: gears[index]),
          );
        },
      ),
    );
  }
}