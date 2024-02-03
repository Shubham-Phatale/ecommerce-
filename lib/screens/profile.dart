import 'package:flutter/material.dart';
import 'package:complete_flutter_ecommerce/db/Database.dart';

class Profile extends StatefulWidget {
  final String email;
  Profile(this.email);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name, email;

  void getuser() async {
    var res = await DBProvider.db.getUser(widget.email);
    name = res[0]['name'];
    email = res[0]['email'];
    setState(() {});
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile page'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Name:',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(name,style: TextStyle(fontSize: 18.0),),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(email,style: TextStyle(fontSize: 18.0),),
                ],
              ))
        ],
      ),
    );
  }
}
