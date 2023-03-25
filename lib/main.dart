import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tremglobal/firebase_options.dart';
import 'package:tremglobal/projectpages/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trem Global Sales Department Reports',
      theme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
