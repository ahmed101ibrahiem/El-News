import 'package:api_2/features/weather/presentation/view/weather_search_screen.dart';
import 'package:flutter/material.dart';

import 'features/news/screens/view/home_view.dart';
import 'features/weather/presentation/view/weather_home_screen.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final List<Widget> _screens = [
    HomeView(),
    WeatherSearchScreen(),
    HomeView(),
  ];
  int _indexScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
          index: _indexScreen,
          children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexScreen,
        onTap: (i) {
          setState(() {
            _indexScreen = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(Icons.home,color: Color(0xFFFF3A44
              ),),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined,
            ), label: 'Favorite',
            activeIcon: Icon(Icons.favorite,color: Color(0xFFFF3A44
            ),),),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag_faces_outlined),
            label: 'Profile',
            activeIcon: Icon(Icons.tag_faces_rounded,color: Color(0xFFFF3A44
            ),),
          ),
        ],
      ),
    );
  }
}
