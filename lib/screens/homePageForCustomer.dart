import 'package:flutter/material.dart';
import 'package:printsecure/widgets/drawer.dart';

class homePageCustomer extends StatefulWidget {
  const homePageCustomer({Key? key}) : super(key: key);

  @override
  State<homePageCustomer> createState() => _homePageCustomerState();
}

class _homePageCustomerState extends State<homePageCustomer> {
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
        title: const Text(
          "Print\n Secure",
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
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
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
          Container(
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
            height: 355,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )),
            child: GridView.count(
              crossAxisCount: 4,
              children: List<Widget>.generate(16, (index) {
                return GridTile(
                  child: Card(
                      color: const Color.fromARGB(255, 193, 191, 191),
                      child: Center(
                        child: Text('Image $index'),
                      )),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          Row(
            children: const [
              Text(
                "                                        secured by ",
                textAlign: TextAlign.center,
              ),
              Text(
                "Print Secure",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
            ],
          )
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
