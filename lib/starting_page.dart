


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heem/components/controllers.dart';

import 'Pages/Event/events.dart';
import 'Pages/OrdersScreen/orders.dart';
import 'Pages/ProfileScreen/profile_screen.dart';
import 'Pages/location/locations.dart';
import 'Pages/reUp/re_up.dart';


class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => StartingPageState();
}

class StartingPageState extends State<StartingPage> {
  //Usercontroller = Get.put(AuthController());
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final screens = [
    const ReUp(),
    const Locations(),
    const EventsClass(),
    const Orders(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const appBarTitle = Text(
      'HEEM',
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 30,
      ), //black: 0xFF000000
    );
    return Scaffold(
      backgroundColor: Colors
          .black, //const Color(0xFF3A3B3C)-> this is grey if wanna switch, Color of background for grid
      appBar: AppBar(
        backgroundColor: Colors.black, // HEEM Gold: 0xffba8d25
        title: appBarTitle,
        actions: [
          IconButton(
            onPressed: () {
              userController.signOut();
            },
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.red,
            ),
          ),
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const UserProfile())
            );
          },
              icon: const Icon(Icons.person)
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black, //heem gold: 0xffba8d25
        selectedItemColor:
            const Color(0xFFf8d47c), //heem light gold: 0xFFf8d47c
        unselectedItemColor: Colors.white, // was black
        iconSize: 40, // iconSize: 40,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/heemLogoNoBackground.png"),
              size: 50, //size: 50
            ),
            label: 'Re-Up',
            backgroundColor: Colors.black, // HEEM gold: 0xffba8d25
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Locations',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Events',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Orders',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
