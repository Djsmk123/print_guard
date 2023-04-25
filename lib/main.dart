import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:printsecure/provider/google_sign_in.dart';
import 'package:printsecure/screens/constant.dart';
import 'package:printsecure/screens/logi_SignUp.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appname,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const loginScreen(),
      ),
      /* routes: {
          '/': (context) => const loginScreen(),
          '/o': (context) => const createAccountAs(),
          '/i': (context) => const homePageCustomer(),
          '/l': (context) => const homePageVendor(),
          '/e': (context) => const selectedImgPage(),
          //'/v': (context) => const ViewShareDocuments()
        },*/
    );
  }
}
