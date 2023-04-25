// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:printsecure/screens/constant.dart';
import 'package:printsecure/screens/view_share_documents.dart';
import 'package:printsecure/widgets/drawer.dart';

class homePageCustomer extends StatefulWidget {
  const homePageCustomer({Key? key}) : super(key: key);

  @override
  State<homePageCustomer> createState() => _homePageCustomerState();
}

class _homePageCustomerState extends State<homePageCustomer> {
  List<FileModel> files = [];
  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      for (var i in documents) {
        files.add(FileModel.fromJson(i));
      }
    }
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
            onPressed: () async {
              try {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
                if (barcodeScanRes.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ViewShareDocuments(
                              file: files.firstWhere((element) =>
                                  element.id.toString() == barcodeScanRes),
                              isShared: true,
                              duration: const Duration(seconds: 15))));
                }
              } catch (e) {
                print('f');
              }
            },
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    value: 0.2,
                    color: Colors.grey,
                    minHeight: 10,
                    valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("${((20 / 1024)).toStringAsFixed(2)} % Storage Available")
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )),
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/login/Filemanager.png',
                      // alignment: Alignment.centerLeft,
                    ),
                    const Text("File Manager"),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/login/gdrive 1.png',
                      //alignment: Alignment.center,
                    ),
                    const Text("Google Drive"),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/login/gallary.png',
                      //alignment: Alignment.centerRight,
                    ),
                    const Text("Gallery"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 5),
              child: Text(
                "Uploaded Documents",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )),
            child: GridView.builder(
              itemCount: files.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (c, index) {
                final FileModel file = files[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ViewShareDocuments(
                                file: file,
                                isShared: false,
                                duration: const Duration(seconds: 15))));
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: NetworkImage(file.url))),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 130,
          ),
        ]),
      ),
      drawer: const MyDrawer(),
    );
  }
}
