import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          margin:const EdgeInsets.all(5),
          accountName: Text("Sohag Hossain",style: GoogleFonts.bebasNeue(fontSize: 25,),),
          accountEmail:const Text("sohaghossainpappu@gmail.com"),
          decoration:const BoxDecoration(color: Colors.redAccent),
          currentAccountPicture:const CircleAvatar(
          backgroundImage: AssetImage("images/img.jpg"),
          ),
        ),
        
        const SizedBox(height: 20,),
        const Divider(
          height: 2,
          color: Colors.redAccent,
        ),

        listItems(
          text: "My Account",
          icons: Icons.person,
        ),
        listItems(
          text: "My Cart",
          icons: Icons.shopping_cart,
        ),
        listItems(
          text: "Favourites",
          icons: Icons.favorite,
        ),
        listItems(
          text: "Settings",
          icons: Icons.settings,
        ),
        listItems(
          text: "about",
          icons: Icons.help,
        ),
      ],
    );
  }

  Widget listItems({icons,text}){
    return ListTile(
          leading: Icon(icons,color: Colors.redAccent,),
          title: Text(text,style: GoogleFonts.bebasNeue(fontSize: 20,),),
        );
  }
}
