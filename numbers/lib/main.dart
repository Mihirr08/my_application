import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numbers/base/clickable_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List list = [];
  List selectedList = [];

  @override
  void initState() {
    var rnd = Random();
    for (int i = 0; i < 9; i++) {
      list.add(rnd.nextInt(10));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Main.dart build called list of numbers $list  list of selected numbers $selectedList');

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: const Center(
                child: Text('Refresh'),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return cardFunction(
                      index: index,
                      child: Text(
                        '${list[index]}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardFunction({required Widget child, required int index}) {
    return ClickAbleCard(
      child: Center(
        child: child,
      ),
      changeColor: Colors.green,
      initialColor: Colors.yellow,
      onTap: () {
        setState(() {
          selectedList = list[index];
          print('List of selected index $selectedList');
        });
      },
    );
  }
}
