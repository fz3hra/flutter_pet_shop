import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/screens/screen_exports.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({super.key});

  @override
  State<TabNavigation> createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  int currentIndex = 0;
  List<Widget> widgets = const [
    HomeScreen(),
    FavouriteScreen(),
    ChatScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widgets[currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: ColorConstants.red,
              unselectedItemColor: ColorConstants.darkGrey,
              onTap: (navIndex) {
                setState(() {
                  currentIndex = navIndex;
                });
              },
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.homeOutline),
                  activeIcon: Icon(EvaIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.starOutline),
                  activeIcon: Icon(EvaIcons.star),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.messageCircleOutline),
                  activeIcon: Icon(EvaIcons.messageCircle),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.personOutline),
                  activeIcon: Icon(EvaIcons.person),
                  label: 'Person',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
