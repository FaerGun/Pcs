import 'package:flutter/material.dart';
import '../models/note.dart';
import '../components/item.dart';
import '../page/note.dart';

class HomePage extends StatefulWidget {
  final Set<Gear> favoriteGears;
  final Function(Gear, bool) onFavoriteChanged;

  const HomePage({
    Key? key,
    required this.favoriteGears,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _priceController = TextEditingController();
  final _brandController = TextEditingController();
  final _flavorController = TextEditingController();


  void _toggleFavorite(Gear gear) {
    final isFavorite = widget.favoriteGears.contains(gear);
    widget.onFavoriteChanged(gear, !isFavorite);
  }

  void _addNewGear() {
    setState(() {
      gears.add(
        Gear(
          name: _nameController.text,
          description: _descriptionController.text,
          imageUrl: _imageUrlController.text,
          price: int.tryParse(_priceController.text) ?? 0,
          brand: _brandController.text,
          flavor: _flavorController.text,

        ),
      );
    });

    _nameController.clear();
    _descriptionController.clear();
    _imageUrlController.clear();
    _priceController.clear();
    _brandController.clear();
    _flavorController.clear();

  }

  void _showAddGearDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить новый товар'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Название'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Описание'),
                ),
                TextField(
                  controller: _imageUrlController,
                  decoration: const InputDecoration(labelText: 'URL изображения'),
                ),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Цена'),
                ),
                TextField(
                  controller: _brandController,
                  decoration: const InputDecoration(labelText: 'Бренд'),
                ),
                TextField(
                  controller: _flavorController,
                  decoration: const InputDecoration(labelText: 'Вкус'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                _addNewGear();
                Navigator.of(context).pop();
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Все для улова от рыболова'),
      ),
      body: GridView.builder(
        itemCount:gears.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          final gear = gears[index];
          final isFavorite = widget.favoriteGears.contains(gear);

          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        gear: gear,
                        onDelete: () => setState(() {}),
                      ),
                    ),
                  );
                },
                child: Item(gear: gear),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    _toggleFavorite(gear);
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