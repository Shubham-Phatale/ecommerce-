import 'package:complete_flutter_ecommerce/widgets/custom_app_bar.dart';
import 'package:complete_flutter_ecommerce/widgets/featured_products.dart';
import 'package:complete_flutter_ecommerce/widgets/product_card.dart';
import 'package:complete_flutter_ecommerce/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:complete_flutter_ecommerce/db/data.dart';
import 'package:complete_flutter_ecommerce/widgets/featured_card.dart';
import 'package:complete_flutter_ecommerce/db/Database.dart';
import 'package:complete_flutter_ecommerce/screens/cart.dart';

class HomePage extends StatefulWidget {
  final String email;
  HomePage(this.email);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;

  void getusername() async{
    var resp = await DBProvider.db.getUser(widget.email);
    name = "";
    setState(() {
      
    });
  }

  @override
  void initState() {
    getusername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          children: <Widget>[
            Container(
              height: 55.0,
              child: DrawerHeader(
                child: Container(
                  child: Text(
                    'Hi..' ,
                    style: TextStyle(fontSize: 20.0,color: Colors.white),
                    )
                    ),
                    decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text('Home',style: TextStyle(fontSize: 18.0),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Cart',style: TextStyle(fontSize: 18.0),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(widget.email)));
              },
            ),
            ListTile(
              title: Text('Logout',style: TextStyle(fontSize: 18.0),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//           Custom App bar
            CustomAppBar(widget.email),

//          Search Text field
            Search(),

//            featured products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Featured products')),
                ),
              ],
            ),
            FeaturedProducts(widget.email),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text('Most Buyable products'),
            ),
            Container(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      var data = AppData.recentList;
                      return FeaturedCard(
                        name: data[index].name,
                        price: data[index].price,
                        picture: data[index].picture,
                        email: widget.email,
                      );
                    })),

//          recent products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Recent products')),
                ),
              ],
            ),
            ProductCard(
              brand: 'SantosBrand',
              name: 'Lux Blazer',
              price: 24.00,
              onSale: true,
              picture: '',
            ),
            ProductCard(
              brand: 'SantosBrand',
              name: 'Lux Blazer',
              price: 24.00,
              onSale: true,
              picture: '',
            ),
            ProductCard(
              brand: 'SantosBrand',
              name: 'Lux Blazer',
              price: 24.00,
              onSale: true,
              picture: '',
            ),
          ],
        ),
      ),
    );
  }
}
