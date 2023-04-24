// ignore_for_file: file_names

import 'package:flutter/material.dart';

class createAccountAs extends StatefulWidget {
  const createAccountAs({Key? key}) : super(key: key);

  @override
  State<createAccountAs> createState() => _createAccountAsState();
}

class _createAccountAsState extends State<createAccountAs> {
  int _value = 1;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 45),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/login/hacklogo1.png'),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Welcome $name,',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                // color: const Color(#66BFBF),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You have successfully logged in..',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Create Account as?',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),

            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Customer',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const SizedBox(
                  width: 30,
                ),
                Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Vendor',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Color.fromARGB(255, 20, 77, 22),
                  ),
                  label: const Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 20, 77, 22), width: 5),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            Image.asset('assets/login/bottomCurve.png'),

            // Divider(
            //   color: Colors.blue,
            // )
          ],
        )),
      ),
    );
  }
}
