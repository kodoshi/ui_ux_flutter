import 'package:banking_app/pages/amount_page.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/pages/welcome_page.dart';
import 'package:banking_app/pages/profile_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.initialPage = 1}) : super(key: key);

  final int initialPage;

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentPageIndex;
  late PageController _pageController;
  final List<Widget> _pages = [
    const WelcomePage(),
    const ProfilePage(),
    const AmountPage()
  ];

  final List<BottomNavigationBarItem> _navbarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded), label: 'Welcome'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialPage;
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // To patch the text_painter exception
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        currentIndex: _currentPageIndex,
        items: _navbarItems,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() => _currentPageIndex = page);
  }

  void _onTabTapped(int index) {
    setState(() => _currentPageIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }
}
