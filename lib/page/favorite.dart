import 'package:flutter/material.dart';
import '../components/item.dart';
import '../models/note.dart';

class FavoritePage extends StatefulWidget {
  final Set<Gear> favoriteGears;
  final Function(Gear, bool) onFavoriteChanged;

  const FavoritePage({
    super.key,
    required this.favoriteGears,
    required this.onFavoriteChanged,
  });

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Избранное',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: widget.favoriteGears.isEmpty
          ? const Center(
        child: Text(
          'У вас нет избранных товаров',
          style: TextStyle(fontSize: 18),
        ),
      )
          : GridView.builder(
        itemCount: widget.favoriteGears.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          final gears = widget.favoriteGears.elementAt(index);
          return Stack(
            children: [
              Item(gear: gears),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    widget.onFavoriteChanged(gears, false);
                    setState(() {});
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}