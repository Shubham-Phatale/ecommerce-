import 'package:flutter/material.dart';
import 'package:complete_flutter_ecommerce/db/data.dart';
import 'featured_card.dart';

class FeaturedProducts extends StatefulWidget {
  final email;
  FeaturedProducts(this.email);

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (_, index) {
              var data = AppData.productList;
              return FeaturedCard(
                name: data[index].name,
                price: data[index].price,
                picture: data[index].picture,
                email: widget.email,
              );
            }));
  }
}
