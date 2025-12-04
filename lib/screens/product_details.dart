import 'package:flutter/material.dart';
import '../models/perfume.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    if (args == null) {
      return Scaffold(
        body: Center(
          child: Text("No product data received"),
        ),
      );
    }

    final Perfume perfume = args as Perfume;

    return Scaffold(
      appBar: AppBar(title: Text(perfume.name)),
      body: Column(
        children: [
          Image.network(perfume.image),
          SizedBox(height: 20),
          Text(perfume.description),
        ],
      ),
    );
  }

}
