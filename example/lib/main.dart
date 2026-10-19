
import 'package:brihan_bottom_nav/brihan_bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NavbarExampleApp());
}

class NavbarExampleApp extends StatelessWidget {
  const NavbarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navbar Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const NavbarExamplePage(),
    );
  }
}

class NavbarExamplePage extends StatefulWidget {
  const NavbarExamplePage({super.key});

  @override
  State<NavbarExamplePage> createState() =>
      _NavbarExamplePageState();
}

class _NavbarExamplePageState extends State<NavbarExamplePage> {
  int selectedIndex = 0;

  final pages = const [
    ('Home', Icons.home),
    ('Search', Icons.search),
    ('Profile', Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedPage = pages[selectedIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Custom Navbar Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(selectedPage.$2, size: 64),
            const SizedBox(height: 16),
            Text(
              selectedPage.$1,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text('Selected tab: ${selectedIndex + 1}'),
          ],
        ),
      ),
      bottomNavigationBar: CommonNavbar(
        icons: pages.map((page) => page.$2).toList(),
        selectedIndex: selectedIndex,
        selectedColor: Colors.blue,
        unselectedColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
