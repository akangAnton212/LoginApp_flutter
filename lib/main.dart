import 'package:flutter/material.dart';
import 'package:login_app/setting.dart';
import 'package:login_app/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget{
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _title = "Please Login";
  Widget _screen;
  login _login;
  setting _setting;
  bool _authenticated;

  _MyAppState() {
    _login = new login(onSubmit: (){onSubmit();},);
    _setting = new setting();
    _screen  = _login;
    _authenticated = false;
  }

  void onSubmit() {
    //print("login Dengan Username " + _login.username);
    if(_login.username == 'user' && _login.password == 'password'){
      _setAuthenticated(true);
      print('login');
    }
  }

  void _goHome() {
    print("Ini Home");
    setState((){
      if(_authenticated == true){
        _screen = _setting;
      }else{
        _screen = _login;
      }
    });
  }
  void _logOut() {
    print("Ini Logout");
    _setAuthenticated(false);

  }

  void _setAuthenticated(bool auth){
    setState((){
      if(auth == true){
        _screen = _setting;
        _title = "Welcome";
      }else{
        _screen = _login;
        _title = "Login Dulu";
      }
    });

  }

  @override
  Widget build(BuildContext context){
    return new MaterialApp (
      title: 'Login Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: (){_goHome();}),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){_logOut();})
          ],
        ),
        body: _screen,
      ),
    );
  }
}