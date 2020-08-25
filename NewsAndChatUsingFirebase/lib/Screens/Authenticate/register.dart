import 'package:demo/Shared/constants.dart';
import 'package:demo/Shared/loading.dart';
import 'package:demo/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text state
  String nickname = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: Text('Register'),
              actions: [
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  color: Colors.white,
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter NickName' : null,
                      decoration: boxDecorNickName,
                      autofocus: false,
                      style: const TextStyle(fontSize: 21),
                      onChanged: (val) {
                        setState(() {
                          nickname = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      decoration: boxDecorEmail,
                      autofocus: false,
                      style: const TextStyle(fontSize: 21),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Password should have more than 6 letters'
                          : null,
                      decoration: boxDecorPassword,
                      autofocus: false,
                      style: const TextStyle(fontSize: 21),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth.registerEmail(
                              nickname, email, password);
                          if (result == null) {
                            setState(() => error = 'Email is Not Valid');
                            loading = false;
                          }
                        }
                      },
                      child: Container(
                        decoration: boxDecorSignInAndRegisterButton,
                        padding: const EdgeInsets.fromLTRB(95, 15, 95, 15),
                        child: const Text('Register',
                            style: TextStyle(fontSize: 21)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
