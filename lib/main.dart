import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_crud/firebase_options.dart';
import 'package:firestore_crud/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: customAppTheme(context),
      home: const HomeScreen(),
    );
  }

  ThemeData customAppTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(color: Colors.deepOrangeAccent.shade700),
      backgroundColor: Colors.red,
      iconTheme: const IconThemeData(size: 20.0, color: Colors.white),
      buttonTheme: ButtonTheme.of(context).copyWith(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
