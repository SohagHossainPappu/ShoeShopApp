import 'package:e_commerce_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarterPage extends StatefulWidget {

  const StarterPage({ Key? key }) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/bg.jpg",),
              ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("BRAND NEW PERSPECTIVE",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                   ),
                   const SizedBox(height: 10,),
                   Text("Explore Your Best Suit",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                   ),
                   const SizedBox(height: 100,),
                   Center(
                     child: InkWell(
                       onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                       },
                       child: Container(
                         height: 60,
                         width: MediaQuery.of(context).size.width/1.5,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10),
                       ),
                         child: Center(
                           child: Text("Let's Start",
                                         style: GoogleFonts.bebasNeue(
                        fontSize: 25,
                        color: Colors.black,
                                         ),
                                        ),
                         ),
                       ),
                     ),
                   ),
         
                  const SizedBox(height: 20,),
        
                   Center(
                     child: Container(
                       height: 60,
                       width: MediaQuery.of(context).size.width/1.5,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(width: 2,color: Colors.white,),
                     ),
                       child: Center(
                         child: Text("Create Account",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                   ),
                       ),
                     ),
                   ),
        
                 const SizedBox(
                   height: 100,
                   ),  
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}