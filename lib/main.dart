import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0.obs;
  final _list = <String>[].obs;

  final _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void _addToListDialog() {
    var controller = TextEditingController();
    Get.defaultDialog(
        title: "Welcome to Flutter Dev'S",
        middleText:
            "FlutterDevs is a protruding flutter app development company with "
            "an extensive in-house team of 30+ seasoned professionals who know "
            "exactly what you need to strengthen your business across various dimensions",
        backgroundColor: Colors.teal,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 30);
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  '${_counter.value}',
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )),
            SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.add),
              ),
            ),
            const Text(
              'You have added these items to the list:',
            ),
            Obx(() => Container(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    _returnList(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                onSubmitted: (value) {
                  _list.add(value);
                  _controller.clear();
                },
                controller: _controller,
              ),
            )
          ],
        ),
      ),
    );
  }

  String _returnList() {
    String result = '';
    _list.forEach((element) {
      result += element;
    });
    return _list.toString();
  }
}
