import 'package:flutter/material.dart';
import 'package:flutter_restaurantapplication/screens/intial_screen.dart';
import './screens/managemenu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Creation',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    StartScreen(),
    MenuManagement(),
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        child: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: currentTabIndex,
          backgroundColor: Colors.purple,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.book, color: Colors.white),
              title: Text(''),
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.fileAlt, color: Colors.white),
                title: Text('')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home, color: Colors.white),
                title: Text('')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.bell, color: Colors.white),
                title: Text('')),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user, color: Colors.white),
                title: Text(''))
          ],
        ),
      ),
    );
  }
}
