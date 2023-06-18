import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ListTileExample extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ListTileExample({Key? key});

  @override
  Widget build(BuildContext context) {
    final listTiles = <Widget>[
      const ListTile(
        title: Text(
          'Tile 0: basic',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Divider(),
      const ListTile(
        leading: Icon(Icons.face, color: Colors.green),
        title: Text(
          'Tile 1: with leading/trailing widgets',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(Icons.tag_faces, color: Colors.deepPurple),
      ),
      const Divider(),
      const ListTile(
        title: Text(
          'Tile 2 title',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'subtitle of tile 2',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      const Divider(),
      const ListTile(
        title: Text(
          'Tile 3: 3 lines',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        isThreeLine: true,
        subtitle: Text(
          'subtitle of tile 3',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      const Divider(),
      const ListTile(
        title: Text(
          'Tile 4: dense',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        dense: true,
      ),
      const Divider(),
      const ListTile(
        title: Text(
          'Tile 5: tile with badge',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '(This uses the badges package)',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        trailing: badges.Badge(
          badgeContent: Text(
            '3',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Icon(Icons.message, color: Color.fromARGB(255, 255, 0, 0)),
        ),
      ),
    ];

    return Container(
      margin: const EdgeInsets.all(16.0),
      child: ListView(
        children: listTiles,
      ),
    );
  }
}
