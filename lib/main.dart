import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class LoginPage extends StatefulWidget
{
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin
{
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState()
  {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 300)
    );
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/speed.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(child: Theme(
                data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                child: new Container(
                  padding: const EdgeInsets.all(60.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Email",

                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(padding: const EdgeInsets.only(top: 40.0)),
                      MaterialButton(
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.deepOrangeAccent,
                        textColor: Colors.deepPurple,
                        child: new Text("Login"),
                        onPressed: ()=> {},
                        splashColor: Colors.yellowAccent,
                      )
                    ],
                  ),
                ),
              )
              ),
            ],
          )
        ],
      ),
    );
  }
}