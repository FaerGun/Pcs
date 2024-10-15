import 'page/favorite.dart';
import 'page/profile.dart';
import 'package:flutter/material.dart';
import 'models/note.dart';
import 'page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color swampColor = Color(0xFF4B8B3B);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Все для улова от рыболова',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  Set<Gear> favoriteGears = <Gear>{};

  static const List<Widget> _widgetTitles = [
    Text('Главная'),
    Text('Избранное'),
    Text('Профиль'),
  ];

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();

    _widgetOptions = <Widget>[
      HomePage(
        favoriteGears: favoriteGears,
        onFavoriteChanged: _onFavoriteChanged,
      ),
      FavoritePage(
        favoriteGears: favoriteGears,
        onFavoriteChanged: _onFavoriteChanged,
      ),
      const ProfilePage(),
    ];
  }

  void _onFavoriteChanged(Gear gear, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        favoriteGears.add(gear);
      } else {
        favoriteGears.remove(gear);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 32, 100, 156),
        onTap: _onItemTapped,
      ),
    );
  }
}