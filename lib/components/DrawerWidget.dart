import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pcnc/controller/LogInController.dart';

class DrawerWidget extends StatelessWidget {
  final Logincontroller logincontroller = Get.put(Logincontroller());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffF2673A),
            ),
            child: Text(
              'PCNC',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
            ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              logincontroller.logout();
              Get.offAllNamed("/Home");
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              logincontroller.logout();
              Get.offAllNamed("/LogIn");
            },
          ),
        ],
      ),
    );
  }
}
