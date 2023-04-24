import 'package:flutter/material.dart';
import 'package:printsecure/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 45),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/login/hacklogo1.png'),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Print Secure',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                // color: const Color(#66BFBF),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'privacy matters',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: Color.fromARGB(255, 7, 78, 137),
                      height: 36,
                    )),
              ),
              const Text(
                "Log in or Sign up With",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: const Divider(
                      color: Color.fromARGB(255, 7, 78, 137),
                      height: 36,
                    )),
              ),
            ]),
            ElevatedButton.icon(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              icon: Image.asset('assets/login/Google logo.png'),
              label: const Text(
                'Google     ',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                backgroundColor: Colors.white,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset('assets/login/facebook.png'),
              label: const Text(
                'Facebook',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                backgroundColor: Colors.white,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset('assets/login/apple.png'),
              label: const Text(
                'Apple         ',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                backgroundColor: Colors.white,
              ),
            ),

            //login buttons

            Row(children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      // thickness: 1.0,
                      color: Color.fromARGB(255, 7, 78, 137),
                      height: 36,
                    )),
              ),
              const Text(
                "Copyright @ 2022",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: const Divider(
                      color: Color.fromARGB(255, 7, 78, 137),
                      height: 36,
                    )),
              ),
            ]),

            Image.asset(
              'assets/login/bottomCurve.png',
            ),
            // Divider(
            //   color: Colors.blue,
            // )
          ],
        )),
      ),
    );
  }
}
