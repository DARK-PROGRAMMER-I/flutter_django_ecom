import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/state/product_state.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = 'product-details';

  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as int;
    final singleProvider = Provider.of<ProductState>(context).singleProduct(id);
    return Scaffold(
      appBar: AppBar(

        title: Text('Product Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
    children: [
        Container(
          height: 300,
          // height: double.infinity,
          alignment: Alignment.center,
          child: Image.network('http://10.0.2.2:8000${singleProvider.image}',
            fit: BoxFit.cover,
            scale: 1,
            colorBlendMode: BlendMode.darken,
            // height: 200,
          ),
        ),
           SizedBox(height: 10,),
           Text(singleProvider.title.toString(), style: TextStyle(fontSize: 22,
               decoration: TextDecoration.underline,
               decorationStyle: TextDecorationStyle.wavy
           ),),

         Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [

              SizedBox(height: 10,),
              Text('Market Price : \$${singleProvider.marketPrice}' ,style: TextStyle(fontSize: 16,)),
              SizedBox(height: 10,),
              Text('Sellign Price : \$${singleProvider.sellingPrice}',style: TextStyle(fontSize: 16,)),
              SizedBox(height: 10,),

            ],
          ),
          ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to cart'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGreen)
            ),
          ),

        ],
      ),
           SizedBox(height: 10,),

           Text("${singleProvider.description}", style: TextStyle(fontSize: 15, color: Colors.grey),),


    ],
    )
    ));
  }
}
