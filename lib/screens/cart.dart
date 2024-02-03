
import 'package:flutter/material.dart';
import 'package:complete_flutter_ecommerce/db/Database.dart';

class Cart extends StatefulWidget {
  final email;
  Cart(this.email);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<List> listview = [];
  MaterialColor col;
 // double sum = 0.0;

  void getproduct() async {
    var products = await DBProvider.db.fetchproduct(widget.email);
    for (var i in products) {
      List x = [];
      x.add(i['prod_name']);
      x.add(i['prod_price']);
      setcolor(i['prod_color']);
      x.add(col);
      x.add(i['prod_size']);
      x.add(i['prod_Img']);
      listview.add(x);
      //sum = sum + i["prod_price"];
      //print(sum);
    }
    setState(() {
      
    });
  }

  @override
  void initState() {
    getproduct();
    super.initState();
  }


  void setcolor(String color) {
    if (color == 'Red') {
      col = Colors.red;
    } else if (color == 'Green') {
      col = Colors.green;
    } else if(color == 'Orange'){
      col = Colors.orange;
    }
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(title: Text('Cart')),
        backgroundColor: Colors.black.withOpacity(0.25),
        body: Column(children: <Widget>[
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListView.builder(
                    itemCount: listview.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                            ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 8.0),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  listview[index][4],
                                  height: 80.0,
                                  width: 80.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(listview[index][0],style: TextStyle(fontSize: 20.0),),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(2),
                                                child: CircleAvatar(
                                                  backgroundColor: listview[index][2],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            listview[index][3],
                                            style: TextStyle(fontSize: 16.0),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text("\$"+listview[index][1].toString(),style: TextStyle(fontSize: 18.0)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
              ),
              // Row(children: <Widget>[
              //   Text('Total',style: TextStyle(color: Colors.white),),
              //   Text(sum.toString(),style: TextStyle(color: Colors.white),),
              // ],),
              Padding(
                      padding: const EdgeInsets.all(9),
                      child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {
                              
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Go to Pay",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )),
                    ),
        ]));
  }
}
