import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("متجر العطور")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("عرض العطور"),
              onPressed: () {
                Navigator.pushNamed(context, "/products");
              },
            ),
            ElevatedButton(
              child: Text("إضافة عطر"),
              onPressed: () {
                Navigator.pushNamed(context, "/add");
              },
            ),
          ],
        ),
      ),
    );
  }
}
