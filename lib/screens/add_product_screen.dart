import 'package:flutter/material.dart';
import '../data/fake_data.dart';
import '../models/perfume.dart';

class AddProductScreen extends StatelessWidget {
  var name = TextEditingController();
  var desc = TextEditingController();
  var price = TextEditingController();
  var img = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إضافة عطر")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: name, decoration: InputDecoration(labelText: "الاسم")),
            TextField(controller: desc, decoration: InputDecoration(labelText: "الوصف")),
            TextField(controller: price, decoration: InputDecoration(labelText: "السعر")),
            TextField(controller: img, decoration: InputDecoration(labelText: "رابط الصورة")),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("إضافة"),
              onPressed: () {
                perfumes.add(Perfume(
                  name: name.text,
                  description: desc.text,
                  price: double.parse(price.text),
                  image: img.text,
                ));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
