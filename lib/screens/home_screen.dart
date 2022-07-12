import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/screens/login_screen.dart';
import 'package:flutter_django_ecom/state/product_state.dart';
import 'package:flutter_django_ecom/widgets/app_drawer.dart';
import 'package:flutter_django_ecom/widgets/single_product.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _init = true;
  bool isLoading = false;
  @override
  void didChangeDependencies()async {
    if(_init){
      isLoading = await Provider.of<ProductState>(context).getProducts();
      setState(() {
      });
    }
    _init = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage('token');
    final products = Provider.of<ProductState>(context).products;
    // print(products[0].favourite);
    return !isLoading?Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: ()async{
            await storage.clear();
            Navigator.pushReplacementNamed(context, LoginScreen.route_name);
            },
              icon: Icon(Icons.logout_sharp)
          )
        ],
      ),
      body:products.length == null || products.length == 0 ?
      Scaffold(body: Center(child: CircularProgressIndicator()))
          :  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            itemCount: products.length == null ? 0: products.length,
            itemBuilder: (context, index){
              return SingleProduct(
                  id: products[index].id,
                  title: products[index].title,
                  image: products[index].image,
                  favorite: products[index].favourite,
              );
            },
        ),
      )
    );
  }

}
