import 'package:e_commerce_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  
  const CartPage({Key ? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  var cartList=[
    {
    "name": "Nike Air 200",
    "picture": "images/prd-5.jpg",
    "price": "\$200",
    "color": "Red",
    "size": "42",
    "quantity": "1 pair",
  },
  {
    "name": "Puma Max 400",
    "picture": "images/prd-2.jpg",
    "price": "\$500",
    "color": "Blue",
    "size": "44",
    "quantity": "2 pair",
  },
  {
    "name": "Adidas Max 200",
    "picture": "images/prd-3.jpg", 
    "price": "\$500",
    "color": "White",
    "size": "40",
    "quantity": "3 pair",
  },
  {
    "name": "Puma Max 400",
    "picture": "images/prd-2.jpg",
    "price": "\$500",
    "color": "Blue",
    "size": "44",
    "quantity": "4 pair",
  },
  {
    "name": "Puma Max 400",
    "picture": "images/prd-2.jpg",
    "price": "\$500",
    "color": "Blue",
    "size": "44",
    "quantity": "5 pair",
  },
  ];
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
                  "My Cart",
                  style:GoogleFonts.bebasNeue(fontSize: 30, color: Colors.black),
                ),
              ),
            ),

            //page body
            body: Column(
              children: [


                //Selected items
                SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics:const BouncingScrollPhysics(),
                            itemCount: cartList.length,
                            itemBuilder:(context, index){
           return SingleCartItem(
                        name: cartList[index]["name"],
                        image: cartList[index]["picture"],
                        price: cartList[index]["price"],
                        color: cartList[index]["color"],
                        size: cartList[index]["size"],
                        quantity: cartList[index]["quantity"],

          );
        }
      ),
                  ),
                ),


                //Bottom part
              
              Flexible(
                child: Container(
                  padding:const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                   border: Border.all(color: Colors.redAccent,width: 5),
                   borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width/4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  ),
              ), 

              const SizedBox(height: 20,),

                      //all counters
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///item counter
                             SizedBox(
                              child: Row(
                                children:const [
                                   Text("Items",style: TextStyle(color: Colors.black),),
                                   SizedBox(width: 5,),
                                   Text("4",style: TextStyle(color: Colors.redAccent),),
                                ],
                              ),
                            ),
                            
                            //price counter
                             SizedBox(
                              child: Row(
                                children: [
                                  
                            Text(
                              "Total Amount",
                               style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.black),
                              ),
                            const SizedBox(width: 10,),
                            Text(
                              "\$2040.00",
                               style:GoogleFonts.bebasNeue(fontSize: 20, color: Colors.redAccent),
                              ),
                                ],
                              ),
                             ),
                          ],
                        ),
                      ),

              //Buy Now Button

              Center(
                child: Padding(
                  padding:const EdgeInsets.all(50),
                  child: Container(
                    height: 50,
                    width: 200,
                    padding:const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black,width: 1,)
                    ),
                    child: Center(
                      child: Text(
                                "Buy now",
                                 style:GoogleFonts.bebasNeue(fontSize: 25, color: Colors.redAccent),
                                ),
                    ),
                  ),
                ),
              ),

                    ],
                  ),
                  )
                ),
                
              ],
            ),
    );
  }
}

//listTile Items

class SingleCartItem extends StatelessWidget {
  final dynamic name;
  final dynamic image;
  final dynamic price;
  final dynamic color;
  final dynamic size;
  final dynamic quantity;

  const SingleCartItem({Key?key,this.name,this.image,this.price,this.color,this.size,this.quantity}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
          shape: RoundedRectangleBorder(
                  side:const BorderSide(color: Colors.redAccent, width: 1),
                  borderRadius: BorderRadius.circular(5),
            ), 

          title: Text(
                  name,
                  style:GoogleFonts.bebasNeue(fontSize: 20, color: Colors.black),
                ),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover,)
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                  price,
                  style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.redAccent),
                ),
                Text(
                  quantity,
                  style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.black),
                ),
                Column(
                  children: [
                    Text(
                  color,
                  style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.cyan),
                ),
                Text(
                  size,
                  style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.black),
                ),
                  ],
                ),
            ],
          ),
          trailing: Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 1,),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                    "remove",
                    style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.redAccent),
                  ),
            ),
          ),
      ),
    );
  }
}