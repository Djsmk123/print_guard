// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:printsecure/screens/constant.dart';

class selectedImgPage extends StatefulWidget {
  const selectedImgPage({Key? key}) : super(key: key);

  @override
  State<selectedImgPage> createState() => _selectedImgPageState();
}

class _selectedImgPageState extends State<selectedImgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17))),
        backgroundColor: const Color.fromARGB(255, 96, 173, 235),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.menu),
        ),
        title: Text(
          appname,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 100),
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(24),
              //   topRight: Radius.circular(24),
              //   bottomLeft: Radius.circular(24),
              //   bottomRight: Radius.circular(24),
              // )
            ),
            child: const Center(
              child: Text(
                "Selected Image",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            onPressed: () {},
            child: const Text('Generate Link'),
          ),
        ],
      ),
    );
  }
}
