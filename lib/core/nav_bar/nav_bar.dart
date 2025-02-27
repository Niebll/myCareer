import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomBar(
      width: MediaQuery.of(context).size.width * 0.9,
      borderRadius: BorderRadius.circular(20),
      barColor: Colors.grey[300]!,
      body: (BuildContext context, ScrollController controller) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Text("Body"),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.work, "Karier", NavBar(), isActive: true),
            _buildNavItem(context, Icons.groups, "Komunitas", NavBar()),
            _buildNavItem(context, Icons.menu_book, "Belajar", NavBar()),
            _buildNavItem(context, Icons.add, "Bootcamp", NavBar()),
            _buildNavItem(context, Icons.person, "Profil", NavBar()),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, Widget destination, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.black : Colors.grey[800]),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.grey[800],
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
