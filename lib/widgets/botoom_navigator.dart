import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BotoomNavigator extends StatelessWidget {
  final int _activeItem = 0;

  BotoomNavigator(_activeItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      //color: Colors.blue,
      color: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
      height: 45,
      index: _activeItem,
      items: const [
        Icon(Icons.home),
        Icon(Icons.list),
        Icon(Icons.contact_support),
        Icon(Icons.person_off_rounded),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/placa');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/placa');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/placa');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/placa');
        }
      },
    );
  }
}
