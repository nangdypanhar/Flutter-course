import 'package:expense_tracker/Theme/them_provider.dart';
import 'package:expense_tracker/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListTile(
      title: const Text(
        "Welcome Back",
        style: TextStyle(fontSize: 15),
      ),
      subtitle: const Text(
        "Nangdy Panhar",
        style: TextStyle(fontSize: 20),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: Icon(
              Icons.sunny,
              color: themeProvider.isDarkMode ? Colors.grey : Colors.yellow,
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(Avatar.man.path),
          ),
        ],
      ),
    );
  }
}
