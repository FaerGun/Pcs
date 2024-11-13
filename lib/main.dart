import 'package:untitled/page/basket.dart';
import 'package:untitled/page/favourite.dart';
import 'package:untitled/page/login.dart';
import 'package:untitled/page/profile.dart';
import 'package:flutter/material.dart';
import 'models/note.dart';
import 'page/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(url: 'https://vrhfozwtxyswupwupppl.supabase.co' , anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZyaGZvend0eHlzd3Vwd3VwcHBsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1MzEyNzksImV4cCI6MjA0ODEwNzI3OX0.AKGRL2vGlbSrJEqB9oOVcFSCJnosF72IFbkKl7UvmdU');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Все для улова от рыболова',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
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
  Set<Gear> basketItems = <Gear>{};
  bool _isLoggedIn = false;

  static const List<Widget> _widgetTitles = [
    Text('Главная'),
    Text('Избранное'),
    Text('Корзина'),
    Text('Профиль'),
  ];

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();

    _widgetOptions = <Widget>[
      HomePage(
        favoriteGears: favoriteGears,
        onFavoriteChanged: _onFavoriteChanged,
        onAddToBasket: _addToBasket,
      ),
      FavoritePage(
        favoriteGears: favoriteGears,
        onFavoriteChanged: _onFavoriteChanged,
      ),
      BasketPage(
        basketItems: basketItems,
        onRemoveFromBasket: _removeFromBasket,
      ),
      _isLoggedIn ? const ProfilePage() : const LoginPage(),
    ];

    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      setState(() {
        _isLoggedIn = session != null;
        _widgetOptions[3] = _isLoggedIn ? const ProfilePage() : const LoginPage();
      });
    });
  }

  Future<void> _checkAuthStatus() async {
    final session = Supabase.instance.client.auth.currentSession;
    setState(() {
      _isLoggedIn = session != null;
    });
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

  void _addToBasket(Gear gear) {
    setState(() {
      basketItems.add(gear);
    });
  }

  void _removeFromBasket(Gear gear) {
    setState(() {
      basketItems.remove(gear);
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
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 32, 100, 156),
        unselectedItemColor: const Color.fromARGB(255, 32, 100, 156),
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}