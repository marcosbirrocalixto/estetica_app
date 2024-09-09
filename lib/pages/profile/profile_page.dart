import 'package:flutter/material.dart';

import '../../widgets/botoom_navigator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Meu Veículo'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 250, 250, 251),
          fontSize: 25,
          fontWeight: FontWeight.bold),
      ),
      body: Center(child: _buildProfilePage(context),),
      bottomNavigationBar: BotoomNavigator(1),
    );
  }

  Widget _buildProfilePage(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('RME4J27', 
            style: TextStyle(color: Colors.black, 
            fontWeight: FontWeight.bold,
            fontSize: 18),
          ),
          Text('Chevrolet ONIX Plus LT', 
            style: TextStyle(color: Colors.black, 
            //fontWeight: FontWeight.bold,
            fontSize: 18),
          ),
        ],
      ),
    );
  }
}
