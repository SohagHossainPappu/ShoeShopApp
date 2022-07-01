import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {

  final dynamic image;
  final dynamic price;
  final dynamic brand;
  final dynamic name;
  const DetailsPage({Key?key,this.name,this.image,this.price,this.brand}):super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

 final colors=["RED","BLUE","YELLOW","GRAY"];
 final size=["38","39","40","41","42"];
 final quantity=["1 Pair","2 Pair","3 Pair","4 Pair","5 Pair"];
 String? value;
 String? value2;
 String? value3;

//dropdown button1 item
 DropdownMenuItem<String>buildMenu(String colors)=>DropdownMenuItem(
  value: colors,
  child: Text(colors,style:const TextStyle(color: Colors.cyan,fontSize: 10),),
  );

//dropdown button3 item
 DropdownMenuItem<String>buildMenu2(String size)=>DropdownMenuItem(
  value: size,
  child: Text(size,style:const TextStyle(color: Colors.cyan,fontSize: 10),),
  );

//dropdown button3 item
 DropdownMenuItem<String>buildMenu3(String quantity)=>DropdownMenuItem(
  value: quantity,
  child: Text(quantity,style:const TextStyle(color: Colors.cyan,fontSize: 10),),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //appbar 
      appBar: AppBar(
              backgroundColor: Colors.white,
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child:const Icon(Icons.arrow_back,color: Colors.redAccent,)
                ),
              actions: [
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                    },
                    child:const Icon(Icons.home,color: Colors.redAccent,size: 30,),
                    ),
                ),
              ],
              elevation: 0,
              title: Center(
                child: Text(
                  "Best Feet",
                  style:GoogleFonts.bebasNeue(fontSize: 30, color: Colors.black),
                ),
              ),
            ),

            //body part

            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  //product picture
                  SizedBox(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.image),
                    ),
                  ),
            
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 20,),
                    color: Colors.redAccent,
                  ),
            
            
                //product name and price
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                                widget.name,
                                 style:GoogleFonts.bebasNeue(fontSize: 25, color: Colors.black),
                                ),
                        Text(
                                widget.brand,
                                 style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.cyan),
                                ),
                        Text(
                                widget.price,
                                 style:GoogleFonts.bebasNeue(fontSize: 25, color: Colors.redAccent),
                                ),
                      ],
                    ),
                  ),
            
                // Size Color and quantity
            
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
            
                      //dropdown button1
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width/4,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent,width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 0,
                              isExpanded: true,
                              iconEnabledColor: Colors.redAccent,
                              iconSize: 25,
                              hint:const Text("COLORS",style: TextStyle(color: Colors.black,fontSize: 10),),
                              value: value,
                              items: colors.map(buildMenu).toList(), 
                              onChanged: (value)=>setState(()=>
                                this.value= value as String
                               )
                            ),
                          ),
                        ),
                        
                        //dropdown button2
                        Container(
                          height: 40,
                          width: 110,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent,width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 0,
                              isExpanded: true,
                              iconEnabledColor: Colors.redAccent,
                              iconSize: 25,
                              hint:const Text("SIZE",style: TextStyle(color: Colors.black,fontSize: 10),),
                              value: value2,
                              items: size.map(buildMenu2).toList(), 
                              onChanged: (value2)=>setState(()=>
                                this.value2= value2 as String
                               )
                            ),
                          ),
                        ),
            
                         //dropdown button2
                        Container(
                          height: 40,
                          width: 110,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent,width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 0,
                              isExpanded: true,
                              iconEnabledColor: Colors.redAccent,
                              iconSize: 25,
                              hint:const Text("QUANTITY",style: TextStyle(color: Colors.black,fontSize: 10),),
                              value: value3,
                              items: quantity.map(buildMenu3).toList(), 
                              onChanged: (value3)=>setState(()=>
                                this.value3= value3 as String
                               )
                            ),
                          ),
                        ),
            
            
                    ],
                  ),
                  ),
            
                  //Buy cart buttons
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                         Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width/2,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                                       "BUy now",
                                   style:GoogleFonts.bebasNeue(fontSize: 20, color: Colors.white),
                  ),
                          ),
                         ),
                        //cart button
            
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black,width: 1)
                            ),
                            child:const Center(
                              child: Icon(Icons.shopping_cart,color: Colors.redAccent,size: 30,),
                            ),
                           ),
                        )
                    ],
                  ),
                ),
            
                //Description 
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                           "product details",
                          style:GoogleFonts.bebasNeue(fontSize: 25, color: Colors.black),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "The right pair of shoes can add a lot of points to your overall appearance.Gladiator through the summer season in style.These open toe gladiator sandals shoes will make you look becoming and give you a sense of pride and satisfaction, and will give you a sense of comfort and relief.When it comes to summer shoes, a pair of well-made sandals will stay in your collection for years to come.",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        ),
                    ],
                  ),
                  ),
                ],
              ),
            ),


    );
  }
}