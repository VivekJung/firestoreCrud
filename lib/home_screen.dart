import 'package:flutter/material.dart';

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
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            text('Let the CRUD begin', 16, Colors.white),
            Container(),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
            ),
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
