import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:library_sys/screen/home_screen.dart';
import 'package:library_sys/screen/profile_screen.dart';
import 'package:library_sys/screen/search_screen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const routeName = '/bottom-nav-screen';
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Map<String, Object>> _pages = [
    {
      'page': const HomeScreen(),
      'title': 'Feeds',
    },
    {
      'page': const ProfileScreen(),
      'title': 'My Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey<State<TitledBottomNavigationBar>>();
    return Scaffold(
      body: Material(
        child: PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimatiion) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimatiion,
              child: child,
            );
          },
          child: _pages[_selectedPageIndex]['page'] as Widget,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        },
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        key: globalKey,
        onTap: _selectPage,
        curve: Curves.bounceInOut,
        currentIndex: _selectedPageIndex,
        reverse: true,
        inactiveColor: Colors.black,
        items: [
          TitledNavigationBarItem(
            icon: const Icon(Icons.book),
            title: const Text('All Books'),
          ),
          TitledNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
