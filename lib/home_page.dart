// ignore: import_of_legacy_library_into_null_safe

import 'package:carousel_pro/carousel_pro.dart';
import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/drawer.dart';
import 'package:e_commerce_app/products_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,

        //Drawer
        drawer: Drawer(child: DrawerPage(key: widget.key,)),
        backgroundColor: Colors.white,

        //AppBar
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: const Center(
                  child: FaIcon(
                FontAwesomeIcons.barsStaggered,
                color: Colors.redAccent,
                size: 30,
              ))),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            "BEST FEET",
            style: GoogleFonts.bebasNeue(
              color: Colors.black,
              fontSize: 30,
            ),
          )),
          actions: [
            Center(
              child: Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: InkWell(
                  onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
                  },
                  child: const Icon(Icons.shopping_cart,color: Colors.black,size: 30,),
                ),
              ),
            ),
          ],
        ),

        //Body
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              //Search Bar
              Row(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TextField(
                      textCapitalization: TextCapitalization.characters,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.redAccent,
                        ),
                        hintText: "Search",
                        hintStyle: GoogleFonts.bebasNeue(
                          color: Colors.redAccent,
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                  ),

                  //filter Icon
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 4.5,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.sort,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Text(
                  "Our Feature Products",
                  style:
                      GoogleFonts.bebasNeue(fontSize: 30, color: Colors.black),
                ),
              ),
              //Carousel
              carousel,

              //item list
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  "Categories",
                  style:
                      GoogleFonts.bebasNeue(fontSize: 25, color: Colors.black),
                ),
              ),

              SizedBox(
                height: 40,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    listItem("Shoes"),
                    listItem("Snickers"),
                    listItem("Slipers"),
                    listItem("Sandal"),
                    listItem("Bootsa"),
                    listItem("Athletic Shoes"),
                    listItem("High Heels"),
                    listItem("Loafers"),
                  ],
                ),
              ),

              
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Text(
                  "Recent Products",
                  style:
                      GoogleFonts.bebasNeue(fontSize: 25, color: Colors.black),
                ),
              ),
              
              // Products Card
              Container(
                height: 500,
                margin:const EdgeInsets.symmetric(horizontal: 10),
                child: Products(
                  key: widget.key,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget carousel = SizedBox(
    height: 200,
    child: Carousel(
      autoplay: false,
      boxFit: BoxFit.cover,
      animationDuration: const Duration(milliseconds: 1000),
      animationCurve: Curves.fastOutSlowIn,
      images: const [
        AssetImage("images/img-1.jpg"),
        AssetImage("images/img-2.jpg"),
        AssetImage("images/img-3.jpg"),
        AssetImage("images/img-4.jpg"),
      ],
    ),
  );
  Widget listItem(name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
          child: Text(
        name,
        style: GoogleFonts.bebasNeue(
          fontSize: 15,
        ),
      )),
    );
  }
}
