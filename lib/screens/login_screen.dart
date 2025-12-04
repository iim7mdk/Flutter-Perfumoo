import 'package:flutter/material.dart';
import '../services/pref_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل دخول")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              textAlign: TextAlign.right,
              controller: email,
              decoration: InputDecoration(labelText: "الإيميل"),
            ),

            TextField(
              textAlign: TextAlign.right,
              controller: pass,
              decoration: InputDecoration(labelText: "كلمة المرور"),
              obscureText: true,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("تسجيل الدخول"),
              onPressed: () async {
                await PrefService.saveUser(email.text);
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(
              child: Text("الدخول كزائر"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade700),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),

            SizedBox(height: 10),

            TextButton(
              child: Text("إنشاء حساب جديد"),
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
            ),
          ],
        ),
      ),
    );
  }
}
