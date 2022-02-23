import 'package:flutter/material.dart';
import 'package:gsb_medecin/view/medecin_list.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final screens = [
    const MedecinList(),
    const Center(
      child: Text("Pays"),
    ),
    const Center(
      child: Text("Départements"),
    ),
    const Center(
      child: Text("Spécialités Complémentaires"),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          height: 60,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.medical_services_outlined),
              selectedIcon: Icon(Icons.medical_services),
              label: 'Médecins',
            ),
            NavigationDestination(
              icon: Icon(Icons.flag_outlined),
              selectedIcon: Icon(Icons.flag),
              label: 'Pays',
            ),
            NavigationDestination(
              icon: Icon(Icons.place_outlined),
              selectedIcon: Icon(Icons.place),
              label: 'Départements',
            ),
            NavigationDestination(
              icon: Icon(Icons.format_list_bulleted_outlined),
              selectedIcon: Icon(Icons.format_list_bulleted),
              label: 'Spécialités',
            ),
          ],
        ),
      ),
    );
  }
}
