
import 'package:flutter/material.dart';

import 'pages/add_task_page.dart';
import 'pages/home_page.dart';
import 'pages/profile.dart';
import 'widgets/theme.dart';

class TabBarr extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  const TabBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AddTaskPage(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'My Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Add Task'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Globgreen,
        onTap: _onItemTapped,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: selectionWhiteColor,
      // context.theme.backgroundColor,
      title: Text(
        'MyPlanner',
        style: myplannerAppbar,
      ),
    );
  }
}
