import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(Icons.change_circle_outlined),
            title: Text('Utilizar outro RA'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.api),
            title: Text('API'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.info_outline),
            title: Text('Sobre o aplicativo'),
          ),
        ],
      ),
    );
  }
}
