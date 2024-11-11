import 'package:flutter/material.dart';
import 'product_list_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color swampColor = Color(0xFF4B8B3B);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Все для улова от рыболова',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListScreen(),
                  ),
                );
              },
              child: Text('View Products'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      fullName: 'Jared Leto',
                      phoneNumber: '+1228337890',
                      email: 'leto.doe@example.com',
                    ),
                  ),
                );
              },
              child: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}