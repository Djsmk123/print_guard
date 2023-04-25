import 'package:flutter/material.dart';
import 'package:printsecure/screens/constant.dart';
import 'package:printsecure/widgets/drawer_vendor.dart';

class homePageVendor extends StatefulWidget {
  const homePageVendor({Key? key}) : super(key: key);

  @override
  State<homePageVendor> createState() => _homePageVendorState();
}

class _homePageVendorState extends State<homePageVendor> {
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
      // body: Expanded(
      //     child: ListView.builder(
      //         itemCount: itemsData.length,
      //         physics: BouncingScrollPhysics(),
      //         itemBuilder: (context, index) {
      //           return itemsData[index];
      //         })
      //         ),

      drawer: const MyDrawer_vendor(),
    );
  }
}
