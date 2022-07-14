import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Nome'),
                onChanged: controller.mudarNome,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Sobrenome'),
                onChanged: controller.mudarSobrenome,
              ),
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                return Text('${controller.nomecompleto}');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
