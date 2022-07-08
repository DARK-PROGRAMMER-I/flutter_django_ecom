import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/widgets/app_drawer.dart';
import 'package:flutter_django_ecom/widgets/single_product.dart';

import 'package:provider/provider.dart';

import '../state/product_state.dart';

class FavoriteScreen extends StatelessWidget {
  static final route_name = '/favorite-screen';

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fav_provider = Provider.of<ProductState>(context).favoriteProds;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Favourite products'),
      ),
      body: fav_provider.length == 0? Center(child: Text("No Favorites"),) :
      GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 ,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
            ),
               itemCount: fav_provider.length == null ? 0: fav_provider.length,
               itemBuilder: (context, index){
              return SingleProduct(
                  id: fav_provider[index].id,
                  title: fav_provider[index].title,
                  image: fav_provider[index].image,
                  favorite: fav_provider[index].favourite
              );
            }
      ),
    );
  }
}
