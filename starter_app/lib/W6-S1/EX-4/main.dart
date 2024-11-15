import 'package:flutter/material.dart';
import 'package:starter_app/W6-S1/EX-4/data/joke_data.dart';
import 'package:starter_app/W6-S1/EX-4/jokes.dart';

Color appColor = Colors.green[300] as Color;

class FavoriteCard extends StatelessWidget {
  final bool isFavorite;
  final Joke data;
  final VoidCallback onFavoriteClick;
  const FavoriteCard({
    super.key,
    required this.data,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(data.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int favoriteIndex = -1;

  List<Widget> favoriteCards() {
    return List.generate(jokeData.length, (i) {
      return FavoriteCard(
        data: jokeData[i],
        isFavorite: i == favoriteIndex,
        onFavoriteClick: () {
          setState(() {
            favoriteIndex = i;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: favoriteCards(),
          ),
        ),
      ),
    );
  }
}
