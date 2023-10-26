import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/screens/subscreens/data_tables_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/tres_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/uno_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedPage = 0;
  final screens = [const UnoScreen(), DataTablesScreen(), const TresScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPage],
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 10, spreadRadius: 5)
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              items: itemsBNB(),
              currentIndex: selectedPage,
              onTap: (position) {
                setState(() {
                  selectedPage = position;
                  //selectionTab(position);
                });
              },
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.blueGrey,
              backgroundColor: Colors.green,
            ),
          )),
    );
  }

  List<BottomNavigationBarItem> itemsBNB() {
    List<BottomNavigationBarItem> list = [];
    list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"));
    list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.star), label: "Tablas"));
    list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.pending), label: "Pendientes"));
    return list;
  }
}
