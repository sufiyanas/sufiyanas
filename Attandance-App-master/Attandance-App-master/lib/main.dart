import 'package:attentance_book/db/model/data_model.dart';
import 'package:attentance_book/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModalAdapter().typeId)) {
    Hive.registerAdapter(StudentModalAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'attandance_app',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        backgroundColor: Color.fromARGB(96, 9, 196, 221),
      ),
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
