import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/artists.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Артисты'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: readJson,
                child: const Text('Обновить')
            ),
            _items.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                    itemBuilder: (context, index) {
                    return Card(
                      key: ValueKey(_items[index]["name"]),
                      margin: const EdgeInsets.all(10),
                      color: Colors.amber.shade100,
                      child: ListTile(
                        leading: Text(_items[index]["name"]),
                        title: Text(_items[index]["link"]),
                        subtitle: Text(_items[index]["about"]),
                      ),
                    );
                    }
                ),
            )
                :Container(),
          ]
        ),
      )
    );
  }
}

