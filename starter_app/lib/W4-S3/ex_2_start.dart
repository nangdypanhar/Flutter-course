import 'package:flutter/material.dart';

class FavoritCard extends StatefulWidget {
  final String title;
  final String description;
  const FavoritCard(
      {super.key, required this.title, required this.description});

  @override
  State<FavoritCard> createState() => _FavoritCardState();
}

class _FavoritCardState extends State<FavoritCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.title),
        subtitle: Text(widget.description),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: Icon(Icons.favorite,
              color: isFavorite ? Colors.red : Colors.grey),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [FavoritCard(title: "Hello world", description: "Yes")],
        ),
      ),
    ));
