import 'package:e_commerce_app/details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatefulWidget {

   const Products({ Key? key }) : super(key: key);
  
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // ignore: non_constant_identifier_names
  var product_list=[
    {
    "name": "Nike Air 200",
    "picture": "images/prd-8.jpg",
    "brand": "Nike",
    "price": "\$200",
    "old_price":"\$220",
  },
  {
    "name": "Puma Max 400",
    "picture": "images/prd-2.jpg",
    "brand": "Puma",
    "price": "\$500",
    "old_price":"\$550",
  },
  {
    "name": "Adidas Max 200",
    "picture": "images/prd-3.jpg",
    "brand": "Adidas",
    "price": "\$500",
    "old_price":"\$550",
  },
  {
    "name": "Bata Max 100",
    "picture": "images/prd-4.jpg",
    "brand": "Bata",
    "price": "\$400",
    "old_price":"\$450",
  },
  {
    "name": "Apex Max 8A0",
    "picture": "images/prd-6.jpg",
    "brand": "Apex",
    "price": "\$300",
    "old_price":"\$350",
  },
  {
    "name": "Step Max 4B0",
    "picture": "images/prd-5.jpg",
    "brand": "Step",
    "price": "\$200",
    "old_price":"\$250",
  },
  {
    "name": "Puma At4",
    "picture": "images/prd-7.jpg",
    "brand": "Puma",
    "price": "\$600",
    "old_price":"\$650",
  },
  {
    "name": "Nike Ha0",
    "picture": "images/prd-1.jpg",
    "brand": "nike",
    "price": "\$700",
    "old_price":"\$750",
  },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              child: GridView.builder(
                physics:const BouncingScrollPhysics(),
                itemCount: product_list.length,
                itemBuilder: (BuildContext context,int index){
                  return SingleProduct(
                    name: product_list[index]["name"],
                    picture: product_list[index]["picture"],
                    brand: product_list[index]["brand"],
                    price: product_list[index]["price"],
                    oldPrice: product_list[index]["old_price"],
                  );
                },
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  
                ), 
                ),
    );
  }
}

class SingleProduct extends StatelessWidget {

  final dynamic name;
  final dynamic picture;
  final dynamic brand;
  final dynamic oldPrice;
  final dynamic price;

  const SingleProduct({Key ? key,this.name,this.picture,this.brand,this.oldPrice,this.price}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(name: name,image: picture,brand: brand,price: price,)));
      },
      child: Container(
        margin:const EdgeInsets.all(5),
        decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                       image: AssetImage(picture),
                       fit: BoxFit.cover,
                  ),
        ),
        child: Container(
          padding:const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    name,
                    style:GoogleFonts.bebasNeue(fontSize: 20, color: Colors.black),
                  ),
    
                  Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child:const Center(
                  child: Icon(Icons.favorite_outline,color: Colors.black,size: 15,),
                ),
              ),
                  ],
                ),
              ),
              Text(
                    brand,
                    style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.white,),
                  ), 
                ]),
              ),
    
              //Footer
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                    oldPrice,
                    style:GoogleFonts.bebasNeue(fontSize: 15, color: Colors.redAccent,decoration: TextDecoration.lineThrough,),
                  ),
                  Text(
                    price,
                    style:GoogleFonts.bebasNeue(fontSize: 20, color: Colors.redAccent),
                  ), 
                ],),
              ),
            ],
          ),
        ),   
      ),
    );
  }
}