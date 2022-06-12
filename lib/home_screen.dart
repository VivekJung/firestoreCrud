import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/crud%20screens/view_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();
  final _powerController = TextEditingController();
  final CollectionReference heroes =
      FirebaseFirestore.instance.collection('superheroes');

  @override
  Widget build(BuildContext context) {
    addNewHero() {}
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade400,
        onPressed: () => addNewHero(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      appBar: AppBar(
        title: const Text("Firestore CRUD"),
      ),
      body: Container(
        color: Colors.deepOrangeAccent.shade700,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.all(24),
                child: const ViewScreen(),
              ),
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
