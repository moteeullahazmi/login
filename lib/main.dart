import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(new myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home:new LoginPage(),
        theme: new ThemeData(
            primarySwatch:Colors.indigo
        )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _iconanimationController;
  Animation<double> _iconanimation;
  @override
  void initState(){
    super.initState();
    _iconanimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 300)
    );
    _iconanimation = new CurvedAnimation(
        parent: _iconanimationController,
        curve: Curves.easeOut
    );
    _iconanimation.addListener(()=>this.setState((){}));
    _iconanimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size:_iconanimation.value * 100,
              ),
              new Form(

                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Your Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Your Secret Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top:40.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 60.0,
                          color: Colors.lightBlueAccent[100],
                          textColor: Colors.blue[700],
                          child: new Text("Login"),
                          onPressed: ()=> {} ,
                          splashColor: Colors.redAccent,
                        )
                      ],
                    ),
                  )

              )
            ],
          )
        ],
      ),
    );
  }
}
