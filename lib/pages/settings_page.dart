import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFFF9A826),
      ),
      // backgroundColor: Color(0xFFF9A826),
      // body: Column(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(
      //         color: Color(0xFFF9A826),
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
      //       padding: const EdgeInsets.all(25),
      //       child: Row(
      //         children: [
      //           Text(
      //             "dark mode",
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Color(0xFFF9A826),
      //             ),
      //           ),
            
      //           CupertinoSwitch(
      //             value: false,
      //             onChanged: (value) {},
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
