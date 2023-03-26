import 'package:flutter/material.dart';
import 'package:food_system/infoScreens/communityCard.dart';
import 'package:food_system/searchingScreens/mainSearchPg.dart';

int manyClicks = 1;
List currentScreen = [0, 0];

class BottomNavigateBar extends StatelessWidget {
  List<Widget> pages = [
    mainSearchPage(""),
    mainSearchPage(""),
    mainSearchPage(""),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        //even spaced out
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'your basket ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: 'Filter ',
          ),
        ],
        currentIndex: 0,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => mainSearchPage(""),
                    fullscreenDialog: true));
          }
          if (value == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => mainSearchPage(""),
                    fullscreenDialog: true));
          } else if (value == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => mainSearchPage(""),
                    fullscreenDialog: true));
          }
        });
  }
}
