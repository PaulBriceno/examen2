import 'package:examen_paul_briceno/routes/app_routes.dart';
import 'package:examen_paul_briceno/screens/home_page.dart';
import 'package:examen_paul_briceno/screens/m_productos_screen.dart';
import 'package:examen_paul_briceno/screens/screens.dart';
import 'package:examen_paul_briceno/screens/signup_screen.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:examen_paul_briceno/screens/prueba.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      getPages: pages,
      home: SignupScreen(),
    );
  }
}
