import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/screens/product_detail_screen.dart';
import 'package:flutter_django_ecom/state/product_state.dart';
import 'package:provider/provider.dart';



class SingleProduct extends StatelessWidget {
  final int? id;
  final String? title;
  final String? image;
  final bool? favorite;
  SingleProduct({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
    required this.favorite
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, ProductDetails.routeName, arguments: id);
          },
          child: Image.network('http://10.0.2.2:8000${image}', fit: BoxFit.cover,)),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: Text('${id}', style: TextStyle(color: Colors.white), ),
        title: Text(title!, style: TextStyle(color: Colors.white),textAlign: TextAlign.center, ),
        trailing: IconButton(
            onPressed: (){
              Provider.of<ProductState>(context, listen: false).favouriteButton(id!);
            },

            icon: favorite! ? Icon(Icons.favorite, color: Colors.pinkAccent,)
          : Icon(Icons.favorite, color: Colors.white,)
          ,

        ),
      ),
    );
  }
}
