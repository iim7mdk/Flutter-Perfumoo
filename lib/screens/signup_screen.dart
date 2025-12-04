import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إنشاء حساب")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: email, decoration: InputDecoration(labelText: "الإيميل")),
            TextField(controller: pass, decoration: InputDecoration(labelText: "كلمة المرور"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("إنشاء حساب"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
