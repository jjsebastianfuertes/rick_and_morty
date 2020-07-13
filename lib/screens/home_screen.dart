import 'package:flavors_example/providers/characters_provider.dart';
import 'package:flavors_example/providers/episodes_provider.dart';
import 'package:flavors_example/providers/locations_provider.dart';
import 'package:flavors_example/screens/characters_tab.dart';
import 'package:flavors_example/screens/episodes_tab.dart';
import 'package:flavors_example/screens/locations_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    CharactersTab(),
    EpisodesTab(),
    LocationsTab()
  ];

  void _onItemTapped(int index) {
    /// * Reset page counter for every tab
    Provider.of<CharacterProvider>(context, listen: false).page = 0;
    Provider.of<EpisodesProvider>(context, listen: false).page = 0;
    Provider.of<LocationsProvider>(context, listen: false).page = 0;
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rick and Morty"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Characters'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('Episodes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            title: Text('Locations'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
