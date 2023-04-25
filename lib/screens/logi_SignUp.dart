import 'package:flutter/material.dart';
import 'package:printsecure/provider/google_sign_in.dart';
import 'package:printsecure/screens/constant.dart';
import 'package:printsecure/screens/homePageForCustomer.dart';
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
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/login/hacklogo1.png',
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              appname,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent
                  // color: const Color(#66BFBF),
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Your documents, Our cares',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
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
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    try {
                      final user = await provider.googleLogin();
                      if (user != null) {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    const homePageCustomer()));
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  icon: Image.asset('assets/login/Google logo.png'),
                  label: const Text(
                    'Google',
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
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            /* ElevatedButton.icon(
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
            ),*/

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
            ]),

            // Divider(
            //   color: Colors.blue,
            // )
          ],
        )),
      ),
      bottomNavigationBar: SizedBox(
        height: 210,
        child: Image.asset(
          'assets/login/bottomCurve.png',
        ),
      ),
    );
  }
}
