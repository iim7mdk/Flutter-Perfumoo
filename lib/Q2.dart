import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Q2 extends StatefulWidget {
  @override
  _Q2State createState() => _Q2State();
}

class _Q2State extends State<Q2> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedValueOnStart();
  }

  Future<void> _loadSavedValueOnStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? saved = prefs.getString('myText');
    if (saved != null) {
      setState(() {
        controller2.text = saved;
      });
    }
  }

  Future<void> _saveValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myText', value);
  }

  Future<void> _loadValueToTextField2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? saved = prefs.getString('myText');
    setState(() {
      controller2.text = saved ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("SharedPrefrences")),




      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(


          children: [
            TextField(
              controller: controller1,
              decoration: InputDecoration(labelText: "الحقل الاول"),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _saveValue(controller1.text);
                  },
                  child: Text("تخزن"),
                ),

                
              ],
            ),

            SizedBox(height: 20),

            TextField(
              controller: controller2,
              decoration: InputDecoration(labelText: "الحقل الثاني"),
              readOnly: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                ElevatedButton(
                  onPressed: () async {
                    await _loadValueToTextField2();
                  },
                  child: Text("جلب"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
