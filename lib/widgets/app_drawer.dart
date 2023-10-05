import 'package:flutter/material.dart';
import 'package:online_store/drawer_actions/about_developers.dart';
import 'package:online_store/drawer_actions/conect_us.dart';
import 'package:online_store/drawer_actions/support_app.dart';
import 'package:online_store/state_managment/provider.dart';
import 'package:online_store/widgets/colors.dart';
import 'package:online_store/widgets/default_txt.dart';
import 'package:online_store/widgets/list_tile.dart';
import 'package:provider/provider.dart';
Widget AppDrawer({required context}) => Drawer(
      elevation: 0,
      width: MediaQuery.of(context).size.width * 0.8,
      backgroundColor: white.withOpacity(0.9),
      child: Column(
        children: [
          const Spacer(),
          defText(
              txt: "ONLINE STORE",
              fontSize: 24,
              txtAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
              txtColor: Colors.pink),
          const Spacer(),
          defListTile(
              onTap: () {
                final provider = Provider.of<StoreStates>(context);
             provider.changeMode();
              },
              title: "Dark Mode",
              iconData: Icons.dark_mode_outlined,
          ),
          defListTile(
              onTap: () {
                openWhatsChat();
              },
              title: "Connect Us Via Linked In",
              iconData: Icons.mail),
          defListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>const SupportApp()));
              }, title: "Support App", iconData: Icons.support),
          defListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const AboutDevelopers()));
              },
              title: "About Developers",
              iconData: Icons.computer),
          const Spacer(),
        ],
      ),
    );

