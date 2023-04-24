import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:printsecure/provider/google_sign_in.dart';
import 'package:printsecure/screens/homePageForVendor.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Print Secure',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const homePageVendor(),
        /*routes: {
          '/': (context) => const loginScreen(),
          '/o': (context) => const createAccountAs(),
          '/i': (context) => const homePageCustomer(),
          '/l': (context) => const homePageVendor(),
          '/e': (context) => const selectedImgPage(),
        },*/
      ),
    );
  }
}
