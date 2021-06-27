import 'package:flutter/material.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:google_signin_example/setting.dart';
import 'package:provider/provider.dart';

class Menudrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //widget drawer
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            //bagian header pada drawer
            accountName: Text("Wiweka Premana"),
            accountEmail: Text("wiwekapremana@gmail.com"),
            currentAccountPicture: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/appimage/wiweka.jpeg"),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue[800]), // mewarnai background drawer
          ),
          ListTile(
            //widget untuk drawer di bagian list tilenya
            onTap: () {},
            title: Text("Profil"),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Setting();
              }));
            },
            title: Text("Pengaturan"),
            trailing: Icon(Icons.settings),
          ),
          ListTile(
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            title: Text("Keluar"),
            trailing: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
