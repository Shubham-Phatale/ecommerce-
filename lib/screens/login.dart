import 'package:complete_flutter_ecommerce/screens/home.dart';
import 'package:complete_flutter_ecommerce/screens/signup.dart';
import 'package:complete_flutter_ecommerce/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:complete_flutter_ecommerce/db/Database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: /*user.status == Status.Authenticating ? Loading() : */ Stack(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350],
                      blurRadius:
                          20.0, // has the effect of softening the shadow
                    )
                  ],
                ),
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              alignment: Alignment.topCenter,
                              child: SvgPicture.asset(
                                'images/login.svg',
                                width: 260.0,
                              )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                obscureText: true,
                                controller: _password,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage(_email.text)));
                                  // if (_formKey.currentState.validate()) {
                                  //   //if(!await user.signIn(_email.text, _password.text))
                                  //   var res = await DBProvider.db
                                  //       .getUser(_email.text);
                                  //   if (res.length != 0) {
                                  //     if (res[0]['password'] ==
                                  //         _password.text) {
                                  //       Navigator.pushReplacement(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //               builder: (context) =>
                                  //                   HomePage(_email.text)));
                                  //     } else {
                                  //       Fluttertoast.showToast(
                                  //           msg: "Password doesn't match");
                                  //     }
                                  //   } else {
                                  //     Fluttertoast.showToast(
                                  //         msg: "Email doesn't exist");
                                  //   }
                                  //   // _key.currentState.showSnackBar(SnackBar(
                                  //   //     content: Text("Sign in failed")));
                                  // }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Forgot password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                    },
                                    child: Text(
                                      "Create an account",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black),
                                    ))),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "or sign in with",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      "images/ggg.png",
                                      width: 30,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
