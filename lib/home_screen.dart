import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore CRUD"),
      ),
      body: Container(
        color: Colors.deepOrangeAccent.shade700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            text('Let the CRUD begin', 16, Colors.white),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }

  Text text(String text, double fontSize, Color? txtColor) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: txtColor ?? Colors.white),
    );
  }
}
