import 'package:flutter/material.dart';
import '../models/perfume.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Perfume perfume = ModalRoute.of(context)!.settings.arguments as Perfume;

    return Scaffold(
      appBar: AppBar(title: Text(perfume.name)),
      body: Column(
        children: [
          Image.network(perfume.image),
          SizedBox(height: 20),
          Text(perfume.description, style: TextStyle(fontSize: 18)),
          Text("السعر: ${perfume.price} ريال", style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
