import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}

class Q3 extends StatefulWidget {
  const Q3({super.key, required this.title});


  final String title;

  @override
  State<Q3> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Q3> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,



          children: <Widget>[
            ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: Text('Item1'),
                    subtitle: Text('test test testtest 1111'),
                    onTap: () {

                    },
                  ),ListTile(
                    leading: const Icon(Icons.star),
                    title: Text('Item2'),
                    subtitle: Text('test test testtest 222'),
                    onTap: () {

                    },
                  ),ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text('Item3'),
                    subtitle: Text('test test testtest 3333'),
                    onTap: () {

                    },
                  ),
                ],


            )

          ],
        ),
      ),

    );
  }
}



















































//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class TwoTextFieldsPage extends StatefulWidget {
//   @override
//   _TwoTextFieldsPageState createState() => _TwoTextFieldsPageState();
// }
//
// class _TwoTextFieldsPageState extends State<TwoTextFieldsPage> {
//   TextEditingController controller1 = TextEditingController();
//   TextEditingController controller2 = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedValue();
//   }
//
//   // قراءة القيمة من SharedPreferences
//   Future<void> _loadSavedValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? saved = prefs.getString('myText');
//     controller2.text = saved ?? ""; // عرضها في TextField الثاني
//   }
//
//   // تخزين القيمة
//   Future<void> _saveValue(String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('myText', value);
//     _loadSavedValue(); // تحديث TextField الثاني مباشرة
//   }
