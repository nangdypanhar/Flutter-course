import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ProductImg {
  flutter("assets/flutter.png"),
  dart("assets/dart.png"),
  firebase("assets/firebase.png");

  final String label;
  const ProductImg(this.label);

  @override
  String toString() => label;
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final ProductImg productImg;
  const ProductCard(
      {super.key,
      required this.title,
      required this.description,
      required this.productImg});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productImg.label,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              description,
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Products",
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductCard(
              title: "Dart",
              description: "Dart for beginners",
              productImg: ProductImg.dart,
            ),
            SizedBox(
              height: 20,
            ),
            ProductCard(
              title: "Flutter",
              description: "Flutter for beginners",
              productImg: ProductImg.flutter,
            ),
            SizedBox(
              height: 20,
            ),
            ProductCard(
              title: "Firebase",
              description: "Firbase for beginners",
              productImg: ProductImg.firebase,
            ),
          ],
        ),
      ),
    )),
  );
}
