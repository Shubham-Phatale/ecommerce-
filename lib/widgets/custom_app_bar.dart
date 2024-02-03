import 'package:complete_flutter_ecommerce/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:complete_flutter_ecommerce/screens/profile.dart';

class CustomAppBar extends StatelessWidget {

 final String email;
  CustomAppBar(this.email);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'What are\nyou Shopping for?',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w400),
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: Align(
            alignment: Alignment.topRight, 
            child: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: (){
                print('vivek');
                Scaffold.of(context).openEndDrawer();
              },
          )),
        ),
        Positioned(
          top: 10,
          right: 60,
          child: Align(
              alignment: Alignment.topRight,
              child: new IconButton(
                icon: new Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(email)));  
                },
              )),
        ),
        Positioned(
          top: 10,
          right: 100,
          child: Align(
              alignment: Alignment.topRight,
              child: new IconButton(
                icon: new Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile(email)));
                },
              )),
        ),
        
      ],
    );
  }
}
