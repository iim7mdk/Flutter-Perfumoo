import 'package:flutter/material.dart';
import '../data/fake_data.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("عطور المتجر")),
      body: ListView.builder(
        itemCount: perfumes.length,
        itemBuilder: (context, i) {
          final p = perfumes[i];
          return ListTile(
            leading: Image.network(p.image, width: 50, height: 50),
            title: Text(p.name),
            subtitle: Text("${p.price} ريال"),
            onTap: () {
              Navigator.pushNamed(context, "/details", arguments: p);
            },
          );
        },
      ),
    );
  }
}
