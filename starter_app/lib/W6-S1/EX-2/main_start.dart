import 'package:flutter/material.dart';
import 'package:starter_app/W6-S1/EX-2/data/profile_data.dart';
import 'package:starter_app/W6-S1/EX-2/model/profile_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(data: ronanProfile),
  ));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  final ProfileData data;
  const ProfileApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          data.name,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(data.avatarUrl),
              ),
              const SizedBox(height: 20),
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              Text(
                data.position,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ...data.tiles.map((tile) => ProfileTile(
                    icon: tile.icon,
                    title: tile.title,
                    data: tile.value,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
