import 'package:flutter/material.dart';

class MyDrawer_vendor extends StatelessWidget {
  const MyDrawer_vendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final imageUrl = "https://avatarfiles.alphacoders.com/321/32154.gif";
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   padding: EdgeInsets.zero,
          //   child: UserAccountsDrawerHeader(
          //     margin: EdgeInsets.zero,
          //     decoration:
          //         BoxDecoration(color: Color.fromARGB(255, 73, 165, 76)),
          //     accountName: Text("Kushagra Goel"),
          //     accountEmail: Text("Kushagra.goel@gmail.com"),
          //     currentAccountPicture: CircleAvatar(
          //       backgroundImage: NetworkImage(imageUrl),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          const Positioned(
            height: 100,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 217, 217, 215),
              maxRadius: 80,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            height: 432,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )),
            child: Column(
              children: [
                const Text(
                  "Username",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(child: Image.asset("assets/login/barcode.png")),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Want to create QR code, create account as vendor",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Image.asset("assets/login/Rectangle 83.png"),
                Image.asset("assets/login/Rectangle 82.png"),
              ],
            ),
          ),
          // SizedBox(
          //   height: 0,
          // ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Center(
                child: ElevatedButton.icon(
                  // child: Text(
                  //   'Change Password',
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.lightBlue),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  label: const Text(
                    'Share QR',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Center(
                child: ElevatedButton.icon(
                  // child: Text(
                  //   'Change Password',
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.lightBlue),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),

          Row(
            children: const [
              Text(
                "                          secured by ",
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
    );
  }
}
